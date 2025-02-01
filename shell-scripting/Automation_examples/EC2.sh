#!/bin/bash
INSTANCE_ID="i-1234567890abcdef"

if aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[*].Instances[*].State.Name' --output text | grep -q "running"; then
    echo "Stopping instance $INSTANCE_ID..."
    aws ec2 stop-instances --instance-ids $INSTANCE_ID
else
    echo "Starting instance $INSTANCE_ID..."
    aws ec2 start-instances --instance-ids $INSTANCE_ID
fi
