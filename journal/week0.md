# Week 0 — Billing and Architecture

This was a very introduction week. Not heavy instructions more to get folks a good welcome and get them on board.

- We discussed security and its importance
- Also the importance of good architecture going to the benefits of the microservice architecture.
- I also got the chance to have some hands on Lucidchart, i'm well practical with drawio & visio at work so this felt very similar
- We then discussed some AWS stuff and the importance of working under an IAM rather than root.
- We did great operations related to budget, alerts and to have sense of your expenses on AWS Cost explorer.

Here is a reminder for you.

| Pillar | Focus |
| --- | --- |
| Operational Excellence | Utilizing a fully automated operations pipeline for IT operations |
| Security | Ensuring that security accounts are always up to date |
| Reliability | Building highly reliable systems that self-heal and recover quickly |
| Performance Efficiency | Ensuring that systems are running at peak performance efficiently |
| Cost Optimization | Reducing costs by utilizing cost optimization principles |
| Business Agility | Enabling rapid responses to changing customer requirements and market trends |


Let's go on some of the things i worked on!


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



## IAM FROM ROOT to me YahyaAbulhaj
<img src="assets/week0/IAM DONE.png">


## Hi YahyaAbulhaj Is Ne; Apply MFA to it as well
<img src="assets/week0/hiiam.png">


# Create a Budget

Creating using the JSON.


Type this in your terminal interface
```
aws budgets create-budget \
    --account-id $AWS_ACCOUNT_ID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json

```

You should have the file in the exact same path. If you wish to have it on root (not a good practice) take the `/aws.`

[Here r the files](../aws/json/README.md) used


## Result:

<img src="assets/week0/doingbudget.png">




# Subscribe to Topic
I get an email where i have to confirm to recieve the notifications alerts.

```
aws sns subscribe \
    --topic-arn arn:aws:sns:us-east-1:706157350338:Default_CloudWatch_Alarms_Topic \
    --protocol email \
    --notification-endpoint Yahya@itzYahya.tech
```

Thanks Zohoo for this email with my domain. I got it for free. The only thing required was to have a domain.

> proof here required

# CloudWatch Metric ALARM

```
aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json
```
> proof here required

In case you are still wondering about the file, its [here](../aws/json/alarm_config.json.example)



# Hooking up Health Dashboard to SNS using EventBridge
> proof here required



# Open Support ticket & request  Service Limit
> proof here required

My instructions:
- Navigate to the AWS Support Center
- On the left side menu, select "Create Case"
- Select "Looking for service limit increase?" from the link in the center right
- Specify the limit or feature that you need
- Click on "Create Case"
- Verify that the ticket you opened reflects the necessary details

https://support.console.aws.amazon.com/support/home#/