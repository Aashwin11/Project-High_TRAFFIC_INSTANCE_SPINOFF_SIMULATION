resource "aws_security_group" "ec2-sg" {
  name        = "${var.project-name}-sg-instance"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc-id

  ingress {
    description = "Allow ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow HTTP from anyhwere"
    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project-name}-sg-Instance"
  }
}

resource "aws_security_group" "alb-sg" {
  name        = "${var.project-name}-alb-sg"
  description = "Allow scurity from ALB to EC2"
  vpc_id      = var.vpc-id

  ingress {
    description = "Allow http from anywhere to alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
