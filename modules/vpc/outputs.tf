output "vpc-id" {
  value = aws_vpc.vpc-main.id
}

output "public-subnet-ids" {
  value = aws_subnet.public-subnet[*].id
}
