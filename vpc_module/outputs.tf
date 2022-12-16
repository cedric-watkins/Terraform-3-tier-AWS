output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "bastion_subnets_id" {
  value = aws_subnet.bastion_subnets.*.id[0]
}

output "web_subnets_id" {
  value = aws_subnet.web_subnets.*.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.id
}