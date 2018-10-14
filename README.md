## Purpose

Implementation of [CIS Amazon Web Services Foundations - v1.2.0 05-23-2018](https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf).

## Usage

### Example
```hcl

module "cis" {
  source = "git@github.com:gdelvalle/CIS_tf_module.git"
  environment          = "test"
  cloudtrail_log_group = "YOUR_LOGGROUP"
	cis_sns_topic_count  = "1"
	cis_sns_topics       = [ "MY_CIS_TOPIC" ]
	enable_3_1           = false 
	enable_3_14          = false

}
```
`enable_3_X` Inputs are __OPTIONAL__ booleans which default to `true`.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
|  environment | Environment these resources are being created in| string   | Development |yes|
|cloudtrail_log_group| Cloudtrail's CloudWatch LogGroup| string| `''`| yes|
|cis_sns_topic_count| Count based on the Number of Topics to be created|string|`0`|no|
|cis_sns_topics|Topics All Notifications will be sent to.|list|`[]`|no|
|enable_3_1|Boolean for Control 3.1|string|true|no|
|enable_3_2|Boolean for Control 3.2|string|true|no|
|enable_3_3|Boolean for Control 3.3|string|true|no|
|enable_3_4|Boolean for Control 3.4|string|true|no|
|enable_3_5|Boolean for Control 3.5|string|true|no|
|enable_3_6|Boolean for Control 3.6|string|true|no|
|enable_3_7|Boolean for Control 3.7|string|true|no|
|enable_3_8|Boolean for Control 3.8|string|true|no|
|enable_3_9|Boolean for Control 3.9|string|true|no|
|enable_3_10|Boolean for Control 3.10|string|true|no|
|enable_3_11|Boolean for Control 3.11|string|true|no|
|enable_3_12|Boolean for Control 3.12|string|true|no|
|enable_3_13|Boolean for Control 3.13|string|true|no|
|enable_3_14|Boolean for Control 3.14|string|true|no|

### Outputs

| Name | Description |
|------|-------------|
| SNS Topics | List of Created SNS Topics|

## Other Notes

If you are using  email subscriptions, they _must_ be created outside of terraform because of the validation required.
This is a design decision made Terraform developers that can't easily be worked around.
See the Unsupported protocol list here: https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html


## TODO
- Add support for notification subscriptions
- Consider creating a control sub-module  that would define datasource,create the metric and the alarm (e.g. module "cis_control_3_1" ) 
- As I expand the  Controls `cloudtrail_log_group`  should optionally be created in module

