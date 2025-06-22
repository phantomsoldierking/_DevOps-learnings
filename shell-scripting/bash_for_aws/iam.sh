# List IAM Users
aws iam list-users

# Create an IAM User
aws iam create-user --user-name newuser

# Attach an IAM Policy to a User
aws iam attach-user-policy --user-name newuser --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

# Generate New Access Keys for a User
aws iam create-access-key --user-name newuser