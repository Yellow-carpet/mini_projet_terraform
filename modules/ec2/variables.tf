#TP4 avec la surcharge des variables
variable "instancetype" {
  default = "t2.nano"
}

variable "ami" {
  default = "ami-04505e74c0741db8d"
}

variable "tag_info" {
  type = object({
    Name = string
    iac  = string
  })

  default = {
    Name = "sofiane_ec2_terraform"
    iac  = "terraform"
  }
}

variable "sg_id"{
  default = ""
}
