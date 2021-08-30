resource "aws_iam_role" "aurora-db-s3-role" {
    name = format(local.tag_name, "db-s3-role")
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Action: "sts:AssumeRole",
                Effect: "Allow",
                Sid: "",
                Principal: {
                    Service: "rds.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role" "aurora-db-lambda-role" {
    name = format(local.tag_name, "db-lambda-role")
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Action: "sts:AssumeRole",
                Effect: "Allow",
                Sid: "",
                Principal: {
                    Service: "rds.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role" "aurora-monitoring-role" {
    name = format(local.tag_name, "db-monitoring-role")
    path = "/"
    managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"]
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Action: "sts:AssumeRole",
                Effect: "Allow",
                Sid: "",
                Principal: {
                    Service: "monitoring.rds.amazonaws.com"
                }
            }
        ]
    })
}