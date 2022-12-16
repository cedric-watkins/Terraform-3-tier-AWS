variable "bastion_sg_name" {
  description = "Bastion security group name"
  type        = string
  default     = ""
}

variable "web_sg_name" {
  description = "Web security group name"
  type        = string
  default     = ""
}

variable "db_sg_name" {
  description = "Name of data tier security group"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The id of our vpc"
  type        = string
  default     = ""
}

