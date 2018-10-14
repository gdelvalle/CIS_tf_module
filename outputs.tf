
output "cis_sns_topics" {
  value = "${aws_sns_topic.cis_sns_topics.*.arn}"
}