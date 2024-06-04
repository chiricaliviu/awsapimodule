import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { PutCommand, DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import { randomUUID } from "crypto";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  
  const command = new PutCommand({
    TableName: "ingredientA",
    Item: {
      ingredientId: randomUUID(),
      ingredientNameEn: event.ingredientNameEn,
      ingredientNameRo: event.ingredientNameRo
    }
  });

  const response = await docClient.send(command);


  return response;
};
