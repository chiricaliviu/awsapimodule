import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, ScanCommand, GetCommand  } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  // TODO implement
  const type = event.type;
  if( type === 'all') {
    const command = new ScanCommand({
      TableName: "dietA",
  });
  try { 
    const response = await docClient.send(command);

    const items = response.Items.map(dataField => {
      return {  dietId: dataField.dietId,
                dietNameEn: dataField.dietNameEn,
                dietNameRo: dataField.dietNameRo,
                
      }
    });

    return items;
  }
  catch(err) {
    return err;
  }
  
  }
  else if (type !== 'all') {

    const command = new GetCommand({
    TableName: "diet",
    Key: {
      dietId: type,
    },
  });

  const response = await docClient.send(command);
  return response;
  }
  else {
    const response = {
      statusCode: 400,
      Error: "Something went wrong"
    }
    
    return response;
  }


};
