output "high_cpu_alarm_names" {
  value = aws_cloudwatch_metric_alarm.high-cpu[*].alarm_name
}

output "low_cpu_alarm_names" {
  value = aws_cloudwatch_metric_alarm.low-cpu[*].alarm_name
}
