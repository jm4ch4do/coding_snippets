# ---------------------------- VARIABLES -----------------------------------
# variables are declared in variables.tf and assigned in terraform.tfvars

variable "virginia_cidr"{
  default = "10.10.0.0/16"
}
export TF_VAR_virginia_cidr="10.10.0.0/16"  # export variable in command line
env | grep TF  # muestra variables exportadas
unset TF_VAR_virginia_cidr  # borrar

# variables are be default loaded from files:
terraform.tfvars or *.auto.tfvars or previous_two_plus .json

# you can also load certain variables using:
terraform plan --var-file my_vars.ftvars

# Variable Types are:
string, number, bool(true,false), any(type_by_default), list, map, set, object, tuple

# Examples definition
variable "cidrs_list"{  # list
  default = ["10.10.0.0/16", "10.20.0.0/16"]
  type = list(string)
  sensitive = true  # used to hide output (ex. for passwords)
}
variable "map_cidrs"{  # map
  default = {
    "virginia" = "10.10.0.0/16"
    "ohio" = "10.20.0.0/16"
  }
}
variable "set_list"{  # list
  default = ["10.10.0.0/16", "10.20.0.0/16"]
  type = set(string)
}
variable "virginia"{  # object
  type = object({
    name = string
    amount = number
  })
  default = {
    amount = 1
    cantidad = 1
  }
}
variable "ohio" {  # tuple
  type = tuple([string, number, bool])
  default = ["Ohio", 1, false]
}

# Examples access
var.cidrs_list[0]  # list
var.map_cidrs["ohio"]  # map
lookup(var.cidr, terraform_workspace, var.cidr["default"])  # map
resource "aws_vpc" "vpc" { # set
  for_each = var.set_cidrs 
  cird_block = each.value
  tags = {
    env = "Dev"
  }
}
var.virginia.owner  # object
var.ohio[0]  # tuple

# ------------------------------------- OUTPUT ---------------------------------------
# used to export information from Terraform
# every resource has a section of "Attributes Reference" that can be found in docs
# where we can find values that can be exposed throught outputs
output "linux_public_ip"{
  value = aws_instance.linux.public_ip
  description = "Showing ip address assigned to instance"
}


# -------------------------------------- DATA ---------------------------------------
# data finds resources already existing to be able to use in our terraform
data "aws_key_pair" "key"{
    key_name = "my_key"
}