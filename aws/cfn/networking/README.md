
## Deploying Networking Layer
```s
./bin/cfn/networking 

Uploading to networking/442c87004a2e748a197c6e9e62d8f33f.template  6749 / 6749.0  (100.00%)

Waiting for changeset to be created..
Changeset created successfully. Run the following command to review changes:
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:<region>:<aws-id>:changeSet/awscli-cloudformation-package-deploy-1686829989/98025596-13b4-444f-9c6d-b7eea04e16e7
```
> [Refer to the console](../../../journal/assets/week11/cfn-stack/network-stack-cfn.png) 

### AWS CFN Cruddur — Networking Resources

[CloudFormation](../../../journal/assets/week11/cfn-stack/resources-networking-layer-cfn.png)
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

### AWS CFN Cruddur — Networking Resources

Below are the events triggered after executing the change set in the console.


Événements (54)

| Horodatage             | ID logique                   | Statut            | Motif du statut               |
|------------------------|------------------------------|--------------------|-------------------------------|
| 15-06-2023 14:44:26 UTC+0200 | CrdNet                    | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:24 UTC+0200 | RouteToIGW                | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:09 UTC+0200 | RouteToIGW                | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:08 UTC+0200 | RouteToIGW                | CREATE_IN_PROGRESS | -                             |
| 15-06-2023 14:44:07 UTC+0200 | AttachIGW                 | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPriv3RTAssociation  | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPub2RTAssociation   | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPub3RTAssociation   | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPriv2RTAssociation  | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPub1RTAssociation   | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPriv3RTAssociation  | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPub2RTAssociation   | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPub3RTAssociation   | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:01 UTC+0200 | SubnetPriv1RTAssociation  | CREATE_COMPLETE   | -                             |
| 15-06-2023 14:44:00 UTC+0200 | SubnetPriv2RTAssociation  | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:00 UTC+0200 | SubnetPub1RTAssociation   | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:44:00 UTC+0200 | SubnetPriv1RTAssociation  | CREATE_IN_PROGRESS | Resource creation Initiated  |
| 15-06-2023 14:43:59 UTC+0200 | SubnetPub2RTAssociation   | CREATE_IN_PROGRESS | -                             |
| 15-06-2023 14:43:59 UTC+0200 | SubnetPriv3RTAssociation  | CREATE_IN_PROGRESS | -                             |
| 15-06-2023 14:43:59 UTC+0200 | SubnetPub3RTAssociation   | CREATE_IN_PROGRESS | -                             |
| 15-06-2023 14:43:59 UTC+0200 | SubnetPriv1RTAssociation  | CREATE_IN_PROGRESS | -                             |
| 15-06-2023 14:43:46 UTC+0200 | RouteTable           | CREATE_IN_PROGRESS  | -                             |
| 15-06-2023 14:43:45 UTC+0200 | VPC                    | CREATE_COMPLETE     | -                             |
| 15-06-2023 14:43:34 UTC+0200 | IGW                    | CREATE_IN_PROGRESS  | Resource creation Initiated   |
| 15-06-2023 14:43:34 UTC+0200 | VPC                    | CREATE_IN_PROGRESS  | Resource creation Initiated   |
| 15-06-2023 14:43:33 UTC+0200 | IGW                    | CREATE_IN_PROGRESS  | -                             |
| 15-06-2023 14:43:33 UTC+0200 | VPC                    | CREATE_IN_PROGRESS  | -                             |
| 15-06-2023 14:43:30 UTC+0200 | CrdNet                 | CREATE_IN_PROGRESS  | User Initiated                |
| 15-06-2023 13:53:10 UTC+0200 | CrdNet                 | REVIEW_IN_PROGRESS  | User Initiated                |