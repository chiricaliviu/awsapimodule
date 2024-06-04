import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, DeleteCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  const command = new DeleteCommand({
    TableName: "ingredientslistA",
    Key: {
      ingredientslistId: event.ingredientslistId,
    },
  });
  try {
    const response = await docClient.send(command);
    
    return response;
  }
  catch(err) {
    return err;
  }

};
