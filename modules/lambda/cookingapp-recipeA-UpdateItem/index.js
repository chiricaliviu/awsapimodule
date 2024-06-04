import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  const command = new UpdateCommand({
    TableName: "recipeA",
    Key: {
      "recipeId": event.recipeId,
    },
    UpdateExpression: "set dietId = :newdietId , descriptionEn = :newdescriptionEn , descriptionRo =  :newdescriptionRo, ingredientslistId = :newingredientslistId, titleEn = :newtitleEn, titleRo = :newtitleRo , cookingstepslistId = :newcookingstepslist",
    ExpressionAttributeValues: {
      ":newdietId": event.dietId,
      ":newdescriptionEn": event.descriptionEn,
      ":newdescriptionRo": event.descriptionRo,
      ":newingredientslistId": event.ingredientslistId,
      ":newtitleEn" : event.titleEn,
      ":newtitleRo" : event.titleRo,
      ":newcookingstepslist": event.cookingstepslistId
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);
  console.log(response);
  return response;

};
