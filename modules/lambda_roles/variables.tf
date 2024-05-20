# modules/lambda_roles/variables.tf

# variable "policies" {
#   description = "List of policies to create roles for"
#   type        = list(object({
#     table_name = string
#     operation  = string
#     policy_arn = string
#   }))
# }

variable "policies" {
  type = list(object({
    name              = string
    arn               = string
    statement_actions = list(string)
  }))
}

variable "prefix" {
  description = "Prefix to prepend to role names"
  type        = string
}

variable "table_names" {
  description = "List of DynamoDB tables to create policies for"
  type        = list(string)
}
