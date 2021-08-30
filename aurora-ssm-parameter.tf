resource "aws_ssm_parameter" "aurora-secret-password" {
  name        = trimspace(lower(join("-",[local.common_name,"master-password"])))
  description = "The parameter description"
  type        = "SecureString"
  value       = var.AURORA_ROOT_PASSWORD

  tags = merge(
        { Name = format(local.tag_name, "ssm-parameter")},
        local.common_tags
    )
}