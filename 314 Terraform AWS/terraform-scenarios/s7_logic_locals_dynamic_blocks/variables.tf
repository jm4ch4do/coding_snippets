variable "virginia_cidr" {
  default     = "10.10.0.0/16"
  description = "ip range for virginia vm"
  type        = string
  sensitive   = false
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags for project"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parameters of instance"
  type        = map(string)
}

variable "instances"{
  description = "Name of Instances"
  type = set(string)
  default = ["apache"]
}

variable "enable_monitoring"{
  description = "Enables deploy of monitoring server"
  type = bool
  default = false
}