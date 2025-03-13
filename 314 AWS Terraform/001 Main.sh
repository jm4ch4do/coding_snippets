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

# block types for aws provider can be found in:
# https://registry.terraform.io/browse/providers
# We are mainly going to use local-provider and aws-provider

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
terraform destroy  # deletes everything found in the state
terraform show  # see created resources

terraform fmt  # formats all files (formatting is not require to work)
terraform validate  # validates syntax
terraform output  # shows outputs
terraform output name_of_output  # targets specific output


# ----------------------- SPECIFYING VERSIONS ------------------------------
0.15.0  # exactly 0.15.0
>=0.15  # any version equal or greater
~>0.15.0  # any equal or higher but avoid over v1.0 (major change)
">=4.36.0, <4.47.0, !=0.43.0"  # multiple condition

