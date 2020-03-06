
provider "aws" {
version = "~> 2.0"
region = var.region
}


resource "aws_s3_bucket" "b" {
bucket = var.bucket
acl = var.acl
}

resource "aws_dynamodb_table" "l" {
    name = var.name
    billing_mode = var.billing_mode
    hash_key = var.hash_key

 attribute {
name = "LockID"
type = "S"
 }
}
