variable "api_name" {
  type    = string
  default = "RecipeAPIV2"
}
variable "tables" {
  description = "List of DynamoDB tables to create"
  type        = list(object({
    table_name   = string
    billing_mode = string
    hash_key     = string
    attribute_name = string
  }))
}