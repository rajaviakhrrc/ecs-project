
provider "aws" {
  region = "ca-central-1"
}

module "backend"{
  source = "/home/ubuntu/myproject/module/backend"

  bucket = "${var.bucket}"
  acl = "${var.acl}"
  name = "${var.name}"
  billing_mode = "${var.billing_mode}"
  hash_key = "${var.hash_key}"
   region = "${var.region}"

}
