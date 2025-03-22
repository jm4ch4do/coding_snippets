# ---------------------  BASICS TERRAFORM -----------------------------
Infrastructure_as_code  # Automatizes deploys with code
Agnostic  # can work with any cloud provider 
Declarative  # what you want to see at the end (not how to install or order)
Inmutables  # changes likely imply to destroy and create again

# Infrastructure as code approaches
#    Soft Provision         Templates Inmutables    Infrastructure Provision                   
# (Packages and Code)       (Pre-configured vms)   (creates vms and networks)
      ainsible                     Docker                   Terraform
       puppet                 Packer, Vagrant           AWS CloudFormation

# INSTALL WINDOWS
choco install terraform  # in powershell as admin
terraform --version

# Course repo
https://github.com/terraformdpac/practica-terraform


# -------------------------------- USEFUL LINKS ---------------------------------------
https://registry.terraform.io/browse/providers  # block types for aws provider
https://developer.hashicorp.com/terraform/docs/glossary  # terraform glosary
https://app.diagrams.net/  # dibujar diagrama de red

# Terraform code tools
https://github.com/infracost/infracost  # cmd and vscode tool to calculate costs
https://github.com/aquasecurity/tfsec  # scans terraform code for security problems
https://github.com/terraform-linters/tflint  # improved version of terraform validate
https://github.com/tfutils/tfenv  # improved terraform version management


# -------------------------------------- STATE ---------------------------------------
# The terraform.tfstate file is created by terraform to store the deployed config
# When we do terraform plan, terraform compares the state with what is deployed and with
# our plan to conclude what needs to be added, changed or destroyed.
# If we delete or move our tfstate file, terraform will generate resources again.
# Thus is recommended to keep the tfstate in a centralized s3 bucket to be able to
# work from different stations on the same infrastructure.
# el tfstate nunca debe subirse a un repositorio pues contiene informacion sensible.


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
terraform apply --replace aws_instance.public_instance  # destroys and creates resource
terraform destroy  # deletes everything found in the state
terraform destroy  --target=aws_instance.public_instance  # deletes only target
terraform taint  # marks for create/destroy in next plan 
terraform untaint  # unmarks for create/destroy in next plan 

terraform console  # enters terraform console to use as playground for functions
terraform show  # see details of created resources
terraform fmt  # formats all files (formatting is not require to work)
terraform validate  # validates syntax
terraform output  # shows outputs
terraform output name_of_output  # targets specific output
terraform providers  # shows providers
terraform refresh  # looks for changes in deployment to update tfstate
                   # is included in terraform plan

terraform graph  # lists resources and dependencies 
terraform graph | dot -Tsvg > graph.svg  # saves graph to visible format
terraform state list  # summarized list of deployed resources (shows taint)
terraform state show aws_instance.public_instance  # details of resource
terraform state mv SOURCE DESTINATION  # move resources (avoids delete and destroy)
terraform state mv aws_subnet.public aws_subnet.public_default  # renames subnet
terraform state rm aws_subnet.public  # deletes resource from terraform_state
terraform state pull  # downloads state from remote

terraform workspace list  # shows workspaces (is like venv)
terraform workspace new prod  # new workspace called "prod"
terraform workspace select default  # goes back to default workspace
terraform workspace delete prod


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

# ---------------------------------------- DEBUG -------------------------------------------------
# Log levels are from lower details to max detail: Info, Warning, Error, Debug, Trace
# Debug level can be set with an environment variable
env | grep TF_LOG  # check if env variable is set
export TF_LOG=TRACE  # set to maximun debug level
terraform plan  # will now display a huge amount of information
unset TF_LOG  # to disable logging

export TF_LOG_PATH=terra_log.txt  # stores logs in file


# ---------------------------------------- IMPORT -------------------------------------------------
# Import elements created outside of terraform
# If you create a vm manually, you need to have an empty resource in terraform to import to:
resource "aws_instance" "mywebserver"{
}

# then you can import using the vm id
terraform import aws_instance.mywebserver i-009bdc745446954c4

# this will populate the terraform state but the resource will still be empty in terraform
terraform state show aws_instance.mywebserver  # copy resource info from output of command
# and paste into terraform resource
# you'll have to eliminate many parameters that are read only but after that is fully imported


# -----------------------------  TERRAFORM CLOUD -------------------------------------
# Terraform cloud offers an alternative to store the state in S3 and control concurrent
# access with DynamoDB. 
# 1. It also adds remote execution (user no longer needs to install terraform)
# 2. Management of queue and permissions
# 3. Integration with Github
# 4. Management of secrets and variables
# 5. Web interface to visualize plans and states
