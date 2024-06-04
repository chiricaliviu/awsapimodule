import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { PutCommand, DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import { randomUUID } from "crypto";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  
  const command = new PutCommand({
    TableName: "recipeA",
    Item: {
      recipeId: randomUUID(),
      dietid: event.dietid,
      descriptionEn: event.descriptionEn,
      descriptionRo: event.descriptionRo,
      ingredientslistId: event.ingredientslistId,
      titleEn : event.titleEn,
      titleRo : event.titleRo,
      cookingstepslistId: event.cookingstepslistId
    }
  });

  const response = await docClient.send(command);

  // const response = {
  //   statusCode: 200,
  //   body: JSON.stringify('Hello from Lambda!'),
  // };
  return response;
};
