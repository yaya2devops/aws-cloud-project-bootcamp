## Provisioning AWS Resources with AWS CDK

I defined in [`thumbing-serverless-cdk-stack.ts`](thumbing-serverless-cdk-stack.ts) the below stack:

- **Bucket:** Creates a new bucket in Amazon S3 to store the input and output files for your image processing project.
-  **Lambda:**  Process the images stored in the S3 bucket and perform the desired image processing operations.
-  **SNS Topic:** Creates an SNS topic that will be used to send notifications about the status of the image processing job.
-  **SNS Subscription:** Subscribes the endpoint  to the SNS topic so that it can receive notifications about the status of the image job.
-  **S3 Event Notification to SNS:** Send a notification to the SNS topic whenever a new object is created in the S3 bucket.
- **S3 Event Notification to Lambda:**  Trigger the Lambda function whenever a new object is created in the S3 bucket.
- **Policy for Bucket Access:** Defines the permissions required to access the S3 bucket and its contents.
-  **Policy for SNS Publishing:** Defines the permissions required to publish messages to the SNS topic.



**Synth:**
```sh
cdk synth > cdk-synth.yml
```


**Deploy:**
```sh
cdk deploy
```

**Destroy Resources:**
```sh
cdk destroy
```

**List Stacks:**
```sh
cdk ls
```

**Describe Stack:**
```sh
aws cloudformation describe-stacks --stack-name ThumbignServerlessCdkStack
```

```sh
THUMBING_BUCKET_NAME=""
```
