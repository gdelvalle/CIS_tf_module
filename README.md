## Usage

### Inputs
```hcl

module "cis" {
  source = "git@github.com:gdelvalle/CIS_tf_module.git"
}

environment          = "test"
cloudtrail_log_group = "YOUR_LOGGROUP"
cis_sns_topic_count  = "1"
cis_sns_topics       = [ "MY_CIS_TOPIC" ]
enable_3_1           = false 
...
...
enable_3_14          = false

}
```
`enable_3_X` Inputs are booleans which are __OPTIONAL__.

### Outputs

None Yet.

## Other Notes

If you are using  email subscriptions, they _must_ be created outside of terraform b/c of the validation required.
See  the Unsupported protocol list here: https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html


## TODO
- Add support for notification subscriptions
- Add created topics ARN to outputs
- Consider creating a control sub-module  that would define datasource,create the metric and the alarm (e.g. module "cis_control_3_1" ) 

