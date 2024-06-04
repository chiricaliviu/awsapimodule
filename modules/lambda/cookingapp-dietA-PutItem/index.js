import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { PutCommand, DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import { randomUUID } from "crypto";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  
  const command = new PutCommand({
    TableName: "dietA",
    Item: {
      dietId: randomUUID(),
      dietNameEn: event.dietNameEn,
      dietNameRo: event.dietNameRo
    }
  });

  const response = await docClient.send(command);

  return response;
};
