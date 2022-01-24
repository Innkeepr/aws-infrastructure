# Infrastructure Set Up for Innkeepr

## Create User
Go to IAM --> select in the left table of contents "Users" --> Add users (on the right side)
1. User name: Innkeepr
2. Select AWS credential type
    - Enable: Access key - Programmatic access --> this is important, so we can use the aws cli to work on the account
    - Enable: Password - AWS Management Console access
3. Permissions
    - Attach exisiting policies directly: THe policies will be added later by script
    - go to Next: Tags
4. Add tags:
    Key: user, Value: innkeepr
5. Review: Should look like something like this
!(https://raw.githubusercontent.com/Innkeepr/aws-infrastructure/master/Figures/AddUserReview.png?token=GHSAT0AAAAAABIX3K75K3RRVR2656O7WLWEYPOSKPQ)
6. Create User
    - Copy Access Key, Secret Access Key and Password
    - Send Mail to: team@innkeepr.ai

## Customize the following files
- >aws_infrastructure.sh:
    - insert "your" AWS ID in YOURAWSID
- >policy_lambda.json
    - insert the AWSID from the Innkeepr User for InnkeeprAWSID

## Policies
The policies can be found in the directory Policies. In general the polcies allow the whole access to each AWS component. If you want to restrict the accesss you can modify the single json files, e.g.to allwo access to a certain S§ bucket (noramly we call the bucket for Innkeer: innkeepr-analytics).
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3Access",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::innkeepr-analytics/*",
                "arn:aws:s3:::innkeepr-analytics*"
            ]
        }
    ]
}
```

## Next Run Set Up Scrit
> sh aws_infrastructure.sh

In the beginning you need to log in to your AWS account via your Access Keys. So be preadred to have them accessable.

##
