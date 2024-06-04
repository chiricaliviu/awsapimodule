variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "access_key" {
  type    = string
  default = "INSERT HERE"
}

variable "secret_key" {
  type    = string
  default = "INSERT HERE"
}



variable "path_diet" {
  type    = string
  default = "diet"
}

variable "path_ingredient" {
  type    = string
  default = "ingredient"
}
variable "path_ingredientslist" {
  type    = string
  default = "ingredientslist"
}
variable "path_cookingstep" {
  type    = string
  default = "cookingstep"
}
variable "path_cookingstepslist" {
  type    = string
  default = "cookingstepslist"
}
variable "path_recipe" {
  type    = string
  default = "recipe"
}

# variables.tf

# variable "dynamodb_table_configs" {
#   description = "Configuration for DynamoDB tables"
#   type        = list(object({
#     table_name    = string
#     billing_mode  = string
#     hash_key      = string
#     attribute_name = string
#   }))
# }
variable "dynamodb_table_configs" {
  description = "List of DynamoDB tables to create"
  type        = list(object({
    table_name   = string
    billing_mode = string
    hash_key     = string
    attribute_name = string
  }))
}
variable "table_names" {
  description = "List of DynamoDB tables to create policies for"
  type        = list(string)
}
# variable "resources" {
#   description = "List contains "
#   type        = list(object({
#     resource_id   = string
#     gatewayapi = string

#   }))
# }