resource "aws_api_gateway_model" "gateway_model" {
  for_each    = { for model in var.models : model.name => model }
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  name        = each.value.name
  description = each.value.description
  content_type = each.value.content_type
  schema      = each.value.schema
}