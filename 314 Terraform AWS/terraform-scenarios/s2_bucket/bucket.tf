terraform {
  required_providers {
    source = "hashicorp/aws"
    version = "~>4"
  }
  required_version = "1.3.6"
}

resource "aws_s3_bucket" "providers" {
  bucket = "m4ch4do-providers"
  
  tags = {
    Owner = "Jose"
    Environment = "Dev"
  }
  
}