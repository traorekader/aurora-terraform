resource "aws_db_parameter_group" "aurora-db-parameter-group" {
  
    name        = trimspace(lower(join("-",[local.common_name,"db-parameters-group"])))
    family      = var.AURORA_DB_ENGINE
    description = "RDS default cluster parameter group"

    parameter {
        name  = "autocommit"
        value = "false"
    }
}