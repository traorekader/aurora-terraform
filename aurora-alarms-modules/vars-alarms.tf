
variable "ALARM_ACTIONS"{
    type = list
    description = " The list of actions to execute. Here send out to the SNS endpoint"
}

variable "ALARM_NAME"{
    type = string
    description = " Alarm name"
}

variable "ALARM_DIMENSIONS"{
    type = map
    description = " Alarm dimension"
}

