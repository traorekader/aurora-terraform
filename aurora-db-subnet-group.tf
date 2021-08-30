resource "aws_db_subnet_group" "aurora-db-subnet-group" {
    name       = trimspace(lower(join("-",[local.common_name,"db-subnet-group"])))
    description = "${local.common_name} db subnet group"
    subnet_ids = [var.SUBNET_ID_01, var.SUBNET_ID_02]

    tags = merge(
        { Name = format(local.tag_name, "db_subnet_group")},
        local.common_tags
    )
}