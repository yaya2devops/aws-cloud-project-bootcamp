
### Deploy Process
- [Package to tmp](../../../journal/assets/week11/cfn-stack/cicd-packaged-output.png) 
- [Ship the artifcat](../../../journal/assets/week11/cfn-stack/CICD-TEMPLATE-ARTIFACT.png) 
- [Execute the cahngeset](../../../journal/assets/week11/cfn-stack/cicd-stack-cfn.png) 

```s
$ ./bin/cfn/cicd 

/workspace/aws-cloud-project-bootcamp/aws/cfn/cicd/template.yaml
W3002 This code may only work with `package` cli command as the property (Resources/CodeBuildBakeImageStack/Properties/TemplateURL) is a string
/workspace/aws-cloud-project-bootcamp/aws/cfn/cicd/template.yaml:24:7

== packaging CFN to S3...

Successfully packaged artifacts and wrote output template to file /workspace/aws-cloud-project-bootcamp/tmp/packaged-template.yaml.
Execute the following command to deploy the packaged template
aws cloudformation deploy --template-file /workspace/aws-cloud-project-bootcamp/tmp/packaged-template.yaml --stack-name <YOUR STACK NAME>

Uploading to cicd/fc5136099e006b28c2c7f77a2214eaa3.template  4999 / 4999.0  (100.00%)
Waiting for changeset to be created..

Changeset created successfully. Run the following command to review changes:
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:<region>:<aws-id>:changeSet/awscli-cloudformation-package-deploy-1686837802/c656b3ea-eff8-4383-a9dc-09a0e753f3b5
```


Template URI

```YAML
      TemplateURL: https://s3.<region>.amazonaws.com/cfn-artifacts-111/cicd-package/4b7084f1e2ee6e930e27ef91a2fe3ab5.template
```

> [Refer to the console](../../../journal/assets/week11/cfn-stack/) 
