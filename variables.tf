########################
## global configuration variables
########################

variable "environment" {
  description = "Environment these resources are being created in"
  type        = "string"
  default     = "Development"
}

variable "cloudtrail_log_group" {
  description = "Cloudtrail's CloudWatch LogGroup"
  type        = "string"
}

variable "cis_sns_topic_count" {
  description = "Count based on the Number of Topics to be created  "
  type        = "string"
  default     = "0"
}

variable "cis_sns_topics" {
  description = "Topics All Notifications will be sent to."
  type        = "list"
  default     = []
}

#######################
### Booleans to conditionally enable a given control
########################

variable "enable_3_1" {
  description = "Boolean for Control 3.1"
  type        = "string"
  default     = true
}

variable "enable_3_2" {
  description = "Boolean for Control 3.2"
  type        = "string"
  default     = true
}

variable "enable_3_3" {
  description = "Boolean for Control 3.3"
  type        = "string"
  default     = true
}

variable "enable_3_4" {
  description = "Boolean for Control 3.4"
  type        = "string"
  default     = true
}

variable "enable_3_5" {
  description = "Boolean for Control 3.5"
  type        = "string"
  default     = true
}

variable "enable_3_6" {
  description = "Boolean for Control 3.6"
  type        = "string"
  default     = true
}

variable "enable_3_7" {
  description = "Boolean for Control 3.7"
  type        = "string"
  default     = true
}

variable "enable_3_8" {
  description = "Boolean for Control 3.8"
  type        = "string"
  default     = true
}

variable "enable_3_9" {
  description = "Boolean for Control 3.9"
  type        = "string"
  default     = true
}

variable "enable_3_10" {
  description = "Boolean for Control 3.10"
  type        = "string"
  default     = true
}

variable "enable_3_11" {
  description = "Boolean for Control 3.11"
  type        = "string"
  default     = true
}

variable "enable_3_12" {
  description = "Boolean for Control 3.12"
  type        = "string"
  default     = true
}

variable "enable_3_13" {
  description = "Boolean for Control 3.13"
  type        = "string"
  default     = true
}

variable "enable_3_14" {
  description = "Boolean for Control 3.14"
  type        = "string"
  default     = true
}
