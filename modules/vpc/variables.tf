variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}
variable "public-subnet-count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 3

}

variable "availability-zone" {
  description = "List of availability zones to use for the public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]

}
