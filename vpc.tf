terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  access_key = "AKIARI2KGH5WZNBIRSOT"
  secret_key = "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"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
