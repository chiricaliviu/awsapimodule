locals {
  methods_list = ["PUT", "POST", "DELETE"]

  method_info_list = flatten([
    for resource in var.resources :
    [
        for method in local.methods_list : {
            rest_api_id   = resource.gatewayapi
            resource_id   = resource.resource_id
            http_method   = method
            
        }
    ]
  ])
}

resource "aws_api_gateway_method" "gateway_methods" {
  for_each = { for idx, info in local.method_info_list : idx => info }

  rest_api_id   = each.value.rest_api_id
  resource_id   = each.value.resource_id
  http_method   = each.value.http_method
  authorization = "NONE" 
}

output "gateway_methods_info" {
  value = [for method in aws_api_gateway_method.gateway_methods:
    { 
      restApi = method.rest_api_id
      resource = method.resource_id
      hhtpMethod = method.http_method
    }
  
  ]
}
