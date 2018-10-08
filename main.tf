#######################################################################
## CIS 3.x series of remeditations
#######################################################################

# defining data sources for all the CIS metric filters

data "local_file" "3_1_metric_filter" {
    filename = "${path.module}/filters/3_1_metric.filter"
}

data "local_file" "3_2_metric_filter" {
    filename = "${path.module}/filters/3_2_metric.filter"
}

data "local_file" "3_3_metric_filter" {
    filename = "${path.module}/filters/3_3_metric.filter"
}

data "local_file" "3_4_metric_filter" {
    filename = "${path.module}/filters/3_4_metric.filter"
}

data "local_file" "3_5_metric_filter" {
    filename = "${path.module}/filters/3_5_metric.filter"
}

data "local_file" "3_6_metric_filter" {
    filename = "${path.module}/filters/3_6_metric.filter"
}

data "local_file" "3_7_metric_filter" {
    filename = "${path.module}/filters/3_7_metric.filter"
}

data "local_file" "3_8_metric_filter" {
    filename = "${path.module}/filters/3_8_metric.filter"
}

data "local_file" "3_9_metric_filter" {
    filename = "${path.module}/filters/3_9_metric.filter"
}

data "local_file" "3_10_metric_filter" {
    filename = "${path.module}/filters/3_10_metric.filter"
}

data "local_file" "3_11_metric_filter" {
    filename = "${path.module}/filters/3_11_metric.filter"
}

data "local_file" "3_12_metric_filter" {
    filename = "${path.module}/filters/3_12_metric.filter"
}

data "local_file" "3_13_metric_filter" {
    filename = "${path.module}/filters/3_13_metric.filter"
}

data "local_file" "3_14_metric_filter" {
    filename = "${path.module}/filters/3_14_metric.filter"
}

# topics to which all alarms will be subcribed
resource "aws_sns_topic" "cis_sns_topics" {
  name = "${element(var.cis_sns_topics,count.index)}"
  count = "${var.cis_sns_topic_count}"
}



# 3.1 - Ensure a log metric filter and alarm exist for unauthorized API calls
resource "aws_cloudwatch_log_metric_filter" "3_1_unauthorized_api_calls_metric_filter" {
  count        = "${var.enable_3_1 ? 1: 0}"
  
  name           = "unauthorized_api_calls"
  pattern        =  "${data.local_file.3_1_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "unauthorized_api_calls"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_1_unauthorized_api_calls_alarm" {
  count                     = "${var.enable_3_1 ? 1: 0}"
  alarm_name                = "unauthorized_api_calls_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "unauthorized_api_calls"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for unauthorized_api_calls"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.2 - Ensure a log metric filter and alarm exist for Management Console sign-in without MFA - what does this mean for non MFA use on this account

resource "aws_cloudwatch_log_metric_filter" "3_2_console_without_MFA" {
  count          = "${var.enable_3_2 ? 1: 0}"

  name           = "console_without_MFA"
  pattern        = "${data.local_file.3_2_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "console_without_MFA"
    namespace = "CISBenchmark"
    value     = "1"
  }
}


resource "aws_cloudwatch_metric_alarm" "3_2_console_without_MFA_alarm" {
  count                     = "${var.enable_3_2 ? 1: 0}"

  alarm_name                = "console_without_MFA_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "console_without_MFA"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for Console Sign-in without MFA"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}

# 3.3 - Ensure a log metric filter and alarm exist for usage of "root" account

resource "aws_cloudwatch_log_metric_filter" "3_3_root_usage" {
  count                     = "${var.enable_3_3 ? 1: 0}"

  name           = "root_usage"
  pattern        = "${data.local_file.3_3_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "root_usage"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_3_root_usage_alarm" {
  count                     = "${var.enable_3_3 ? 1: 0}"

  alarm_name                = "root_usage_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "root_usage"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for root usage"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}



# 3.4 - Ensure a log metric filter and alarm exist for IAM policy changes
# subscriptions - 1,2,3

resource "aws_cloudwatch_log_metric_filter" "3_4_iam_changes" {
  count          = "${var.enable_3_4 ? 1: 0}"

  name           = "iam_changes"
  pattern        = "${data.local_file.3_4_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "iam_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_4_iam_changes_alarm" {
  count                     = "${var.enable_3_4 ? 1: 0}"

  alarm_name                = "iam_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "iam_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for iam changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.5 - Ensure a log metric filter and alarm exist for CloudTrail configuration changes
resource "aws_cloudwatch_log_metric_filter" "3_5_cloudtrail_changes" {
  count          = "${var.enable_3_5 ? 1: 0}"

  name           = "cloudtrail_changes"
  pattern        = "${data.local_file.3_5_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"
 
  metric_transformation {
    name      = "cloudtrail_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_5_cloudtrail_changes_alarm" {
  count                     = "${var.enable_3_5 ? 1: 0}"

  alarm_name                = "cloudtrail_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "cloudtrail_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for cloudtrail changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}

# 3.6 - Ensure a log metric filter and alarm exist for AWS Management Console authentication failures

resource "aws_cloudwatch_log_metric_filter" "3_6_console_auth_failures" {
  count           = "${var.enable_3_6 ? 1: 0}"

  name           = "console_auth_failures"
  pattern        = "${data.local_file.3_6_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "console_auth_failures"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_6_console_auth_failures_alarm" {
  count                     = "${var.enable_3_6 ? 1: 0}"

  alarm_name                = "console_auth_failures_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "console_auth_failures"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for AWS Console Auth Failures"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}

# 3.7 - Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs
resource "aws_cloudwatch_log_metric_filter" "3_7_delete_cmk" {
  count          = "${var.enable_3_7 ? 1: 0}"

  name           = "delete_cmk"
  pattern        = "${data.local_file.3_7_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "delete_cmk"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_7_delete_cmk_alarm" {
  count                     = "${var.enable_3_7 ? 1: 0}"

  alarm_name                = "delete_cmk_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "delete_cmk"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for disabling or scheduled deletion of customer created CMKs"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.8 - Ensure a log metric filter and alarm exist for S3 bucket policy changes
resource "aws_cloudwatch_log_metric_filter" "3_8_s3_bucket_policy_changes" {
  count          = "${var.enable_3_8 ? 1: 0}"

  name           = "s3_bucket_policy_changes"
  pattern        = "${data.local_file.3_8_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "s3_bucket_policy_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_8_s3_bucket_policy_changes_alarm" {
  count                     = "${var.enable_3_8 ? 1: 0}"

  alarm_name                = "s3_bucket_policy_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "s3_bucket_policy_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for s3 bucket policy changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}



# 3.9 - Ensure a log metric filter and alarm exist for AWS Config configuration changes


resource "aws_cloudwatch_log_metric_filter" "3_9_Config_changes" {
  count          = "${var.enable_3_9 ? 1: 0}"

  name           = "Config_changes"
  pattern        = "${data.local_file.3_9_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "Config_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_9_config_changes_alarm" {
  count                     = "${var.enable_3_9 ? 1: 0}"

  alarm_name                = "Config_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Config_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for AWS Config configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}

# 3.10 - Ensure a log metric filter and alarm exist for security group changes
resource "aws_cloudwatch_log_metric_filter" "3_10_security_group_changes" {
  count          = "${var.enable_3_10 ? 1: 0}"

  name           = "security_group_changes"
  pattern        = "${data.local_file.3_10_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "security_group_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_10_config_changes_alarm" {
  count                     = "${var.enable_3_10 ? 1: 0}"

  alarm_name                = "security_group_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "security_group_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for security group configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}

# 3.11 - Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL)
resource "aws_cloudwatch_log_metric_filter" "3_11_NACL_changes" {
  count          = "${var.enable_3_11 ? 1: 0}"

  name           = "NACL_changes"
  pattern        = "${data.local_file.3_11_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "NACL_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_11_NACL_changes_alarm" {
  count                     = "${var.enable_3_11 ? 1: 0}"

  alarm_name                = "NACL_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "NACL_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for NACL configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.12 - Ensure a log metric filter and alarm exist for changes to network gateways
resource "aws_cloudwatch_log_metric_filter" "3_12_network_gateway_changes" {
  count          = "${var.enable_3_12 ? 1: 0}"

  name           = "network_gateway_changes"
  pattern        = "${data.local_file.3_12_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "network_gateway_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_12_network_gateway_alarm" {
  count                     = "${var.enable_3_12 ? 1: 0}"

  alarm_name                = "network_gateway_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "network_gateway_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for Network gateway configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.13 - Ensure a log metric filter and alarm exist for route table changes
resource "aws_cloudwatch_log_metric_filter" "3_13_route_table_changes" {
  count          = "${var.enable_3_13 ? 1: 0}"

  name           = "route_table_changes"
  pattern        = "${data.local_file.3_13_metric_filter.content}"
  log_group_name = "${var.cloudtrail_log_group}"

  metric_transformation {
    name      = "route_table_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_13_route_table_alarm" {
  count                     = "${var.enable_3_13 ? 1: 0}"

  alarm_name                = "route_table_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "route_table_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for Route Table configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
}


# 3.14 - Ensure a log metric filter and alarm exist for VPC changes
resource "aws_cloudwatch_log_metric_filter" "3_14_VPC_changes" {
  count          = "${var.enable_3_14 ? 1: 0}"

  name           = "VPC_changes"
  log_group_name = "${var.cloudtrail_log_group}"
  pattern        = "${data.local_file.3_14_metric_filter.content}"
  metric_transformation {
    name      = "VPC_changes"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "3_14_VPC_alarm" {
  count                     = "${var.enable_3_14 ? 1: 0}"

  alarm_name                = "VPC_changes_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "VPC_changes"
  namespace                 = "CISBenchmark"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "Alarming for VPC configuration changes"
  insufficient_data_actions = []
  alarm_actions             = [ "${aws_sns_topic.cis_sns_topics.*.arn}" ]
  
}
