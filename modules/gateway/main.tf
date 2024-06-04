locals {
  methods = ["PUT", "POST", "DELETE", "/"]
}


resource "aws_api_gateway_rest_api" "recipeApi" {
    name = var.api_name
    description = "Terraform created REST API "
}
resource "aws_api_gateway_resource" "gateway_resources" {
    count = length(var.tables)

    rest_api_id = aws_api_gateway_rest_api.recipeApi.id
    parent_id   = aws_api_gateway_rest_api.recipeApi.root_resource_id
    path_part   = var.tables[count.index].table_name    
}

output "gateway_resource_info" {
    value = [
        for resource in aws_api_gateway_resource.gateway_resources : {
            resource_id = resource.id 
            gatewayapi = aws_api_gateway_rest_api.recipeApi.id
        }
    ]
}

output "api_id" {
    value = aws_api_gateway_rest_api.recipeApi.id
}

