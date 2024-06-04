locals {
  # Create a map from the roles list
  roles_map = { for role in var.roles : role.role_name => role }

  # Extract and sort the role names
  sorted_role_names = sort([for role in var.roles : role.role_name])

  # Reconstruct the list of roles based on sorted role names
  sorted_lambda_roles = [for name in local.sorted_role_names : local.roles_map[name]]
}

data "archive_file" "lambda_zips" {
  for_each = {
    for role in var.roles : role.role_name => role
  }

  type        = "zip"
  source_dir  = "${path.module}/${each.key}"
  output_path = "${path.module}/archives/${each.key}.zip"
  
}
resource "aws_lambda_function" "aws_lambda_functions" {

  for_each = local.roles_map

  function_name = each.key
  role          = each.value.role_arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  filename      = "${path.module}/archives/${each.key}.zip"
  source_code_hash = filebase64sha256("${path.module}/archives/${each.key}.zip")
  
}

output "sorted_lambda_roles" {
  value = local.sorted_lambda_roles
}

output "lambda__info" {
  value = [
    for lambda in aws_lambda_function.aws_lambda_functions : {
      lambda_arn = lambda.arn 
      function_name = lambda.function_name 
    }
  ]
}