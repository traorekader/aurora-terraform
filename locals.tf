locals {
    platform  = var.PLATEFORM
    logicalStackname = var.LOGICAL_STACK_NAME
    environnement = var.ENVIRONNEMENT
    common_tags = {
        "alehos:platform" = local.platform
        "alehos:platform:stack"  = local.logicalStackname
        "alehos:platform:Environment" = local.environnement
    }
}

locals { 
    tag_name = "${var.PLATEFORM}-${var.LOGICAL_STACK_NAME}-${var.AURORA_DB_NAME}-%s-${var.ENVIRONNEMENT}"
    common_name = "${var.PLATEFORM}-${var.LOGICAL_STACK_NAME}-${var.AURORA_DB_NAME}-${var.ENVIRONNEMENT}"
    # email_regexp = "^(([^<>()\\[\\]\\.,;:@\"]+(\\.[^<>()[]\\.,;:@\"]+)*)|(\"\\.+\"))@(([[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z0-9]+\\.)+[a-zA-Z]{2,}))$"
}

locals {
    IS_SMALL_DATABASE = var.AURORA_DB_INSTANCE_CLASS == "db.t3.medium" ? true : false
    HAS_AURORA_READ_REPLICA = var.AURORA_READ_REPLICA == true ? true : false
    HAS_ENHANCING_MONITORING = var.MONITORING_INTERVAL != 0 ? true : false
    HAS_PREFERED_MAINTENANCE_WINDOWS = var.AURORA_DB_PREFERED_MAINTENANCE_WINDOWS != "" ? true : false
    HAS_BACKUP_RETENTION_PERIOD = var.AURORA_DB_BACKUP_RETENTION_PERIOD != "" ? true : false
}
