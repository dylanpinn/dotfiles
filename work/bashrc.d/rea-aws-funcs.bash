# Increase ASG for Adslotinator system.
rea-aws-adslot-inc() {
  rea-as okta resi-agent-prod-ReadWrite aws autoscaling describe-auto-scaling-groups --filter Name=tag:aws:cloudformation:stack-name,Values=adslotinator |
    jq '.AutoScalingGroups[].AutoScalingGroupName' |
    xargs rea-as okta resi-agent-prod-ReadWrite aws autoscaling set-desired-capacity   --desired-capacity 1 --auto-scaling-group-name
}

# Decrease ASG for Adslotinator system.
rea-aws-adslot-dec() {
  rea-as okta resi-agent-prod-ReadWrite aws autoscaling describe-auto-scaling-groups --filter Name=tag:aws:cloudformation:stack-name,Values=adslotinator |
    jq '.AutoScalingGroups[].AutoScalingGroupName' |
    xargs rea-as okta resi-agent-prod-ReadWrite aws autoscaling set-desired-capacity   --desired-capacity 0 --auto-scaling-group-name
}

