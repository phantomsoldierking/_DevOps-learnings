# List CloudWatch Alarms
aws cloudwatch describe-alarms


# Create a CPU Utilization Alarm for EC2
aws cloudwatch put-metric-alarm --alarm-name "HighCPUUsage" \
    --metric-name "CPUUtilization" --namespace "AWS/EC2" --statistic "Average" \
    --period 300 --threshold 80 --comparison-operator "GreaterThanThreshold" \
    --dimensions "Name=InstanceId,Value=i-1234567890abcdef" \
    --evaluation-periods 2 --alarm-actions "arn:aws:sns:us-east-1:123456789012:my-topic"

