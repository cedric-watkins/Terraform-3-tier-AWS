variable "bastion_instance_name" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}

variable "ami" {
  type        = string
  description = "the instance ami"
  default     = ""
}

variable "instance_type" {
  description = "the type of instance being deployed"
  type        = string
  default     = ""
}

variable "tg_name" {
  description = "Name of the Loab Balancer Target Group"
  type        = string
  default     = ""
}

variable "lb_name" {
  description = "Name of Load Balancer"
  type        = string
  default     = ""
}

variable "web_lt_name" {
  description = "Name of web launch template"
  type        = string
  default     = ""
}

variable "web_asg" {
  description = "Auto Scaling Group name"
  type        = string
  default     = "web-asg"
}
################################
#Other Module Output Variables
################################
variable "vpc_id" {
  description = "The id of our vpc"
  type        = string
  default     = ""
}

variable "bastion_subnets_id" {
  description = "id of web subnets"
  type        = list(string)
  default     = []
}

variable "web_subnets_id" {
  description = "id of app subnets"
  type        = list(string)
  default     = []
}

variable "bastion_sg_id" {
  description = "id of web security groups"
  type        = string
  default     = ""
}

variable "web_sg_id" {
  description = "id of app security groups"
  type        = string
  default     = ""
}