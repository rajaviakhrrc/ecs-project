resource "aws_dynamodb_table" "mydynamodb" {
name = "${var.dynamodbName}"
hash_key = "LockID"
attribute {
name = "LockID"
type = "S"
}
}
