resource "aws_sns_topic" "db-sns-notification" {
  name                        = trimspace(lower(join("-",[local.common_name,"aurora-notifications"])))
  display_name                = local.common_name
  kms_master_key_id           = var.CUSTOMER_MASTER_KEY_NAME
}

resource "aws_sns_topic_subscription" "db-sns-notification-subscription" {
  topic_arn = aws_sns_topic.db-sns-notification.arn
  protocol  = "email"
  endpoint  = var.EMAIL_NOTIFICATION_LIST
}