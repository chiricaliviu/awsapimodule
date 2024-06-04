import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, DeleteCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  const command = new DeleteCommand({
    TableName: "dietA",
    Key: {
      dietId: event.dietId,
    },
  });
  try {
    const response = await docClient.send(command);
    console.log(response);
    return response;
  }
  catch(err) {
    return err;
  }

};
