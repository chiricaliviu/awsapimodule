# modules/dynamodb_table_policies/main.tf

locals {
  crud_operations = ["Insert", "Read", "Update", "Delete"]
}

data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "dynamodb_table_policies" {
  count = length(var.tables)  # Outer loop count

  name        = "${var.prefix}-${var.tables[count.index].table_name}-policy"
  description = "Policy for operations on ${var.tables[count.index].table_name} table"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      for op_index, operation in local.crud_operations :  # Inner loop
      {
        Effect   = "Allow"
        Action   = flatten([
          # If CRUD operation is "Insert", allow "PutItem" action
          operation == "Insert" ? ["dynamodb:PutItem"] : [],
          # If CRUD operation is "Read", allow "GetItem" action
          operation == "Read" ? ["dynamodb:GetItem"] : [],
          # If CRUD operation is "Update", allow "UpdateItem" action
          operation == "Update" ? ["dynamodb:UpdateItem"] : [],
          # If CRUD operation is "Delete", allow "DeleteItem" action
          operation == "Delete" ? ["dynamodb:DeleteItem"] : [],
        ])
        Resource = "arn:aws:dynamodb:${var.region}:${data.aws_caller_identity.current.account_id}:table/${var.tables[count.index].table_name}"
      }
    ]
  })
}
# Output policy names
output "dynamodb_policy_names" {
  value = [for i in aws_iam_policy.dynamodb_table_policies : i.name]
}

output "dynamodb_policy_info" {
  value = [
    for policy in aws_iam_policy.dynamodb_table_policies : {
      name        = join("-", slice(split("-", policy.name), 0, 2))
      arn         = policy.arn
      statement_actions = flatten([
        for statement in jsondecode(policy.policy).Statement : 
          [for action in statement.Action : 
            split(":", action)[1]
          ]
      ])
    }
  ]
}

# output "dynamodb_policy_actions" {
#   value = tolist(flatten([
#     for statement in aws_iam_policy.dynamodb_table_policies[*].policy.Statement : 
#       [
#         for action in statement.Action : 
#         if action != null => action
#       ]
#   ]))
# }