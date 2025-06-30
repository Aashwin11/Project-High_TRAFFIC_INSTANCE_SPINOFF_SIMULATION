variable "instance-count" {
  description = "Value of the instance count"
  type        = number
  default     = 3
}
variable "ami-id" {
  description = "Value of the AMI id"
  type        = string
}

variable "instance-type" {
  description = "VAlue of the instance type"
  type        = string
}

variable "subnet-ids" {
  description = "Value fo the subnet ids"
  type        = list(string)
}

variable "sg-ec2-id" {
  description = "Vlaue of the the SG associated with the EC2 instance"
  type        = string
}
variable "project-name" {
  type = string
}

variable "helper-instance-count" {
  description = "Number of helper (free-tier) EC2 instances"
  type        = number
  default     = 0
}
