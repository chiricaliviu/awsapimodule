import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  
  const command = new UpdateCommand({
    TableName: "cookingstepA",
    Key: {
      "cookingstepId": event.cookingstepId,
    },
    UpdateExpression: "set cookingsteptext = :newcookingsteptext, cookingstepindex = :newcookingstepindex",
    ExpressionAttributeValues: {
      ":newcookingsteptext": event.cookingsteptext,
      ":newcookingstepindex": event.cookingstepindex
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);

  return response;

};
