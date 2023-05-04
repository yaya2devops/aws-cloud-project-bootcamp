
## Deploying Networking Layer
```
$ ./bin/cfn/networking-deploy
Uploading to b7b09f0f23030fbf736ef894dc62a0f7.template  5997 / 5997.0  (100.00%)
Waiting for changeset to be created..
Changeset created successfully. 
Run the following command to review changes:
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:ca-central-1:<ur-aws-id>:changeSet/awscli-cloudformation-package-deploy-1683152740/1e7867d4-d255-4bf2-a3c0-f09d8738f99a
```

### AWS CFN Cruddur — Networking Resources

| ID logique | ID physique | Type | Statut | Module |
| --- | --- | --- | --- | --- |
| AttachIGW | Crudd-Attac-1A3W4UWOQ3AWA | AWS::EC2::VPCGatewayAttachment | CREATE_COMPLETE | - |
| IGW | igw-0058d4809880ea0d2 | AWS::EC2::InternetGateway | CREATE_COMPLETE | - |
| RouteTable | rtb-0a0716fe9310eb7a7 | AWS::EC2::RouteTable | CREATE_COMPLETE | - |
| RouteToIGW | Crudd-Route-1QUKWV5V5KYRN | AWS::EC2::Route | CREATE_COMPLETE | - |
| SubnetPriv1 | subnet-0e1112abd3e5d7d43 | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPriv1RTAssociation | rtbassoc-07c39b5d782408b1b | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| SubnetPriv2 | subnet-0356daabb75252d6a | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPriv2RTAssociation | rtbassoc-027168d1ebb4ad1ee | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| SubnetPriv3 | subnet-08a5c5fc473669054 | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPriv3RTAssociation | rtbassoc-086b395c1f6713c5a | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| SubnetPub1 | subnet-02179398e39d1b9fb | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPub1RTAssociation | rtbassoc-07c8745b5bd14097c | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| SubnetPub2 | subnet-0edb0905c39c5453e | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPub2RTAssociation | rtbassoc-0c92b4540a9f1db3b | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| SubnetPub3 | subnet-084a1180ac87c106b | AWS::EC2::Subnet | CREATE_COMPLETE | - |
| SubnetPub3RTAssociation | rtbassoc-04e300e21eb15bad4 | AWS::EC2::SubnetRouteTableAssociation | CREATE_COMPLETE | - |
| VPC | vpc-05c8dd3253102dc32 | AWS::EC2::VPC | CREATE_COMPLETE | - |