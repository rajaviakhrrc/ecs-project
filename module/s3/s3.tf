resource "aws_s3_bucket" "myS3Bucket" {
bucket = "${var.my_S3_Bucket}"
acl = "private"
}
