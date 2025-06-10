output "vpc_id" {
  value = aws_vpc.kasi_hcl_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.hcl_public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.hcl_private_subnet.id
}

output "route_table_id" {
  value = aws_route_table.public_route_table.id
}
