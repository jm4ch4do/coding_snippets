# ---------------------  BASICS TERRAFORM -----------------------------
Infrastructure_as_code  # Automatizes deploys with code
Agnostic  # can work with any cloud provider 
Declarative  # what you want to see at the end (not how to install or order)
Inmutables  # changes likely imply to destroy and create again

# Infrastructure as code approaches
#    Soft Provision          Templates Inmutables   Infrastructure Provision                   
# (Packages and Code)       (Pre-configured vms)   (creates vms and networks)
      ainsible                     Docker                   Terraform
       puppet                 Packer, Vagrant           AWS CloudFormation

# INSTALL WINDOWS
choco install terraform  # in powershell as admin
terraform --version

# Course repo
https://github.com/terraformdpac/practica-terraform


# ------------------------- BLOCK TYPES ---------------------------------
# HCL (Terraform uses mainly this language thought it also support json)
# HCL is based in defining block types
block_type "provider_resource-type" "name_of_resource" {
    argument1 = "value of argument"
}

# Block types are:
provider  # Defines cloud providers (AWS, Azure, GCP, etc.).
resource  # Creates and manages infrastructure components (e.g., VMs, databases).
module  # Reusable groups of resources for modular infrastructure.
variable  # Declares input variables for flexibility
output  # Defines outputs to display after terraform apply
terraform  # Configures backend state, required versions, etc
data  # Reads external information (e.g., fetching AMI IDs from AWS)


# --------------------------- COMMANDS ----------------------------------
terraform init  # connects to provider and inits terraform folder
terraform init --upgrade  # allows downloading new versions to meet requirements
terraform plan  # creates a plan with actions to execute
terraform plan -out s3.plan  # saves plan
terraform apply  # creates plan and executes it
terraform apply "s3.plan"  # executes saved plan
terraform apply --auto-approve=true  # skips verification question
terraform apply --target aws_subnet.public_subnet  # targets specific resource
terraform destroy  # deletes everything found in the state

terraform show  # see created resources
terraform fmt  # formats all files (formatting is not require to work)
terraform validate  # validates syntax
terraform output  # shows outputs
terraform output name_of_output  # targets specific output
terraform providers  # shows providers
terraform refresh  # looks for changes in deployment to update tfstate
                   # is included in terraform plan

terraform graph  # lists resources and dependencies 
terraform graph | dot -Tsvg > graph.svg  # saves graph to visible format
terraform state list  # lists deployed resources
terraform state show aws_instance.public_instance  # details of resource
terraform state mv SOURCE DESTINATION  # move resources (avoids delete and destroy)
terraform state mv aws_subnet.public aws_subnet.public_default  # renames subnet
terraform state rm aws_subnet.public  # deletes resource from terraform_state


# ----------------------- SPECIFYING VERSIONS ------------------------------
0.15.0  # exactly 0.15.0
>=0.15  # any version equal or greater
~>0.15.0  # any equal or higher but avoid over v1.0 (major change)
">=4.36.0, <4.47.0, !=0.43.0"  # multiple condition


# -------------------------------- DEPENDENCIES ----------------------------------------
# IMPLICIT
# As a declarative language, terraform infers what needs to be created first
# For example, a subnet will be created first than the VM which is inside it.
# That's an implicit relationship between both based on the declarative config

# EXPLICIT
# There is also a way to specify which element will be created first in cases
# where the order of creation is not force by implicit relationships
resource "aws_subnet" "private_subnet" {
    ...
    depends_on = [ aws_subnet.public_subnet ]
}


# -------------------------------- USEFUL LINKS ---------------------------------------
https://registry.terraform.io/browse/providers  # block types for aws provider
https://developer.hashicorp.com/terraform/docs/glossary  # terraform glosary
https://app.diagrams.net/  # dibujar diagrama de red


# -------------------------------------- STATE ---------------------------------------
# The terraform.tfstate file is created by terraform to store the deployed config
# When we do terraform plan, terraform compares the state with what is deployed and with
# our plan to conclude what needs to be added, changed or destroyed.
# If we delete or move our tfstate file, terraform will generate resources again.
# Thus is recommended to keep the tfstate in a centralized s3 bucket to be able to
# work from different stations on the same infrastructure.
# el tfstate nunca debe subirse a un repositorio pues contiene informacion sensible.


# ------------------------------------ LIFE CYCLE ------------------------------------
# Alters the way terraform works with deployments
resource "aws_instance" "public_instance" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  lifecycle {
    create_before_destroy = true  # creates new instance before destroying 
                                  # if a changes requires to create/destroy
  }
}

lifecycle {revent_destroy = true}  # if new plan requires destroy, it will return error and prevent execution
lifecycle {ignore_changes = [ami]}  # prevents any changes in the ami argument
lifecycle {replace_triggered_by = [aws_subnet=private_subnet]}  # forces create/destroy if subnet changes




