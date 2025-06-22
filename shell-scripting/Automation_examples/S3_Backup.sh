#!/bin/bash
BUCKET_NAME="my-backup-bucket"
SOURCE_DIR="/var/www/html"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

echo "Starting backup..."
aws s3 sync $SOURCE_DIR s3://$BUCKET_NAME/backup-$TIMESTAMP/
echo "Backup completed."
