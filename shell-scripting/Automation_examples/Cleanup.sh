#!/bin/bash
echo "Deleting unused EC2 instances..."
aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" --query 'Reservations[*].Instances[*].InstanceId' --output text | xargs -n1 aws ec2 terminate-instances --instance-ids

echo "Deleting unused S3 buckets..."
for bucket in $(aws s3 ls | awk '{print $3}'); do
    aws s3 rm s3://$bucket --recursive
    aws s3 rb s3://$bucket
done

echo "Cleanup completed."
