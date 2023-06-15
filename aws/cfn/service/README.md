## Service Settings

- EcrImage
- EnvAWSCognitoUserPoolId
- EnvCognitoUserPoolClientId
- TargetGroupArn
- Param Store secrets

**TIP:** Before a service Deploy, delete existing role incl. TaskRole & ExecRole as it will be generated using the template and to avoid conflict.


**NOTICE:** deploying cluster CFN will result a newer TG aka Target Group within our Loadbalancer. 

Update the [service-backend-flask.json](../json/service-backend-flask.json) with the newer `targetGroupArn` generated using [cluster template](cluster/template.yaml) and the associated **three subnets**.


### **CFN Service Deploy**

```s
$ ./bin/cfn/service-deploy 

/workspace/aws-cloud-project-bootcamp/aws/cfn/service/template.yaml
Uploading to backend-service/31346b1b59be045f13f1c7ff9851c1ab.template  8828 / 8828.0  (100.00%)
Waiting for changeset to be created..
Changeset created successfully. Run the following command to review changes:
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:<region>:<aws-id>:changeSet/awscli-cloudformation-package-deploy-1686830515/342b6ab5-2caf-49e4-b6f4-6355cf45af94
```

> [Refer to the console](../../../journal/assets/week11/cfn-stack/crud-fargate-service-cfn.png)