output "instance-ids-created" {
  value = aws_instance.main-ec2[*].id
}

output "instance-public-ips" {
  value = aws_instance.main-ec2[*].public_ip
}
