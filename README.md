# awsapimodule
Currently it is still work in progress.
Currently the dynamic creation works for:
- tables
- policies
- security roles

Created a dynamic module foar creating an API on AWS, in this example i use the api to create a recipe api.

In the tfvars file you need to set up your table information such as name, billing method, hash_key and main atribute.

All the other resources needed are created in a dynamic way based on the input tfvars variables.

So starting with the tables you can dynamically create:
- Policies for the CRUD methods
- Security roles
- AWS lambda functions
- API gateway with resources, methods and models.
  
