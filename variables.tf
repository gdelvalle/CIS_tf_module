
variable "environment" {}

variable "cloudtrail_log_group" {}

variable "cis_sns_topic_count" {
  default ="0"
}

variable "cis_sns_topics" {
  type = "list"
  default =[]
}

## booleans per control
variable "enable_3_1" {
  default = true

}
variable "enable_3_2" {
  default = true
}

variable "enable_3_3" {
  default = true

}
variable "enable_3_4" {
  default = true

}
variable "enable_3_5" {
  default = true

}
variable "enable_3_6" {
  default = true

}
variable "enable_3_7" {
  default = true

}
variable "enable_3_8" {
  default = true

}
variable "enable_3_9" {
  default = true

}
variable "enable_3_10" {
  default = true

}
variable "enable_3_11" {
  default = true

}
variable "enable_3_12" {
  default = true

}
variable "enable_3_13" {
  default = true
}

variable "enable_3_14" {
  default = true

}