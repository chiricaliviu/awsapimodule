import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  
  const command = new UpdateCommand({
    TableName: "ingredientslistA",
    Key: {
      "ingredientslistId": event.ingredientslistId,
    },
    UpdateExpression: "set ingredients = :newIngredients",
    ExpressionAttributeValues: {
      ":newIngredients": event.ingredients
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);

  return response;

};
