# Week 0 — Billing and Architecture


### Week 0 Summary 👋
Hey! I am very excited to be a part of this amazing bootcamp!

I'd like to begin by expressing my commitment to fully engaging in all tasks assigned to me and closely following instructions. It's not just about finishing the program for me; it's also about enjoying the learning journey along the way. With that said, let me go over my observations from the first week.

During Week 0, the emphasis was on introducing participants, including myself, to the program. The week began with a discussion about the importance of security, followed by an examination of the benefits of microservice architecture and much more.

Hands-on experience with Lucidchart was also provided, which felt familiar to me because I used Drawio and Visio at work for security architectures. Moreover, The importance of working under an IAM (Identity and Access Management) rather than root in AWS was highlighted and applied below!

We were also taught how to manage AWS expenses using budgets and alert operations using the AWS Console as well as the AWS CLI, from shell but also outside.



We were also encouraged to think about and reflect on these critical pillars:
| Pillar | Focus |
| --- | --- |
| Operational Excellence | Utilizing a fully automated operations pipeline for IT operations |
| Security | Ensuring that security accounts are always up to date |
| Reliability | Building highly reliable systems that self-heal and recover quickly |
| Performance Efficiency | Ensuring that systems are running at peak performance efficiently |
| Cost Optimization | Reducing costs by utilizing cost optimization principles |
| Business Agility | Enabling rapid responses to changing customer requirements and market trends |


Mirroring on my first week at this bootcamp, I can say with certainty that it was a steep learning curve for me. I was immersed in a variety of topics and concepts, ranging from desigining architectures, Linux to automation.

Finally, the AWS operations hands on was extremely beneficial, particularly in terms of cost management and resource optimization. I discovered the significance of setting up billing alerts and how to use AWS to track and investigate my expenses.


Allow me to take you to a small portion of the process that I thought I'd capture.

# 1- Creating Architecture 
I loved the beard guy and how he mentioned about TOGAF Certification, it's a pursue of a high entreprise architects. Maybe, i'll consider it going further.
It is not required, but the knowledge it contains is super fun.


## So i started with this, great and simple!

<img src="assets/week0/babytry.png">


## Then getting the devops workflow in with AWS Services
<img src="assets/week0/cicd.png">


## And then the TOGAF Certified result, JK it is Andrew

<img src="assets/week0/mm.png">

That was it my essay with these charts, You can play with my work from [here](https://lucid.app/lucidchart/f03569ad-27eb-435d-a81e-4c0d404e5951/edit?viewport_loc=-513%2C135%2C2720%2C1216%2CwcSxugjtXe~j&invitationId=inv_d8a1495b-87a4-4031-80bf-08a7067c8e12).


Andrew has provided more great architecture, such as the Twitter System Arch and others that may be useful; check them out from [here!](https://lucid.app/lucidchart/3dd58bb4-27dc-440d-9dc0-9bcd0154a346/edit?viewport_loc=224%2C471%2C1939%2C867%2Cu~1sbYNXU9q3&invitationId=inv_b811bc56-a51b-4481-a306-2f347e725dc5) 



# 2- Setting up AWS IAM

## MFA FOR ROOT
<img src="assets/week0/MFA1.png">

## Login to the new IAM
<img src="assets/week0/loginNEWIAM.png">



# IAM assigned
<img src="assets/week0/IAM DONE.png">


## Connection as IAM & Apply MFA
<img src="assets/week0/hiiam.png">



# 3- Operation Work In The AWS Console

## CloudWatch Metric ALARM Ops


<img src="assets/week0/1 alarm.png">

<img src="assets/week0/2 alarm.png">



<img src="assets/week0/3- pick a topic.png">


<img src="assets/week0/4- notif received.png">


<img src="assets/week0/5- BILLINB ALARM DONE.png">


<img src="assets/week0/6-done.png">


<img src="assets/week0/7-waiting alarm.png">




## Create a Budget Ops



<img src="assets/week0/&.png">

<img src="assets/week0/1bud.png">


<img src="assets/week0/2bud.png">


### Its well set!
<img src="assets/week0/3 budget is set .png">

## I can work with that
<img src="assets/week0/Amazing i got a credit..png">

# 4- AUTHENITICATION TO AWS - CLIs Work From Gitpod CLI (or any!)

### Generated  Access Key
Did this in order to authenticate to AWS CLI from outside e.g. Gitpod CLI!
<img src="assets/week0/CLI-WORK/1-GENERATE CREDENITIAL ACCESS KEY.png">

### I required ENV VAR
<img src="assets/week0/CLI-WORK/3 aws available but need to add env variable .png">

### Solved
<img src="assets/week0/CLI-WORK/4 danger zone set the stuff.png">

### Check AWS Connection

```
aws sts get-caller-identity
```

<img src="assets/week0/CLI-WORK/5 connected to aws from gitpod .png">

## Set ENV var for gitpod 
```
gp env instead of export 
```
<img src="assets/week0/CLI-WORK/6 setting the aws cli env var in gitpod auto.png">

# 5- Budget setup start

### $ AWS ACCOUNT ID process

get the id

```
aws sts get-caller-identity
```
 or? 

```
aws sts get-caller-identity --query Account

```


or without " " ?

```
aws sts get-caller-identity --query Account --output text

```

set it to env variable now since we aint changing that.

```
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

```

check it 

```
env grep ACCOUNT
```

save it?

```
gp env  AWS_ACCOUNT_ID="598485450821"
```
<img src="assets/week0/CLI-WORK/7 Budget 1.png">

```
aws budgets create-budget \
    --account-id $AWS_ACCOUNT_ID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json

```

<img src="assets/week0/CLI-WORK/8 budget 2 applied.png">

## Voilà
<img src="assets/week0/CLI-WORK/9 budget 3 done success.png">

# 6- Setting SNS
Checking have this from Chirag video "ops", this will stay that way even later because this is region sensitive.
<img src="assets/week0/CLI-WORK/10 sns topic from ops is here.png">

### Create SNS

```
aws sns create-topic --name CLI-billing-alarm
```

<img src="assets/week0/CLI-WORK/11 sns cli create.png">

### Confirm SNS

```
aws sns subscribe \
    --topic-arn="arn:aws:sns:ca-central-1:598485450821:CLI-billing-alarm" \
    --protocol=email \
    --notification-endpoint yahyaabulhaj@outlook.com
```
<img src="assets/week0/CLI-WORK/12 sns confirm.png">
<img src="assets/week0/CLI-WORK/13 SNS CLI CONFIRM MAIL.png">

### Mailed Confirmed
<img src="assets/week0/CLI-WORK/14 confirmed.png">

## Let's check with Canada Central!
<img src="assets/week0/CLI-WORK/15 here it is in the right region.png">
<img src="assets/week0/CLI-WORK/16 perfect .png">

## CloudWatch

```
aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json
```
<img src="assets/week0/CLI-WORK/17 cloudwatch alarm command.png">
<img src="assets/week0/CLI-WORK/18 alarm is here notification.png">

## Appeared in AWS Console
<img src="assets/week0/CLI-WORK/19 en alarme.png">

## Investigating Cloudwatch
<img src="assets/week0/CLI-WORK/20 the end.png">




# Wrapping Week 0: Open Support ticket & request  Service Limit

 **[Instructions](https://support.console.aws.amazon.com/support/home#/ )**
- Navigate to the AWS Support Center
- On the left side menu, select "Create Case"
- Select "Looking for service limit increase?" from the link in the center right
- Specify the limit or feature that you need
- Click on "Create Case"
- Verify that the ticket you opened reflects the necessary details

<img src="assets/week0/1 case.png">

<img src="assets/week0/2 case.png">

<img src="assets/week0/3 case.png">

## Case Details
<img src="assets/week0/4 case.png">


#### Emailed on the case:

<img src="assets/week0/6 cased.png">

---

# Week Zero To-Do & Student Status

| Task | Status   |
|:------|:----------:|
| Watched Week 0 - Live Streamed Video | ✅ |
| Watched Chirag's Week 0 - Spend Considerations | ✅ |
| Watched Ashish's Week 0 - Security Considerations | ✅ |
| Recreate Conceptual Diagram in Lucid Charts or on a Napkin | ✅ |
| Recreate Logical Architectual Diagram in Lucid Charts | ✅ |
| Create an Admin User | ✅ |
| Use CloudShell | ✅ |
| Generate AWS Credentials | ✅ |
| Installed AWS CLI | ✅ |
|Understand how to look at monthly billing reports|✅|
| Create a Billing Alarm | ✅ |
| Create a Budget | ✅ |

---

# Homework Challenges & Student Status

| Challenges                                                                                        | Status |
|:----------------------------------------------------------------------------------------------------------|:--------:|
| Destroy your root account credentials, Set MFA, IAM role                                                |     ✅   |
| Review all the questions of each pillars in the Well Architected Tool (No specialized lens)             |     ✅   |
| Create an architectural diagram (to the best of your ability) the CI/CD logical pipeline in Lucid Charts |  ✅      |
| Research the technical and service limits of specific services and how they could impact the technical path for technical flexibility. |    ✅    |
| Open a support ticket and request a service limit                                                        |  ✅      |
|Use EventBridge to hookup Health Dashboard to SNS and send notification when there is a service health issue| ⌛|



