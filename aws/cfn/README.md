## AWS Cloudformation

| Template Name | Description |
| ---: | --- |
| [ECS Cluster](cluster/template.yaml) | This CloudFormation template deploys an ECS Cluster  |
| [Netowrking Layer](networking/template.yaml) | CFN temp configure network settings, IP addresses, subnets, and routing |
| [AWS Fargate Service](service/template.yaml) | Deploys an AWS Fargate service with ALB and TG|
| [AWS RDS](db/template.yaml) | Provision AWS Relational Database for Crud Activity|
| [AWS DynamoDB](ddb/README.md) | Deploy Infra using [AWS SAM](https://aws.amazon.com/fr/serverless/sam/)|
| [CI/CD](cicd/template.yaml) | Deploy CodeBuild and CodePipelines Configurations |
| [Frontend CloudFront](cicd/template.yaml) | Deploy CF Distrubution for Frontend and assign its certificate |



---

> **Do you know** [yacrud.me](https://yacrud.me/) is derived from my nickname Yaya and the act of posting to Cruddur aka CRUD.

## CFN Developer Guide

- Describe Deployed Template
```sh
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:ca-central-1:598485450821:changeSet/awscli-cloudformation-package-deploy-1682182625/998f47cd-5c22-4d84-a8aa-27943fb6a8bf
```

- Validate Template
```sh
​aws cloudformation validate-template --template-body file:///workspace/aws-bootcamp-cruddur-2023/aws/cfn/template.yaml
```

- Validate against guard

```sh
cfn-guard validate \
--data ./aws/cfn/cluster \
--output-format yaml \
--rules ./aws/cfn/service/ecs-cluster.guard \
--show-summary pass,fail \
--type CFNTemplate
```
- Install [Linter](https://github.com/aws-cloudformation/cfn-lint)
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



YaCrud Cluster Template URI: `s3://cfn-artifacts-111/f4c0adbebb70b0b6c337105b4f151492.template`

```
aws s3 mk s3://cfn-artifacts-111
export CFN_BUCKET="cfn-artifacts-111"
gp env CFN_BUCKET="cfn-artifacts-111"


export STACK_NAME="CrdCluster"
gp env STACK_NAME="CrdCluster"
```

```
export BUCKET="cfn-artifacts-111"
gp env BUCKET="cfn-artifacts-111"

export REGION="ca-central-1"
gp env REGION="ca-central-1"
```

[**Developer Reference**](../../bin/cfn/README.md)


```
$ export CFN_BUCKET="cfn-artifacts-111"
$ gp env CFN_BUCKET="cfn-artifacts-111"

CFN_BUCKET=cfn-artifacts-111
```