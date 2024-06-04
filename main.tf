provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


module "dynamodb_table" {
  source = "./modules/dynamodb_table"
  tables = var.dynamodb_table_configs
}

module "dynamodb_table_policies" {
  source = "./modules/dynamodb_table_policies"

  prefix = "cookingapp"  
  region = var.aws_region
  tables = var.dynamodb_table_configs
}

# output "dynamodb_policy_info" {
#   value = module.dynamodb_table_policies.dynamodb_policy_info
# }

module "lambda_roles" {
  source = "./modules/lambda_roles"
  table_names = var.table_names 

  prefix = "cookingapp"  # Replace with your desired prefix

  policies = module.dynamodb_table_policies.dynamodb_policy_info
   
}

# output "lambda_roles_info" {
#   value = module.lambda_roles.lambda_roles_info
# }

module "aws_lambda_functions" {
  source = "./modules/lambda"
  
  roles = module.lambda_roles.lambda_roles_info
}


output "lambda__info" {
  value = module.aws_lambda_functions.lambda__info
}

module "aws_api_gateway" {
  tables = var.dynamodb_table_configs
  source = "./modules/gateway"
}

output "gateway_resource_info" {
  value = module.aws_api_gateway.gateway_resource_info
}

module "aws_gateway_methods" {
  source = "./modules/gateway_methods"
  resources = module.aws_api_gateway.gateway_resource_info
}

module "aws_gateway_subresource" {
  source = "./modules/gateway_subresource"
  resources = module.aws_api_gateway.gateway_resource_info 
}

output "gateway_methods_info" {
  value = module.aws_gateway_methods.gateway_methods_info
}


# module "gateway_integration" {
#   source = "./modules/gateway_integration"
#   methods = module.aws_gateway_methods.gateway_methods_info
#   functions = module.aws_lambda_functions.lambda__info 
# }

