#!/bin/bash
LOG_GROUP="/aws/lambda/my-function"

aws logs tail $LOG_GROUP --follow
