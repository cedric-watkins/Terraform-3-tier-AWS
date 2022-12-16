#####################
#Vpc_Module Variables
#####################
variable "vpc_cidr" {
  description = "Cidr block for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tag" {
  description = "The name of the vpc"
  type        = string
  default     = "3-tier-vpc"
}

variable "igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
  default     = "3-tier-igw"
}

variable "nat_tag" {
  description = "The tag used for our NAT gateway"
  default     = "3-tier-ngw"
}

variable "bastion_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "bastion_subnet_names" {
  type    = list(string)
  default = ["bastion_1a", "bastion_1b"]
}

variable "web_subnet_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_subnet_cidr" {
  type    = list(string)
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "db_sub_group_name" {
  description = "name of db subnet group"
  type = string 
  default = "db_subnet_group"
}

variable "web_subnet_names" {
  type    = list(string)
  default = ["web-sub-1a", "web-sub-1b"]
}

variable "db_subnet_names" {
  type    = list(string)
  default = ["db_1a", "db_1b"]
}

variable "bastion_route_name" {
  description = "Name of the bastion route table"
  type        = string
  default     = "bastion_route"
}

variable "web_route_name" {
  description = "Name of the app route table"
  type        = string
  default     = "web_route"
}

variable "db_route_name" {
  description = "Name of the db route table"
  type        = string
  default     = "db_route"
}

################################
#Security_Group Module Variables
################################
variable "bastion_sg_name" {
  description = "Bastion host security group name"
  type        = string
  default     = "bastion-sg"
}

variable "web_sg_name" {
  description = "Web tier security group name"
  type        = string
  default     = "web-sg"
}

variable "db_sg_name" {
  description = "Name of data tier security group"
  type        = string
  default     = "db_sg"
}
################################
#Ec2_Module Variables
################################
variable "bastion_instance_name" {
  type    = string
  default = "bastion-host"
}

variable "key_name" {
  type    = string
  default = "demo_key"
}

variable "ami" {
  type        = string
  description = "the instance ami"
  default     = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  description = "the type of instance being deployed"
  type        = string
  default     = "t2.micro"
}

variable "tg_name" {
  description = "Name of the Loab Balancer Target Group"
  type        = string
  default     = "lb-target"
}

variable "lb_name" {
  description = "Name of Load Balancer"
  type        = string
  default     = "web-lb"
}

variable "web_lt_name" {
  description = "Name of web launch template"
  type        = string
  default     = "web_launch_temp"
}

################################
#Rds_mysql_module Variables
################################
variable "db_name" {
  description = "Name of our db instance"
  type        = string
  default     = "mysqldb"
}