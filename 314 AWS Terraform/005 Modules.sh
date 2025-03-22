# ---------------------------------------- MODULES -------------------------------------------------
# Every folder that contains reusable configuration in terraform is a module. 
# By convention they each have a main.tf file.
# You can have a root module with the main configuration. 
# Terraform only reads .tf in current folder, not in subfolders unless referenced.
# Submodules can be defined in subfolders to perform secondary tasks and referenced in root folder.
# modules are a way to share procedure inside an organization or share code globally.
# many modules are provided by terraform and third parties

# module definition (file module/s3/main.tf)
resource "aws_s3_bucket" "cerberus_bucket" {
    bucket = var.bucket_name
}
variable "bucket_name" {
  description = "Bucket name"
  type = string
}
output "s3_bucket_arn" {
  value = aws_s3_bucket.cerberus_bucket.arn
}

# usage from root folder (giving value to defined variable and gathering module output)
module "my_bucket" {
  source = "./modules/s3"
  bucket_name = "uniquename_135792468"
}
output "s3_arn"{
  value = module.my_bucket.arn
}

# YOU CAN ALSO USE MODULES AVAILABLE IN INTERNET
# This is a very popular one to move your tfstate to an s3 bucket
https://registry.terraform.io/modules/cloudposse/tfstate-backend/aws/latest