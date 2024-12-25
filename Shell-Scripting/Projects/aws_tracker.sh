#!/bin/bash

#####################################
# Author     : Sachin Das
# Date       : 25/12/2024
# Version    : v1
# Description: Will report AWS resourse usage
#####################################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# list the s3 buckets
echo "Print list of s3 buckets"
aws s3 ls >> resource.txt
 
# list ec2 instances
echo "Print list of ec2"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'>> resource.txt

# list aws lambda functions
echo "Print list of Lambda functions"
aws lambda list-functions

# list IAM users
echo "Prints list of IAM user"
aws iam list-users

