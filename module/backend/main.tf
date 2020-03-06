resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.bucket}"
  acl    = "public-read"
versioning {
  enabled = true
 }
lifecycle {
  pervent_destory = true
   }
   server_side_encryption_configuration {
rule {
apply_server_side_encryption_by_default {
sse_algorithm = "AES256"
   }
  }
 }
}

resource "aws_dynamodb_table" "terraform_locks9" {
    name = "var.dynamodbname"
    billing_mode = "${var.billing_mode}"
    hash_key = "${var.hash_key}"

 attribute {
name = "LockID"
type = "S"
 }
}

