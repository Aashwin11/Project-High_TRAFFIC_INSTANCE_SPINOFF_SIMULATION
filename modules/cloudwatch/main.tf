resource "aws_cloudwatch_metric_alarm" "high-cpu" {
  count               = length(var.instance-ids)
  alarm_name          = "${var.project-name}-high-cpu-${count.index}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "High CPU utilization on fallback instance ${count.index}"
  dimensions = {
    InstanceId = var.instance-ids[count.index]
  }
  alarm_actions = [var.scale-up-action-arn]
}
resource "aws_cloudwatch_metric_alarm" "low-cpu" {
  count               = length(var.instance-ids)
  alarm_name          = "${var.project-name}-low-cpu-${count.index}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 40
  alarm_description   = "Low CPU utilization on fallback instance ${count.index}"
  dimensions = {
    InstanceId = var.instance-ids[count.index]
  }
  alarm_actions = [var.scale-down-action-arn]
}
