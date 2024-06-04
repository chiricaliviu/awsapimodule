# modules/lambda_roles/main.tf

resource "aws_iam_role" "lambda_roles" {

  for_each = {
    for entry in flatten([
    for policy_index, policy in var.policies : [
      for action_index, action in policy.statement_actions : {
      policy_name = policy.name
      action_name = action    
      }
        
    ]
   ]):"${entry.policy_name}-${entry.action_name}"=> entry}
  name = "${each.value.policy_name}-${each.value.action_name}-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "${each.value.policy_name}-${each.value.action_name}-role"
  }
}


resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachments" {

  for_each = {
    for entry in flatten([
    for policy_index, policy in var.policies : [
      for action_index, action in policy.statement_actions : {
      policy_name = policy.name
      action_name = action 
      policy_arn = policy.arn   
      }
        
    ]
   ]):"${entry.policy_name}-${entry.action_name}"=> entry}
  role = "${each.value.policy_name}-${each.value.action_name}-role"
  policy_arn = each.value.policy_arn

  depends_on = [aws_iam_role.lambda_roles]
  
}

output "lambda_roles_info" {
  value = [
    for role in aws_iam_role.lambda_roles : {
      role_name = join("-", slice(split("-", role.name), 0, 3))
      role_arn  = role.arn
    }
  ]
}


