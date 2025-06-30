variable "aws-region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"

}

variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "availability-zone" {
  description = "List of availability zones to use for the public subnets"
  type        = list(string)
}

variable "public-subnet-count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 3
}

variable "project-name" {
  description = "Name of the project"
  type        = string

}

variable "instance-count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3

}

variable "ami-id" {
  description = "AMI ID for the EC2 instances"
  type        = string

}

variable "instance-type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"

}
