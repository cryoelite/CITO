import {
  GetSecretValueCommand,
  SecretsManagerClient,
} from "@aws-sdk/client-secrets-manager";
import { APIGatewayProxyEvent, Handler } from "aws-lambda";
import { Kafka, Partitioners } from "kafkajs";
// import { nanoid } from 'nanoid';

const secretsManagerClient = new SecretsManagerClient({ region: "us-east-2" });

export const handler: Handler = async (event: APIGatewayProxyEvent) => {
  console.log("EVENT: \n" + JSON.stringify(event, null, 2));
  await publishDemoEvent();
};

async function publishDemoEvent() {
  const getSecretValueCommand = new GetSecretValueCommand({
    SecretId: process.env.KAFKA_CREDENTIALS_SECRET_ARN,
  });
  const { SecretString } = await secretsManagerClient.send(
    getSecretValueCommand
  );

  const {
    username,
    password,
    bootstrap_brokers_scram_0: broker0,
    bootstrap_brokers_scram_1: broker1,
  } = JSON.parse(SecretString ?? "");
  console.info(
    `Using SCRAM credentials: ${username} and brokers: [${broker0}, ${broker1}]`
  );
  const kafka = new Kafka({
    clientId: process.env.AWS_APPLICATION_ID,
    brokers: [broker0, broker1],
    ssl: {
      rejectUnauthorized: false,
    },
    sasl: {
      mechanism: "scram-sha-512",
      username,
      password,
    },
  });
  const producer = kafka.producer({
    createPartitioner: Partitioners.DefaultPartitioner,
  });
  await producer.connect();

  console.log(">>> producer.events", producer.events);

  const admin = kafka.admin();
  await admin.connect();
  const topics = await admin.listTopics();
  console.log(">>> Available Topics:", topics);

  // Define the URL of the resource you want to fetch
  const url =
    "https://gvfvs67us0.execute-api.us-east-2.amazonaws.com/prod/branches?sleep=0";

  // Options for the fetch request
  const options = {
    method: "GET", // HTTP Method
    headers: {
      Host: "gvfvs67us0.execute-api.us-east-2.amazonaws.com", // Set the Host header
      // Include any other headers you need here
    },
  };

  const response = await fetch(url, options);
  const result = await response.json();
  const result_status = await response.status;
  const result_headers = await response.headers;
  console.log("Status Code:", result_status);
  console.log("Headers:", result_headers);
  console.log(">>> result", result);

  // don't delete this, just commenting out for now
  // const message = {
  //   timestamp: Date.now(),
  //   sub: 'kyle.banner@slalom.com',
  //   message: `issa message ${nanoid()}`,
  // };

  // await producer.send({
  //   topic: 'my-example-topic-2',
  //   messages: [
  //     {
  //       key: String(message.timestamp),
  //       value: JSON.stringify(message),
  //     },
  //   ],
  // });
}
