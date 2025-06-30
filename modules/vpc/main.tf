resource "aws_vpc" "vpc-main" {
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "main-ig" {
  vpc_id = aws_vpc.vpc-main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public-subnet" {
  count             = var.public-subnet-count
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = cidrsubnet(var.vpc-cidr-block, 8, count.index)
  availability_zone = element(var.availability-zone, count.index)
  tags = {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-ig.id
  }
  tags = {
    Name = "${var.project_name}-main-rt"
  }
}

resource "aws_route_table_association" "main-rta" {
  route_table_id = aws_route_table.main-rt.id
  count          = var.public-subnet-count
  subnet_id      = aws_subnet.public-subnet[count.index].id
}

