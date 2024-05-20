resource "aws_dynamodb_table" "dynamodb_table" {
  count = length(var.tables)

  name           = var.tables[count.index].table_name
  billing_mode   = var.tables[count.index].billing_mode
  hash_key       = var.tables[count.index].hash_key

  attribute {
    name = var.tables[count.index].hash_key
    type = "N"
  }

  tags = {
    Name = var.tables[count.index].table_name
  }
}

# Output policy names
output "dynamodb_table" {
  value = [for i in aws_dynamodb_table.dynamodb_table : i.name]
}