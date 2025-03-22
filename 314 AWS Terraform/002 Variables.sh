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


# -------------------------------------- LOCALS ---------------------------------------
# file locals.tf generally but could go anywhere
# locals are the same as variables but with a shorter scope. They are internal to modules.
# Can no be passed from CLI or modified during runtime. Generally, variables are made to be
# modified by user and locals to be constant or pre-calculated values.
locals{
  suffix = "cerberus${var.tags.project}=${var.tags.env}-${var.tags.region}"  # calculated value
  iac = "terraform"  # fix value
}
${local.suffix}  # place like this in resources


# -------------------------------------- DYNAMIC BLOCKS ---------------------------------------
# In some cases, like when defining rules for security groups, you have to repeat blocks multiples times.
# Dynamic blocks allow you to set the fix part and pass values to the variable part

# variable with 5 ingress blocks
variable "ingress_rules" {
  description = "List of security group ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["10.0.0.0/16"] }
  ]
}

# resource is created without repeating the ingress block many times
resource "aws_security_group" "example" {
  name = "my-security-group"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}