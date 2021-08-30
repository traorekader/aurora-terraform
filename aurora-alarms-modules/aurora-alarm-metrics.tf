resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = var.ALARM_NAME
  alarm_actions             = var.ALARM_ACTIONS
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  dimensions                = var.ALARM_DIMENSIONS
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  unit                      = "Percent"
  evaluation_periods        = "5"
  treat_missing_data        = "notBreaching"
}