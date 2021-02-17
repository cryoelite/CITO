class Node:
    def __init__(self,data):
        self.data=data
        self.next=None
class LinkList:
    def __init__(self):
        self.head=None
        self.count=0
    def printrAndcountr(self,state):
        temp=self.head
        while temp is not None:
            if state is 1:
                print(temp.data)
            self.count+=1
            temp=temp.next
    def deleteAtIndex(self,index2):
        temp=self.head
        i=1
        while i<=self.count and temp is not None:
          if(index2==self.count and i==index2-1):
            temp.next=None
            break
          if(i==index2-1):
            temp.next=temp.next.next
          temp=temp.next
          i+=1        
ll=LinkList()
ll.head=Node(input())
input1="lol"
temp=ll.head
input1 = input()
while(input1!=""):
    new_node=Node(input1)
    temp.next=new_node
    temp=temp.next
    input1 = input()
ll.printrAndcountr(1)
ll.deleteAtIndex(3)
ll.printrAndcountr(1)