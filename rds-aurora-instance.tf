resource "aws_rds_cluster_instance" "rds-aurora-db-instance" {
  count              = local.HAS_AURORA_READ_REPLICA ? var.AURORA_INSTANCE_COUNT : 1

  identifier         = "rds-aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.rds-aurora-db-cluster.id

  instance_class     = var.AURORA_DB_INSTANCE_CLASS
  engine             = aws_rds_cluster.rds-aurora-db-cluster.engine
  engine_version     = aws_rds_cluster.rds-aurora-db-cluster.engine_version

  # monitoring_interval = var.MONITORING_INTERVAL
  # monitoring_role_arn = aws_iam_role.aurora-monitoring-role.arn
  auto_minor_version_upgrade =var.AUTO_MINOR_VERSION_UPGRADE

  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.aurora-db-subnet-group.id 
  db_parameter_group_name = aws_db_parameter_group.aurora-db-parameter-group.id 

  # performance_insights_enabled = var.ENABLE_PERFORMANCE_INSIGHTS
  # performance_insights_kms_key_id = var.CUSTOMER_MASTER_KEY_NAME

  copy_tags_to_snapshot = true
  tags = merge(
        { Name = format(local.tag_name, "aurora-instance")},
        local.common_tags
    )
    
  
}