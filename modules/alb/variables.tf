variable "project-name" {
  description = "Name of the project"
  type        = string

}

variable "sg-alb-id" {
  description = "value of the security group for the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "value of the subnet ids"
  type        = list(string)
}
variable "vpc-id" {
  description = "value of the vpc id"
  type        = string
}

variable "instance-ids" {
  description = "value of the instance ids"
  type        = list(string)
}
