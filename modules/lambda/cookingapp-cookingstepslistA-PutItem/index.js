import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { PutCommand, DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import { randomUUID } from "crypto";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  
    const command = new PutCommand({
    TableName: "cookingstepslistA",
    Item: {
      cookingstepslistId: randomUUID(),
      steps: event.steps
    }
  });
  
  const response = await docClient.send(command);
  return response;
};
