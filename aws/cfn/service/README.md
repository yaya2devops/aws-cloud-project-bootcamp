## Service Settings

- EcrImage
- EnvAWSCognitoUserPoolId
- EnvCognitoUserPoolClientId
- TargetGroupArn
- Param Store secrets

**TIP:** Before a service Deploy, delete existing role incl. TaskRole & ExecRole as it will be generated using the template and to avoid conflict.


**NOTICE:** deploying cluster CFN will result a newer TG aka Target Group within our Loadbalancer. 

Update the [service-backend-flask.json](../json/service-backend-flask.json) with the newer `targetGroupArn` generated using [cluster template](cluster/template.yaml) and the associated **three subnets**.