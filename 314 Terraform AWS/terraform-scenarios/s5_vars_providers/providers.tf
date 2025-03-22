terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.36.0, <4.47.0, !=4.43.0"
    }
  }
  required_version = "~>1.3"
}

provider "aws" {
  region = "us-east-1"
  # no alias means is the default provider
}

provider "aws" {
  region = "us-east-2"
  alias = "ohio"
}