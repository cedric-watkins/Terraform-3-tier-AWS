#Pulling a list of all the Availabiltiy zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

#Creating my Database mysql Instance in Availabiltiy Zone us-east-2a
resource "aws_db_instance" "mysql_db" {

  db_name             = var.db_name
  db_subnet_group_name = var.db_subnet_group
  allocated_storage   = 10
  identifier          = "mysql-db"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t2.micro"
  multi_az            = false
  vpc_security_group_ids = [var.db_sg_id]
  availability_zone   = data.aws_availability_zones.available.names[0]
  username            = var.username
  password            = var.password
  skip_final_snapshot = true

}
