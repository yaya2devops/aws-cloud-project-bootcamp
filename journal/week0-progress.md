# Week 0 — Billing and Architecture

## Week Zero Main Tasks
- [Cloudnative Architectures](#cloudnative-architecture)
  - [Logical Design](#creating-logical-diagram)
  - [Conceptual Design](#creating-conceptual-design)
- [Security Considerations](#security-considerations)
  - [Applying MFA](#applying-mfa)
  - [Creating Admin IAM user](#iam-user)
- [Spending Considerations](#spend-considerations)
  - [Create a Billing Alarm](#create-billing-alarm-using-aws-cli)
  - [Create a Budget](#create-aws-budget-using-aws-cli)
- [Use CloudShell](#aws-cloudshell)
- [Generate AWS Credentials](#generate-aws-credentials)
- [Installed AWS CLI](#install-aws-cli)
   - [Setting SNS](#setting-sns)
- [Contact AWS Support](#open-support-ticket)
- [AWS CLI Auto Prompt](#aws-cli-auto-prompt)
- [Design CI/CD Pipeline](#creating-cicd-flow-for-week-9)
- [EventBridge Health Dashboard](#hookup-health-dashboard-to-sns-using-eventbridge)
---

# Cloudnative Architecture 
First step towards great ideas is the discussions with both the technical and business team to ensure that the project's objectives are met in its entirety. It is also important to consider the risks, assumptions, and constraints that may be involved in the project.

It is also necessary to consider the dangers, presumptions, and limitations associated with the project.


## Architectural Diagram
To design an effective architectural diagram, i see there are three stages to follow.

- The first stage is the **conceptual design aka Napkin design**, where the overall idea and scope of the project are defined. 

- The second stage is the **logical design aka Blueprint**, where the system's functionality is mapped out, and the data flow is determined.

- The third stage is the **physical design**, where the physical components and infrastructure required to support the system are identified and integrated. 

## Design Using Lucidchart
Lucidchart is an online diagramming and flowcharting tool that allows users to create and collaborate on a wide range of diagrams. 

<img src="assets/week0/media/simplified-arch.png">

We will be using it for AWS.

The shapes are built in, from file → import data:

<img src="assets/week0/media/use-aws-shapes-inlucid.png">


- [Here](https://aws.amazon.com/fr/architecture/icons/) you can find additional diagramming tools, and AWS icons.


### Creating **Logical Diagram**
- Diagram to help in visualizing the flow of data and interactions between the product and other systems.
- Illustrate the use of Rest APIs in the connection going between the front and the backend.

<img src="assets/week0/media/logical-design.png">

This also highlight the various components of the Cruddur product ecosystem


### Creating **Conceptual Design**
<img src="assets/week0/Cruddur-Architecture/cruddur-architecture.jpg">

[PDF Version](assets/week0/Cruddur-Architecture/cruddur-architecture.pdf)
<details>

<summary> Behind the scenes! </summary>

<img src="assets/week0/Cruddur-Architecture/behind-the-scene.jpg">
</details>

### **Creating CI/CD Flow for week 9**

Here is my go with CI/CD pipeline:
- Developer commits code to GitHub repository.
- AWS CodePipeline is triggered.
- The pipes are stored in the S3 pipeline bucket.
- Code changes are retrieved from AWS CodeCommit and passed to AWS CodeBuild.
- CodeBuild compiles and builds the application artifacts.
- AWS CodeDeploy deploys the artifacts to the target environment.

<img src="assets/week0/media/CICD-Arch.png">


**Reference:**
- [Twitter System Architecture](https://lucid.app/lucidchart/3dd58bb4-27dc-440d-9dc0-9bcd0154a346/edit?viewport_loc=224%2C471%2C1939%2C867%2Cu~1sbYNXU9q3&invitationId=inv_b811bc56-a51b-4481-a306-2f347e725dc5)
- [Diagrams Design](https://lucid.app/lucidchart/f03569ad-27eb-435d-a81e-4c0d404e5951/edit?viewport_loc=-513%2C135%2C2720%2C1216%2CwcSxugjtXe~j&invitationId=inv_d8a1495b-87a4-4031-80bf-08a7067c8e12)



## Frameworks
Frameworks are simply key to reduce complexity,  the risk of errors and making the design process easier. 

### TOGAF
A common language, methodology, and tools for enterprise architecture development to assist in aligning IT strategies with business goals.

TOGAF is structured into four main components:
- **Architecture Development Method:** is a step-by-step approach to developing and implementing enterprise architecture
- **Enterprise Continuum:**  is a classification scheme for architecture artifacts
- **Architecture Content Framework:** defines the skills, processes, and tools required to develop and manage enterprise architecture
- **Architecture Capability Framework:** defines the content of enterprise architecture.


### AWS Well-Architected Tool
We were first encouraged to think about and reflect on these critical pillars:
| Pillar | Focus |
| --- | --- |
| Operational Excellence | Utilizing a fully automated operations pipeline for IT operations |
| Security | Ensuring that security accounts are always up to date |
| Reliability | Building highly reliable systems that self-heal and recover quickly |
| Performance Efficiency | Ensuring that systems are running at peak performance efficiently |
| Cost Optimization | Reducing costs by utilizing cost optimization principles |
| Business Agility | Enabling rapid responses to changing customer requirements and market trends |

## AWS Well-Architected Framework  as Service

The tool includes a set of questions related to above pillars of well-architected frameworks. 

Based on these inputs, a report will be prepared in the end:

<img src="assets/week0/media/aws-arch-frame-service.png">


---

| Requirements                              | Platform/Service        |
|-------------------------------------|------------------------|
| [Adding](#aws-credit)   credit  | [AWS](https://aws.amazon.com/fr/console/)                    |
| [Get](https://github.com/features/codespaces)  in codespaces             | [GitHub](https://github.com/)                 |
| [Created](https://gitpod.io/workspaces/)      Gitpod account         | [Gitpod](https://www.gitpod.io/)                   |
| [Created](https://login.gomomento.com/u/login/identifier?state=hKFo2SBydW5CS2FYZ3pyREZZYnpjR25WcDN4cHBNQ1hjSnRfUqFur3VuaXZlcnNhbC1sb2dpbqN0aWTZIGszTWt4MEpyeGxmWS1DQmFqRHRrZW1OYzdpVjFBWTV3o2NpZNkgaTVkbWN4OU9ab1ZNSkFMbm1KSXJGM1pwTUJMTW5tN0Q)  Momento Account             | [Momento](https://www.gomomento.com/)                  |
| [Signed up](https://lucid.app/pricing/lucidchart?km_CPC_AdGroupID=60168113511&utm_source=google&km_CPC_CampaignId=1484560204&_gl=1*91j79g*_ga*MTgwNTUzMzQ0OS4xNjgzNDkyMzcy*_ga_MPV5H3XMB5*MTY4MzQ5MjM3NC4xLjAuMTY4MzQ5MjM3NC42MC4wLjA.*_gcl_aw*R0NMLjE2ODM0OTIzNzYuRUFJYUlRb2JDaE1JcDUzNTVJbmtfZ0lWbGdHTENoMUxjUUVtRUFBWUFTQUFFZ0ttTGZEX0J3RQ..&km_CPC_MatchType=b&km_CPC_Country=9075947&km_CPC_Keyword=%2Blucidchart+%2Bsign+%2Bup&gclid=EAIaIQobChMIp5355Ink_gIVlgGLCh1LcQEmEAAYASAAEgKmLfD_BwE&km_CPC_Creative=442433233598&sessionDate=2023-05-07T20%3A46%3A11.871Z&km_CPC_TargetID=kwd-336567026148&referer=https%3A%2F%2Fwww.lucidchart.com%2Fpages%2Flanding&utm_medium=cpc&km_CPC_target=&km_CPC_Device=c&anonId=0.45d5ec4b187f7f6fd97&km_CPC_AdPosition=&km_CPC_ExtensionID=&km_CPC_Network=g&sessionId=0.12a98969187f7f6fd9c&utm_campaign=_chart_en_tier3_mixed_search_brand_bmm_&km_CPC_placement=#/createAccount)   for Lucid Charts       | [Lucid Charts](https://www.lucidchart.com/)             |
| [Signed up](https://ui.honeycomb.io/signup) for HoneyComb        | [HoneyComb.io](https://www.honeycomb.io/)            |
| [Signed up](https://rollbar.com/signup/) for Rollbar               | [Rollbar](https://rollbar.com/)                  |


---

# Security Considerations
Implementing security measures are very critical and can help mitigate risks by reducing the likelihood of security breaches and unauthorized access.
- Use strong authentication and authorization mechanisms: IAM, MFA & STS.
- Implement network security, Enable encryption and continiously monitor your resources using e.g. CloudTrail and CloudWatch.
- Use secure coding practices to ensure that your applications are secure from the ground up


## Applying MFA

As the most powerful user in an AWS account, securing the Root user account is crucial. 

- Implemen MFA provides an extra layer of protection. 
- To set MFA → profile → security credentials → set MFA

<img src="assets/week0/MFA1.png">


**Organization Unit** are logical unit within AWS Organizations
- allows you to organize and manage your AWS accounts more effectively.
- lets yougroup AWS accounts based on different criteria, such as business unit, department, or application.
- lets you simplify account management tasks, such as setting up billing and cost alloca


##  IAM User:
IAM users are individuals or apps that use AWS resources.
- Users can be given specific permissions to access AWS resources
- And this is controlled through policies and roles.


**Setting IAM User:**
<img src="assets/week0/IAM DONE.png">

> for example@example.com, possible to allias: example+alias@example.com

**Connecting as IAM User:**
<img src="assets/week0/hiiam.png">


**Create Role:**
- From IAM left pane select roles.
- For the time being, select AWS Services and EC2
- Select AdministratorAccess policy.
<img src="assets/week0/media/role.png">


**Attach Policy:**
-  IAM pane select policies
-  Select SecurityAudit policy and 
-  attach it to a role or a user group.

<img src="assets/week0/media/attaching-policy.png">


**Service control policies [SCPs](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)**

A type of organization policy that you can use to manage permissions in your organization.


- e.g. apply this if you want deny whoever to quit an Org:

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Action": [
                "organizations:LeaveOrganization"
            ],
            "Resource": "*"
        }        ] 
}
```


## Top 5 Security Best Practices
- Data Protection & Residency in accordance with Security Policy
- Identity & Access Management with the Least Privilege
- Governance & Compliance of AWS Services being used
   - Global vs Regional Services
   - Compliant Services
- Shared Responsibility of Threat Detection
- Incident Response Plans to include Cloud


### **Hookup Health Dashboard to SNS using EventBridge**

**Configure Sub/Pub**

- Create SNS Topic
```sh
aws sns create-topic --name eventbridge-alert
```

Returning

```JSON
{
    "TopicArn": "arn:aws:sns:ca-central-1:598485450821:eventbridge-alert"
}
```
- Subs to topic using the arn above

```sh
aws sns subscribe \
--topic-arn arn:aws:sns:<REGION>:<ACCOUNTID>:eventbridge-alert \
--protocol <email> \
--notification-endpoint <EMAIL>
```

Returning
```JSON
{
    "SubscriptionArn": "pending confirmation"
}
```
**Emailed**
```txt
You have chosen to subscribe to the topic: 
arn:aws:sns:ca-central-1:598485450821:eventbridge-alert
To confirm this subscription, click or visit the link below (If this was in error no action is necessary): 
Confirm subscription
```

Confirmation:

<img src="assets/week0/subs-to-topic.png">


**Simple Notification Service:**

<img src="assets/week0/sns-for-event-bridge.png">




**Create EventBridge Rule**

- Use [this file.](../aws/) and create **Event Rule**
```sh
aws events put-rule --name "sns-eventbridge-health" \
--event-pattern file://aws/json/sns-eventbridge.json
```

Returning
```JSON
{
    "RuleArn": "arn:aws:events:ca-central-1:598485450821:rule/sns-eventbridge-health"
}
```
<img src="assets/week0/sns-eventbridge-health.png">

**Add a target**
```sh
aws events put-targets --rule sns-eventbridge-health --targets "Id"="1","Arn"="arn:aws:sns:us-east-1:<REDACTED>7434:eventbridge-alert"
```

Returning, no failure
```JSON
{
    "FailedEntryCount": 0,
    "FailedEntries": []
}
```

**Console Overview:**

<img src="assets/week0/sns-eventbridge-health-target.png">


# Spend Considerations
The costs of services can vary depending on the type of service and the region in which it is being offered.

other critical bullets incl.
- pick what fits from On-Demand, Reserved Instances, and Spot Instances.
- Continously monitor and get notified on spend using AWS services.




View cost and services that are currently running.

- Left pane: Profile → Billing Dashboard → Bills 


## CloudWatch Alarm


Billing Management Budgets are a newer method of alerting about spending that replaces alerts.

- specify the below:

<img src="assets/week0/1 alarm.png">


- Notifcation on the topic:

<img src="assets/week0/4- notif received.png">

## Budget

Notifies when:
- actual spending reaches 85% 
- forecasted spend is expected to reach 100%

<img src="assets/week0/3 budget is set .png">



## AWS Credit

To redeem credits, view the credit balance.

- Profile → Billing Dashboard → Credits (left pane)

<img src="assets/week0/Amazing i got a credit..png">

Some credit is only applicable to a few services.




## Or AWS Free Tier

To view details related to AWS free tier [https://aws.amazon.com/free](https://aws.amazon.com/free)

- Each service has different types of free options.




---

## AWS Cloudshell

<img src="assets/week0/media/usingcloudshell.png">




#### **Generate AWS Credentials:**

<img src="assets/week0/CLI-WORK/1-GENERATE CREDENITIAL ACCESS KEY.png">


**Setting Environement variables for Gitpod:**

```BASH
gp env instead of export 
```

<img src="assets/week0/CLI-WORK/6 setting the aws cli env var in gitpod auto.png">


### **AWS CLI auto-prompt**

**In Git Terminal:** <br>

- adding these lines to `.bashrc`

<img src="assets/week0/media/adding-aws-partial.png">


```BASH
export AWS_CLI_AUTO_PROMPT=on
export PS1="\[\033[38;5;247m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;243m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;47m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

```


- the auto-prompt enables you to use the 'Enter' to complete the command.

<img src="assets/week0/media/adding-aws-partial2.png">


**In Gitpod:** <br>

<img src="assets/week0/media/week0-extension-on-gitpod.png">


## Install AWS CLI

Get the package from CURL as ZIP:
```BASH
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

- unzip it:
```
unzip awscliv2.zip
```

- install the cli:
```
sudo ./aws/install
```

- Checking Connections:

```
aws sts get-caller-identity
```
<img src="assets/week0/CLI-WORK/5 connected to aws from gitpod .png">

- Get the id only:

```bash
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
```

---

## Create AWS Budget




<img src="assets/week0/CLI-WORK/7 Budget 1.png">

- Using the required env var in the below command:

```
aws budgets create-budget \
    --account-id $AWS_ACCOUNT_ID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json

```

<img src="assets/week0/CLI-WORK/8 budget 2 applied.png">


- 2 budges listed below, from operations and terminal:

<img src="assets/week0/CLI-WORK/9 budget 3 done success.png">

**[Reference](https://docs.aws.amazon.com/cli/latest/reference/budgets/create-budget.html#examples)**

## Setting SNS

- creating the topic.

```bash
aws sns create-topic --name CLI-billing-alarm
```

<img src="assets/week0/CLI-WORK/11 sns cli create.png">

**Subscribing SNS:**

```bash
aws sns subscribe \
    --topic-arn="arn:aws:sns:ca-central-1:598485450821:CLI-billing-alarm" \
    --protocol=email \
    --notification-endpoint yahyaabulhaj@outlook.com
```

- Confirmation mail: 

<img src="assets/week0/CLI-WORK/13 SNS CLI CONFIRM MAIL.png">


- Changes took effects in the console:

<img src="assets/week0/CLI-WORK/16 perfect .png">

## Create CloudWatch

```
aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json
```
<img src="assets/week0/CLI-WORK/17 cloudwatch alarm command.png">

- Alarm on daily estimated charges:

<img src="assets/week0/CLI-WORK/18 alarm is here notification.png">




## **Open Support ticket**  

**[Request  Service Limit](https://support.console.aws.amazon.com/support/home#/ )**
Instructions
- Navigate to the AWS Support Center
- On the left side menu, select "Create Case"
- Select "Looking for service limit increase?" from the link in the center right
- Specify the limit or feature that you need
- Click on "Create Case"
- Verify that the ticket you opened reflects the necessary details

<img src="assets/week0/4 case.png">

- Confirmation:

<img src="assets/week0/6 cased.png">

---


## Takeaway
Mirroring on my first week at this bootcamp, I can say with certainty that it was a steep learning curve for me. 

I was immersed in a variety of topics and concepts, ranging from desigining architectures, Linux going to the AWS operations hands on.

---
# ———Remake OK—————
---