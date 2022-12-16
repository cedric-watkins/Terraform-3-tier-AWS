variable "username" {
  type      = string
  default   = "Admin"
  sensitive = "true"
}

variable "password" {
  type      = string
  default   = "pass2022"
  sensitive = "true"
}

variable "db_name" {
  description = "Name of our db instance"
  type        = string
  default     = ""
}

variable "db_sg_id" {
  description = "The id of our db security group"
  type        = string
  default     = ""
}

variable "db_subnet_group" {
  description = "db subnet group id/name"
  type = string 
  default = ""
}

variable "db_sub_group_name" {
  description = "name of db subnet group"
  type = string 
  default = ""
}