#!/bin/bash
FUNCTION_NAME="MyLambdaFunction"
ZIP_FILE="lambda_function.zip"
HANDLER="index.handler"
ROLE_ARN="arn:aws:iam::123456789012:role/execution_role"

zip -r $ZIP_FILE index.js

aws lambda create-function --function-name $FUNCTION_NAME \
    --runtime nodejs14.x --role $ROLE_ARN --handler $HANDLER \
    --zip-file fileb://$ZIP_FILE

echo "Lambda function deployed."
