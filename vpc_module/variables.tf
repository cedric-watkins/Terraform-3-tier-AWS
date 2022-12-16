#####################
#Vpc_Module Variables
#####################
variable "vpc_cidr" {
  description = "Cidr block for vpc"
  type        = string
  default     = ""
}

variable "vpc_tag" {
  description = "The name of the vpc"
  type        = string
  default     = ""
}

variable "igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
  default     = ""
}

variable "nat_tag" {
  description = "The tag used for our NAT gateway"
  default     = ""
}

variable "bastion_subnet_cidr" {
  type    = list(string)
  default = []
}

variable "bastion_subnet_names" {
  type    = list(string)
  default = []
}

variable "web_subnet_cidr" {
  type    = list(string)
  default = []
}

variable "db_subnet_cidr" {
  type    = list(string)
  default = []
}

variable "web_subnet_names" {
  type    = list(string)
  default = []
}

variable "db_subnet_names" {
  type    = list(string)
  default = []
}

variable "db_sub_group_name" {
  description = "name of db subnet group"
  type = string 
  default = ""
}

variable "bastion_route_name" {
  description = "Name of the bastion route table"
  type        = string
  default     = ""
}

variable "web_route_name" {
  description = "Name of the web route table"
  type        = string
  default     = ""
}

variable "db_route_name" {
  description = "Name of the db route tabel"
  type        = string
  default     = ""
}