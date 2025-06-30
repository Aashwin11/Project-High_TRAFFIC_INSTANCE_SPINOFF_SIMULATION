output "instance-ids-created" {
  value = aws_instance.main-ec2[*].id
}

output "instance-public-ips" {
  value = aws_instance.main-ec2[*].public_ip
}

output "helper-instance-ids" {
  value = aws_instance.helper-ec2[*].id
}

output "helper-instance-public-ips" {
  value = aws_instance.helper-ec2[*].public_ip
}
