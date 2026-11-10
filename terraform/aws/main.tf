provider "aws" {
  region = "us-east-1"
}

# شبكة AWS آمنة ومطابقة لمعايير Zero Trust
resource "aws_vpc" "multicloud_aws_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "MultiCloud-AWS-LandingZone"
    Environment = "Production"
    Framework   = "ZeroTrust"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.multicloud_aws_vpc.id
  ingress = []
  egress  = []

  tags = {
    Name = "Default-SG-Restricted-ZeroTrust"
  }
}