# EXISTING - Main EC2 (Spot)
resource "aws_instance" "main-ec2" {
  count                       = var.instance-count
  ami                         = var.ami-id
  instance_type               = var.instance-type
  subnet_id                   = element(var.subnet-ids, count.index % length(var.subnet-ids))
  vpc_security_group_ids      = [var.sg-ec2-id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    instance_id = "app-${count.index + 1}"
  })

  tags = {
    Name = "${var.project-name}-INSTANCE-${count.index + 1}"
    Type = "Spot"
  }
}

# ✅ NEW - Helper EC2 (Free Tier)
resource "aws_instance" "helper-ec2" {
  count                       = var.helper-instance-count
  ami                         = var.ami-id
  instance_type               = "t2.micro"
  subnet_id                   = element(var.subnet-ids, count.index % length(var.subnet-ids))
  vpc_security_group_ids      = [var.sg-ec2-id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    instance_id = "helper-${count.index + 1}"
  })

  tags = {
    Name = "${var.project-name}-HELPER-${count.index + 1}"
    Type = "Helper"
  }
}
