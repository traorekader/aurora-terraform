module "aurora-alarm" {
    for_each = { for k,instance in aws_rds_cluster_instance.rds-aurora-db-instance: k => instance }
    source = "./aurora-alarms-modules"
    ALARM_NAME = "cpuutilization-aurora-db-${each.key}"
    ALARM_ACTIONS = [aws_sns_topic.db-sns-notification.arn]
    ALARM_DIMENSIONS = { DBInstanceIdentifier = each.value.id }
}