provider "aws" {
region = "us-east-2"
}

module "ec2module"{
source = "/root/akhi/akhilTerraformProject/module/ec2"
instancetype = "t2.micro"
ec2name = "my_Ec2"
}

module "s3module"{
source = "/root/akhi/akhilTerraformProject/module/s3"
}

module "vpcmodule"{
source = "/root/akhi/akhilTerraformProject/module/vpc"
mycidr = "10.0.0.0/16"
myVpcName = "akhilVPC"
}

module "sgmodule"{
source = "/root/akhi/akhilTerraformProject/module/sg"
sgname = "akhilSG"
}
