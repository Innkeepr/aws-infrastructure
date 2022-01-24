# Set Up AWS Infrastructure
AWSID=576891989037
# Login to aws
echo "login to your aws account via access keys:"
aws configure

# Create Policies
echo "Create Policies: ACM Access"
aws iam create-policy --policy-document file://Policies/policy_acm.json --policy-name InnkeeprAcmAccess --description "Allows ACM Access for Innkeepr"

echo "Create Policies: Cloud Watch"
aws iam create-policy --policy-document file://Policies/policy_cloudwatch.json --policy-name InnkeeprCloudWatchAccess --description "Allows Cloud Watch Access for Innkeepr"

echo "Create Policies: EC2"
aws iam create-policy --policy-document file://Policies/policy_ec2.json --policy-name InnkeeprEC2Access --description "Allows EC2 Access for Innkeepr"

echo "Create Policies: ECS"
aws iam create-policy --policy-document file://Policies/policy_ecs.json --policy-name InnkeeprECSAccess --description "Allows ECS Access for Innkeepr"

echo "Create Policies: IAM"
aws iam create-policy --policy-document file://Policies/policy_iam.json --policy-name InnkeeprIAMAccess --description "Allows IAM Access for Innkeepr"

echo "Create Policies: Lambda"
aws iam create-policy --policy-document file://Policies/policy_lambda.json --policy-name InnkeeprLambdaAccess --description "Allows Lambda Access for Innkeepr"

echo "Create Policies: Pass Role"
aws iam create-policy --policy-document file://Policies/policy_pass_role.json --policy-name InnkeeprPassRole --description "Allows Pass Role for Innkeepr"

echo "Create Policies: S3"
aws iam create-policy --policy-document file://Policies/policy_s3.json --policy-name InnkeeprS3Access --description "Allows S3 for Innkeepr"

echo "Create Policies: SNS"
aws iam create-policy --policy-document file://Policies/policy_sns.json --policy-name InnkeeprSNSAccess --description "Allows SNS for Innkeepr"

# Create Roles
##  InnkeeprAmazonECSTaskS3BucketRole
echo "Create Roles: InnkeeprAmazonECSTaskS3BucketRole"
aws iam create-role --role-name InnkeeprAmazonECSTaskS3BucketRole --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "ecs-tasks.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy --role-name InnkeeprAmazonECSTaskS3BucketRole
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprCloudWatchAccess --role-name InnkeeprAmazonECSTaskS3BucketRole
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprS3Access --role-name InnkeeprAmazonECSTaskS3BucketRole
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprPassRole --role-name InnkeeprAmazonECSTaskS3BucketRole

#innkeepr-lambda-ex with Policy: InnkeeprPolicyLambda
echo "Create Roles: innkeepr-lambda-ex"
aws iam create-role --role-name innkeepr-lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprLambdaAccess --role-name innkeepr-lambda-ex

# Attach Policy to Innkeepr User
echo "Attach Policies to Innkeepr User"
echo "Attach InnkeeprEC2Access"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprEC2Access --user-name Innkeepr
echo "Attach InnkeeprIAMAccess"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprIAMAccess --user-name Innkeepr
echo "Attach InnkeeprECSAccess"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprECSAccess --user-name Innkeepr
echo "Attach InnkeeprS3Access"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprS3Access --user-name Innkeepr
echo "Attach InnkeeprSNSAccess"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprSNSAccess --user-name Innkeepr
echo "Attach InnkeeprAcmAccess"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprAcmAccess --user-name Innkeepr
echo "Attach InnkeeprLambdaAccess"
aws iam attach-user-policy --policy-arn arn:aws:iam::$AWSID:policy/InnkeeprLambdaAccess --user-name Innkeepr
