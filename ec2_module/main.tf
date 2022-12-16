#Create 2 web ec2 instances the will be located in two seperate Public subnets and availability zones
resource "aws_launch_template" "web_instance" {
  name                   = var.web_lt_name
  image_id               = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = var.key_name

  tags = {
    Name = var.web_lt_name
  }

}

resource "aws_autoscaling_group" "web_asg" {
  name                = var.web_asg
  vpc_zone_identifier = var.web_subnets_id
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.web_instance.id
    version = "$Latest"
  }

}

#Creating bastion instance 
resource "aws_instance" "bastion_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.bastion_sg_id]
  subnet_id              = var.bastion_subnets_id[0]
  key_name               = var.key_name

  tags = {
    Name = var.bastion_instance_name
  }
}