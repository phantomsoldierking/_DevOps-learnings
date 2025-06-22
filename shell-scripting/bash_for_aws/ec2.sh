# List Running EC2 Instances
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]' --output table

# Start an EC2 Instance
aws ec2 start-instances --instance-ids i-1234567890abcdef

# Stop an EC2 Instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef
# Terminate an EC2 Instance
aws ec2 terminate-instances --instance-ids i-1234567890abcdef

# Create a New EC2 Key Pair
aws ec2 create-key-pair --key-name my-key --query 'KeyMaterial' --output text > my-key.pem
# Change the permissions of the key file
chmod 400 my-key.pem

# Create a Security Group
aws ec2 create-security-group --group-name my-security-group --description "My security group"
