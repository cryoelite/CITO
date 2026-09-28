import hashlib
"""
A library that holds various functions useful for hashing.
"""
import requests
"""
Simple and elegant HTTP library for Python.
"""
from uuid import uuid4
"""
Creates immutable UUID objects, generates a unique id per call.
"""
from time import time
"""
This module provides various time-related functions. 
"""
import json
"""
Allows parsing of JSON objects in Python.
"""
from flask import Flask, jsonify, request
"""
Flask is a Python web framework built with a small core and easy-to-extend philosophy.
"""
from urllib.parse import urlparse
"""
Allows parsing of urls in Python.
"""
class Blockchain:
    def __init__(self):
        self.nodes = set()
        self.current_transactions = list()
        self.chain = list()
        self.create_block(previous_hash='1', proof=100)
    """
    Default Constructor for our Blockchain
    """
    def create_transaction(self, sender, recipient, amount):
        self.current_transactions.append({
        'sender': sender,
        'recipient': recipient,
        'amount': amount,
        })
        return self.last_block['index'] + 1
    """
    Creates a transaction
    """
    def conflict_resolver(self):
        neighbours = self.nodes
        new_chain = None
        max_length = len(self.chain)
        for node in neighbours:
            response = requests.get(f'http://{node}/chain')
            if response.status_code == 200:
                length = response.json()['length']
                chain = response.json()['chain']
                if length > max_length and self.chain_validator(chain):
                    max_length = length
                    new_chain = chain
        if new_chain:
            self.chain = new_chain
            return True
        return False
    """
    In case of conflict, this block will calculate the proof of work hashes and then for valid chains compare their length and choose the longest chain
    """
    def create_block(self, proof, previous_hash):
        block = {
            'index': len(self.chain) + 1,
            'timestamp': time(),
            'transactions': self.current_transactions,
            'proof': proof,
            'previous_hash': previous_hash or self.create_hash(self.chain[-1]),
        }
        self.current_transactions = []
        self.chain.append(block)
        return block
        
    
    def node_register(self, address):
        parsed_url = urlparse(address)
        if parsed_url.netloc:
            self.nodes.add(parsed_url.netloc)
        elif parsed_url.path:
            self.nodes.add(parsed_url.path)
        else:
            raise ValueError('Invalid URL')

    @property
    def last_block(self):
        return self.chain[-1]

    @staticmethod
    def create_hash(block):
        block_string = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_string).hexdigest()

    def proofOfWork(self, last_block):
        last_proof = last_block['proof']
        last_hash = self.create_hash(last_block)
        proof = 0
        while self.proof_validator(last_proof, proof, last_hash) is False:
            proof += 1
        return proof

    @staticmethod
    def proof_validator(last_proof, proof, last_hash):
        guess = f'{last_proof}{proof}{last_hash}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        return guess_hash[:4] == "0000"

    def chain_validator(self, chain):
        last_block = chain[0]
        current_index = 1
        while current_index < len(chain):
            block = chain[current_index]
            print(f'{last_block}')
            print(f'{block}')
            print("\n---------\n")
            last_block_hash = self.create_hash(last_block)
            if block['previous_hash'] != last_block_hash:
                return False
            if not self.proof_validator(last_block['proof'], block['proof'], last_block_hash):
                return False
            last_block = block
            current_index += 1
        return True

app = Flask(__name__)
node_identifier = str(uuid4()).replace('-', '')
blockchain = Blockchain()

@app.route('/mine', methods=['GET'])
def mine_block():
    last_block = blockchain.last_block
    proof = blockchain.proofOfWork(last_block)
    blockchain.create_transaction(
        sender="0",
        recipient=node_identifier,
        amount=1,
    )
    previous_hash = blockchain.create_hash(last_block)
    block = blockchain.create_block(proof, previous_hash)
    response = {
        'message': "New Block Forged",
        'index': block['index'],
        'transactions': block['transactions'],
        'proof': block['proof'],
        'previous_hash': block['previous_hash'],
    }
    return jsonify(response), 200

@app.route('/transactions/new', methods=['POST'])
def add_transaction():
    values = request.get_json()
    required = ['sender', 'recipient', 'amount']
    if not all(k in values for k in required):
        return 'Missing values', 400
    index = blockchain.create_transaction(
        values['sender'], values['recipient'], values['amount'])
    response = {'message': f'Transaction will be added to Block {index}'}
    return jsonify(response), 201

@app.route('/chain', methods=['GET'])
def full_blockchain():
    response = {
        'chain': blockchain.chain,
        'length': len(blockchain.chain),
    }
    return jsonify(response), 200

@app.route('/nodes/register', methods=['POST'])
def node_register():
    values = request.get_json()
    nodes = values.get('nodes')
    if nodes is None:
        return "Error: Please supply a valid list of nodes", 400
    for node in nodes:
        blockchain.node_register(node)
    response = {
        'message': 'New nodes have been added',
        'total_nodes': list(blockchain.nodes),
    }
    return jsonify(response), 201

@app.route('/nodes/resolve', methods=['GET'])
def generate_consensus():
    replaced = blockchain.conflict_resolver()
    if replaced:
        response = {
            'message': 'Our chain was replaced',
            'new_chain': blockchain.chain
        }
    else:
        response = {
            'message': 'Our chain is authoritative',
            'chain': blockchain.chain
        }

    return jsonify(response), 200
if __name__ == '__main__':
    from argparse import ArgumentParser
    argParser = ArgumentParser()
    argParser.add_argument('-p', '--port', default=5000,
                        type=int, help='port to listen at')
    arguments = argParser.parse_args()
    currentPort = arguments.port
    app.run(host='0.0.0.0', port=currentPort)
