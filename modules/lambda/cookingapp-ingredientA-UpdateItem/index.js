import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  
  const command = new UpdateCommand({
    TableName: "ingredientA",
    Key: {
      "ingredientId": event.ingredientId,
    },
    UpdateExpression: "set ingredientNameEn = :newIngredientNameEn, ingredientNameRo = :newIngredientNameRo",
    ExpressionAttributeValues: {
      ":newIngredientNameEn": event.ingredientNameEn,
      ":newIngredientNameRo": event.ingredientNameRo
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);

  return response;

};
