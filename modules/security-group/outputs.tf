output "alb-sg" {
  value = aws_security_group.alb-sg.id
}

output "sg-ec2" {
  value = aws_security_group.ec2-sg.id
}
