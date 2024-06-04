resource "aws_api_gateway_resource" "subresource" {
  for_each = {
    for index,subresource in var.resources :  index => subresource
    
  }

  rest_api_id = each.value.gatewayapi
  parent_id   = each.value.resource_id
  path_part   = "items"  
  
}

resource "aws_api_gateway_method" "get_subresource_method" {
  for_each = aws_api_gateway_resource.subresource

  rest_api_id   = each.value.rest_api_id
  resource_id   = each.value.id
  http_method   = "GET"
  authorization = "NONE"
  depends_on = [ aws_api_gateway_resource.subresource ]
}