resource "aws_security_group" "aurora_security_group" {

    vpc_id      = var.VPC_ID
    name        = trimspace(lower(join("-",[local.common_name,"aurora-security-group"])))
    description = "security group for Aurora Database Cluster"
    
    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = merge(
        { Name = format(local.tag_name, "aurora-security-group")},
        local.common_tags
    )
}


