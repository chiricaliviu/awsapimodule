import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, ScanCommand, GetCommand  } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  const type = event.type;

  if (!type) {
    return {
      statusCode: 400,
      body: JSON.stringify({ error: "type is required" })
    };
  }

  if (type === 'all') {
    const command = new ScanCommand({
      TableName: "ingredientslistA",
    });
    try { 
      const response = await docClient.send(command);
      const items = response.Items.map(dataField => {
        return { ingredientslistId: dataField.ingredientslistId, ingredients: dataField.ingredients };
      });

      return {
        statusCode: 200,
        body: JSON.stringify(items)
      };
    } catch(err) {
      return {
        statusCode: 500,
        body: JSON.stringify({ error: err.message })
      };
    }
  } else {
    const command = new GetCommand({
      TableName: "ingredientslistA",
      Key: {
        ingredientslistId: type,
      },
    });

    try {
      const response = await docClient.send(command);

      if (!response.Item) {
        return {
          statusCode: 404,
          body: JSON.stringify({ error: "Item not found" })
        };
      }

      return {
        statusCode: 200,
        body: JSON.stringify(response.Item)
      };
    } catch(err) {
      return {
        statusCode: 500,
        body: JSON.stringify({ error: err.message })
      };
    }
  }
};
