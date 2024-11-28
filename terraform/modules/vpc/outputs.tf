output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "nat_eip" {
  value = aws_eip.nat_eip
}