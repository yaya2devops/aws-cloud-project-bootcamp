## Cloudformation Guide

**Describe deployed**
```sh
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:ca-central-1:598485450821:changeSet/awscli-cloudformation-package-deploy-1682182625/998f47cd-5c22-4d84-a8aa-27943fb6a8bf
```

**Validate Template:**
```sh
​aws cloudformation validate-template --template-body file:///workspace/aws-bootcamp-cruddur-2023/aws/cfn/template.yaml
```

Install [Linter](https://github.com/aws-cloudformation/cfn-lint)
```sh
pip install cfn-lint
```

```sh
cfn-lint /workspace/aws-cloud-project-bootcamp/aws/cfn/template.yaml
```
> vs open on gitpod the open source


```sh
cfn-guard validate -r ecs-cluster.guard
```


---

## Architecture Guide

Before you run any templates, be sure to create an S3 bucket to contain
all of our artifacts for CloudFormation.



Cluster Template URI: `s3://cfn-artifacts-111/f4c0adbebb70b0b6c337105b4f151492.template`

```
aws s3 mk s3://cfn-artifacts-111
export CFN_BUCKET="cfn-artifacts-111"
gp env CFN_BUCKET="cfn-artifacts-111"
```


[**Developer Reference**](../../bin/cfn/README.md)