```
gitpod /workspace/aws-cloud-project-bootcamp/thumbing-serverless-cdk (main) $ cdk deploy
uploadsBucketName
assetsBucketName assets.yacrud.me
folderInput
folderOutput avatars/processed
webhookUrl https://api.yacrud.me/webhooks/avatar
topicName cruddur-assets
functionPath /workspace/aws-cloud-project-bootcamp/aws/lambdas/process-images

✨  Synthesis time: 4.2s

ThumbingServerlessCdkStack: building assets...

[0%] start: Building 1b8684308efd59fbe1d3e9d7893a87d81a1e901bb66aa9711ce816aacbd51ee3:current_account-current_region
[0%] start: Building 28e811bc5c4543b2961b42924461e7cca5931718a4a206164920d17afac3d0e5:current_account-current_region
[50%] success: Built 1b8684308efd59fbe1d3e9d7893a87d81a1e901bb66aa9711ce816aacbd51ee3:current_account-current_region
[100%] success: Built 28e811bc5c4543b2961b42924461e7cca5931718a4a206164920d17afac3d0e5:current_account-current_region

ThumbingServerlessCdkStack: assets built

ThumbingServerlessCdkStack: deploying... [1/1]
[0%] start: Publishing 1b8684308efd59fbe1d3e9d7893a87d81a1e901bb66aa9711ce816aacbd51ee3:current_account-current_region
[0%] start: Publishing 28e811bc5c4543b2961b42924461e7cca5931718a4a206164920d17afac3d0e5:current_account-current_region
[50%] success: Published 1b8684308efd59fbe1d3e9d7893a87d81a1e901bb66aa9711ce816aacbd51ee3:current_account-current_region
[100%] success: Published 28e811bc5c4543b2961b42924461e7cca5931718a4a206164920d17afac3d0e5:current_account-current_region
ThumbingServerlessCdkStack: creating CloudFormation changeset...

 ✅  ThumbingServerlessCdkStack

✨  Deployment time: 83.29s

Stack ARN:
arn:aws:cloudformation:ca-central-1:598485450821:stack/ThumbingServerlessCdkStack/34e2da70-f293-11ed-8941-067c53985418

✨  Total time: 87.49s


gitpod /workspace/aws-cloud-project-bootcamp/thumbing-serverless-cdk (main) $ 
```