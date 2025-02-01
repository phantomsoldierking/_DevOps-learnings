# List S3 Buckets
aws s3 ls

# Create an S3 Bucket
aws s3 mb s3://my-new-bucket

# Upload a File to S3
aws s3 cp myfile.txt s3://my-new-bucket/

# Download a File from S3
aws s3 cp s3://my-new-bucket/myfile.txt .

# Sync a Local Directory to S3
aws s3 sync /local/path s3://my-new-bucket/

# Make an S3 Object Public
aws s3api put-object-acl --bucket my-new-bucket --key myfile.txt --acl public-read

# Remove an S3 Object
aws s3 rm s3://my-new-bucket/myfile.txt

# Remove an S3 Bucket
aws s3 rb s3://my-new-bucket

# List S3 Objects
aws s3 ls s3://my-new-bucket
