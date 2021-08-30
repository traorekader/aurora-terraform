variable "AWS_REGION" {
    default = "eu-west-1"
}

variable "ENVIRONNEMENT"{
    type = string
    description = "Set the environment" 
    default = ""
}

variable "PLATEFORM"{
    type = string
    description = "The environment Name"
}

variable "LOGICAL_STACK_NAME"{
    type = string
    description = "The logical stack Name"
}

variable "AURORA_ROOT_USERNAME"{
    type = string
    default = "root"
}

variable "AURORA_ROOT_PASSWORD"{
    type = string
    default = "root"
}

variable "AURORA_DB_NAME"{
    type = string
    default = "auroradb"
}

variable "AURORA_DB_PORT"{
    type = number
    default = 3306
}

variable "AURORA_DB_ENGINE"{
    type = string
    default = "aurora-mysql5.7"
}

variable "AURORA_DB_ENGINE_VERSION"{
    type = string
    default = "5.7.mysql_aurora.2.03.2"
}

variable "AURORA_DB_INSTANCE_CLASS"{
    type = string
    description = "Database Instance Class"
    default = "db.t3.medium"
}

variable "AURORA_READ_REPLICA"{
    type = bool
    description = "Read Replica setting"
    default = false
}

variable "AURORA_INSTANCE_COUNT"{
    type = number
    description = "Read Replica instance number"
    default = 2
}

variable "AURORA_DB_BACKUP_RETENTION_PERIOD"{
    type = number
    description = "Must be in 'hh24:mi-hh24:mi' format / not conflict with the preferred maintenance window / at least 30 minutes"
    default = 7
}

variable "AURORA_DB_PREFERED_MAINTENANCE_WINDOWS"{
    type = string
    description = "Must be in 'ddd:hh24:mi-ddd:hh24:mi' with ddd in 'Mon, Tue, Wed, Thu, Fri, Sat, Sun' /  at least 30 minutes"
    default = "Fri:19:00-Mon:09:00"
}

variable "VPC_ID"{
    type = string
    description = "VPC Id"
}

variable "SUBNET_ID_01"{
    type = string
    description = " First subnet Id"
}

variable "SUBNET_ID_02"{
    type = string
    description = " second subnet Id"
}


variable "ENABLE_PERFORMANCE_INSIGHTS"{
    type = string
    description = "Enable Performance Insights"
    default = true
}

variable "CUSTOMER_MASTER_KEY_NAME"{
    type = string
    description = "Customer Master Key Name"
    default = ""
}

variable "MONITORING_INTERVAL"{
    type = number
    description = "Monitoring Interval measurement"
    default = 0
}

variable "AUTO_MINOR_VERSION_UPGRADE"{
    type = string
    description = "Auto minor version upgrade setting"
}

 variable "EMAIL_NOTIFICATION_LIST"{
    type = string
    description = "The Email notification list is used to configure a SNS topic for sending cloudwatch alarm and RDS Event notifications"
    validation {
        condition = can(regex("([a-z]+)@([a-z]+).com", var.EMAIL_NOTIFICATION_LIST))
        error_message = "Please provide a valid email address."
    }
}

/* variable ""{
    type = 
    description = 
    default =
}*/



# ----------------------------------

variable "PATH_TO_PUBLIC_KEY"{
    default = "./mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY"{
    default = "./mykey"
}

variable "PORTS_IP_ALLOWED"{
    type = map(list(string))
    default = {
        "22" = ["0.0.0.0/0"]
        "443" = ["10.9.2.0/23"] 
    }
}

variable "PROTO_ALLOWED"{
    type = list(string)
    default = ["SSH", "HTTP", "HTTPS"]
}

# -----------------------




