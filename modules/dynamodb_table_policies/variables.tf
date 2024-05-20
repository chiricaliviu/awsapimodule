# modules/dynamodb_table_policies/variables.tf

variable "tables" {
  description = "List of DynamoDB tables to create"
  type        = list(object({
    table_name   = string
    billing_mode = string
    hash_key     = string
    attribute_name = string
  }))
}

# variable "table_names" {
#   type = list(string)
# }
variable "prefix" {
  description = "Prefix to prepend to policy names"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
