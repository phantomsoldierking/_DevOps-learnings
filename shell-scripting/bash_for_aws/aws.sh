#  List EC2 Instances
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output table

# Start an EC2 Instance
#!/bin/bash
INSTANCE_ID="i-1234567890abcdef"
aws ec2 start-instances --instance-ids $INSTANCE_ID
echo "Instance $INSTANCE_ID started."

# Stop an EC2 Instance
#!/bin/bash
INSTANCE_ID="i-1234567890abcdef"
aws ec2 stop-instances --instance-ids $INSTANCE_ID
echo "Instance $INSTANCE_ID stopped."

# Terminate an EC2 Instance
#!/bin/bash
INSTANCE_ID="i-1234567890abcdef"
aws ec2 terminate-instances --instance-ids $INSTANCE_ID
echo "Instance $INSTANCE_ID terminated."

#  S3 Backup Script
#!/bin/bash
BUCKET_NAME="my-backup-bucket"
SOURCE_DIR="/var/www/html"
aws s3 sync $SOURCE_DIR s3://$BUCKET_NAME/$(date +%Y-%m-%d)/
echo "Backup completed successfully."


