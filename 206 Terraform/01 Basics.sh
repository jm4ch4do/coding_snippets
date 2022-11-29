"------------------------CONCEPTS-------------------------"
# Infrastructure as code (IaC): Provisioning infrastructure through
# software to achiveve consistent and predictable deployments

# Terraforms allows automating the deployment of infrastructure in 
# multiple providers both from public and private cloud

# Terraform uses declarative approach, meaning it defines JSONs and 
# other data structures to declare what it wants to do, instead of
# using function and parameters which will be an imperative approach
# Terraform uses HCL (HashiCorp Configuration Languague) that is a 
# simplified version of JSON which is easier to read and supports
# inline comments.

# Terraform is Idempotent: If you make changes for your environment
# once it will work but if you try again it will let you know that
# this changes already occurred so is like Terraform has some kind
# of intelligence to avoid making mistakes

# Why use Terraform:
# Automated Deployement
# Repeatable Process
# Consistent environments
# Reusable components
# Documented architecture


"------------------------INSTALL-------------------------"
# You can find the installer info for Terraform here:
https://www.terraform.io/downloads.html

# And a short video on how to install using chocolatey
# package manager for Windows here
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

# Verify Terraform is installed
terraform version

# Get list of all commands
terraform


"------------------------HELP-------------------------"
terraform -help

# arguments and attributes for resources in the AWS provider
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

"------------------------TERRAFORM OBJECTS-------------------------"
Providers -> AWS, Azure, ...
Resources -> Virtual Network, Database ...
Data Sources -> A way to query information from a provider
                ex. List of availability zones, ...

# Both resources and Data Sources are associated with a provider
