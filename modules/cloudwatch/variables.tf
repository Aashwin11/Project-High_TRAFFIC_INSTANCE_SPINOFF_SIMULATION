variable "project-name" {
  type = string
}
variable "instance-ids" {
  type        = list(string)
  description = "List of EC2 instance IDs to monitor"

}

variable "scale-up-action-arn" {
  type        = string
  description = "ARN of the action to take when scaling up"

}
variable "scale-down-action-arn" {
  type        = string
  description = "ARN of the action to take when scaling down"
}
