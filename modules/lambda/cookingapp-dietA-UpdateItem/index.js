import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  const command = new UpdateCommand({
    TableName: "dietA",
    Key: {
      "dietId": event.dietId,
    },
    UpdateExpression: "set dietNameEn = :newDietNameEn, dietNameRo = :newDietNameRo",
    ExpressionAttributeValues: {
      ":newDietNameEn": event.dietNameEn,
      ":newDietNameRo": event.dietNameRo
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);
  console.log(response);
  return response;

};
