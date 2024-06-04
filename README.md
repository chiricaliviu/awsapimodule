# awsapimodule

Created a dynamic module foar creating an API on the AWS Cloud using Terraform. 

In the tfvars file you need to set up your table information such as name, billing method, hash_key and main atribute.

All the other resources needed are created in a dynamic way based on the input tfvars variables.

So starting with the tables you can dynamically create:
- Policies for the CRUD methods
- Security roles
- AWS lambda functions
- API gateway
- API Resources
- API Subresources
- API Methods

Things to add in the future:
- Gateway models
- Gateway integrations

In regards to make the project work:
- Do not forget to add your own access_key, secret_key and aws region in the variables.tf file
- Every function is represented by it's own NodeJs project. It is needed to run npm init and npm install commands for each function


