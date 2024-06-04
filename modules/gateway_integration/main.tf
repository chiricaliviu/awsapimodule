# locals {
#   integration_list = flatten([
#     for method in var.methods : [
#       for func in var.functions : 
#       if length(regexall(lower(method.httpMethod), lower(split("-", func.function_name)[length(split("-", func.function_name)) - 1]))) > 0 :
#       {
#         rest_api_id             = method.restApi
#         resource_id             = method.resource
#         http_method             = method.httpMethod
#         integration_http_method = method.httpMethod
#         type                    = "AWS_PROXY"
#         uri                     = func.lambda_arn
#       }
#     ]
#   ])
# }

# resource "aws_api_gateway_integration" "integration" {
#   rest_api_id             = aws_api_gateway_rest_api.api.id
#   resource_id             = aws_api_gateway_resource.resource.id
#   http_method             = aws_api_gateway_method.method.http_method
#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.lambda.invoke_arn
# }
