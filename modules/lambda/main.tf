# locals {
#   roles_map = { for role in var.roles : role.role_name => role }
# }

# resource "aws_lambda_function" "aws_lambda_functions" {

#   for_each = local.roles_map

#   function_name = each.key
#   role          = each.value.arn
#   handler       = "index.handler"
#   runtime       = "nodejs18.x"
#   filename      = "${path.module}/archives/${each.key}.zip"
#   source_code_hash = filebase64sha256("${path.module}/archives/${each.key}.zip")


  
# }