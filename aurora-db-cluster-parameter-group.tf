resource "aws_rds_cluster_parameter_group" "aurora-db-cluster-parameter-group" {
  
    name        = trimspace(lower(join("-",[local.common_name,"db-cluster-parameters-group"])))
    family      = var.AURORA_DB_ENGINE
    description = "RDS default cluster parameter group"

    parameter {
        name  = "character_set_server"
        value = "utf8"
    }

    parameter {
        name  = "character_set_client"
        value = "utf8"
    }

    parameter {
        name  = "character_set_database"
        value = "utf8"
    }

    parameter {
        name  = "character_set_filesystem"
        value = "utf8"
    }

    parameter {
        name  = "character_set_results"
        value = "utf8"
    }

    parameter {
        name  = "collation_connection"
        value = "utf8_general_ci"
    }

    parameter {
        name  = "collation_server"
        value = "utf8_general_ci"
    }

        parameter {
        name  = "aws_default_lambda_role"
        value = aws_iam_role.aurora-db-lambda-role.arn
    }

    parameter {
        name  = "aws_default_s3_role"
        value = aws_iam_role.aurora-db-s3-role.arn
    }

    parameter {
        name  = "server_audit_logging"
        value = "ON"
    }

    parameter {
        name  = "server_audit_events"
        value = "CONNECT,QUERY,TABLE"
    }
   
}