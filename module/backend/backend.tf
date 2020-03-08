terraform {
backend "s3" {
bucket = "akhilreddyS3bucket0608"
key = "global/s3/terraform.tfstate"
region = "us-east-2"

dynamodb_table = "akhilreddyDynamoDb0608"
encrypt = true
}
}

