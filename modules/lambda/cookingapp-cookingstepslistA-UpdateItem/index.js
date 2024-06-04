import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  
  const command = new UpdateCommand({
    TableName: "cookingstepslistA",
    Key: {
      "cookingstepslistId": event.cookingstepslistId,
    },
    UpdateExpression: "set steps = :newsteps",
    ExpressionAttributeValues: {
      ":newsteps": event.steps
    },
    ReturnValues: "ALL_NEW",
  });
  
  const response = await docClient.send(command);
  console.log(response);
  return response;

};
