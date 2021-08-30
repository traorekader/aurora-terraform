resource "aws_rds_cluster" "rds-aurora-db-cluster" {
  skip_final_snapshot  = true
  # final_snapshot_identifier= "finalshanpshot" # can be anabled if skip_final_snapshot is set to true

  cluster_identifier      = "aurora-cluster-demo" ##### to be renamed if needed
  engine                  = "aurora-mysql"
  engine_version          = var.AURORA_DB_ENGINE_VERSION
  
  database_name           = var.AURORA_DB_NAME
  master_username         = var.AURORA_ROOT_USERNAME                                     ##### To be changed and managed wih secret manager resrouce
  master_password         = aws_ssm_parameter.aurora-secret-password.value               ##### To be changed and managed wih secret manager resrouce
  
  port = var.AURORA_DB_PORT
  # backup_retention_period = var.AURORA_DB_BACKUP_RETENTION_PERIOD  ##### condition to be set here
  preferred_backup_window = "07:00-09:00"    ######"07:00-09:00" ########
  preferred_maintenance_window = "Fri:22:00-Sat:03:00"

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora-db-cluster-parameter-group.id   ######## must match with the one from rds-aurora-instance
  db_subnet_group_name = aws_db_subnet_group.aurora-db-subnet-group.id
  
  enabled_cloudwatch_logs_exports = ["error","general","slowquery","audit"]
  iam_roles = [aws_iam_role.aurora-db-s3-role.arn, aws_iam_role.aurora-db-lambda-role.arn]
  storage_encrypted = true

  kms_key_id = var.CUSTOMER_MASTER_KEY_NAME
  iam_database_authentication_enabled = local.IS_SMALL_DATABASE ? false : true

  vpc_security_group_ids = [aws_security_group.aurora_security_group.id]
  tags = merge(
        { Name = format(local.tag_name, "db_subnet_group")},
        local.common_tags
    )
  
}