# Week 7 — Solving CORS with a Load Balancer and Custom Domain
In this, we will continue from last week by focusing on maintaining equilibrium. 

Our technical responsibility for the week involves provisioning and operating containers to execute load balancing tasks, configuring our custom domain and mapping it to the load balancer's URL for seamless functionality.

Our domain, on the other hand, will be fully onboarded to route53 and will be issued the necessary SSL certificate.



We'll also tackle technical tasks like refreshing the JWT token from week 3, refactoring bin directory scripts, and enhancing Docker networking, among others.



## Main Week Seven  Tasks
- [Provision and configure Application Load Balancer along with target groups](#setup-load-balancer)
- Manage your domain using Route53 via hosted zone
- Create an SSL certificate via ACM
- Setup a record set for naked domain to point to frontend-react-js
- Setup a record set for api subdomain to point to the backend-flask
- Configure CORS to only permit traffic from our domain
- Secure Flask by not running in debug mode
- Implement Refresh Token for Amazon Cognito
- Refactor bin directory to be top level
- Configure task definitions to contain x-ray and turn on Container Insights
- Change Docker Compose to explicitly use a user-defined network
- Create Dockerfile specifically for production use case
- Using ruby generate out env dot files for docker using erb templates
- How to securely host a website on AWS with custom domain

---

## Setup Load Balancer

Console → EC2 → Load Balancers <br>
Create an Application Load Balancer named "cruddur-alb" → select 3 subnets.<br>

Create a new Security Group named "cruddur-alb-sg" <br>
→ inbound rules for HTTP  <br>
→ HTTPS traffic from any source.<br>

<img src="assets/week6-7/2-Fargate/7 load-balancer.png">


Listeners and routing: <br>
→ create a target group backend and another. <br>
→ create a target group backendthe frontend.


**Security Rules:**<br>
Change "crud-srv-sg" security group inbound rule:<br>
→ create a new rule that allows traffic from "cruddur-alb-sg" on port 4567.<br>
→ delete the old rule that allowed direct access to the backend Flask server.<br>

<img src="assets/week6-7/2-Fargate/8 cruddur LB.png">


### Create Target Group

**Backend:**<br>
→ Navigate to Basic Configuration and select IP addresses for Fargate, ECS, or EC2.<br>
→ Set the target group name as "cruddur-backend-flask-tg."<br>
→ Configure the target group to use port 4567 and set "/api/health-check" as the health check path.<br>
→ Under Advanced Health Check Settings, set the healthy threshold to 3.<br>
→ Click "Next" and then "Create Target Group."<br>

**Frontend:**<br>
→ Navigate to Basic Configuration and select IP addresses for Fargate, ECS, or EC2.<br>
→ Set the target group name as "cruddur-frontend-react-js."<br>
→ Configure the target group to use port 3000.<br>
→ Under Advanced Health Check Settings, set the healthy threshold to 3.<br>
→ Click "Next" and then "Create Target Group."<br>


**Harmonize:**<br>
→ Remove the default Def SG only from LB  <br>
→ Set "cruddur-alb-sg SG"<br>
→ Set the default action to use the "cruddur-backend-flask-tg" target group with port 4567.<br>
→ Create an additional listener for port 3000 with the default action set to use the "cruddur-frontend-react-js" target group.

<img src="assets/week6-7/2-Fargate/9 load-balancer-setup-target-group.png">

### ECS Loadbalancer



- Add lb config to the [service backend](../aws/json/service-backend-flask.json#L7)

```JSON
"loadBalancers": [
      {
          "targetGroupArn": "<cruddur-backend-flask-tg-ARN>",
          "containerName": "backend-flask",
          "containerPort": 4567
      }           ]
 ```

Delete running backend app from ECS

Recreate fargate service:

```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```

> took me ages waiting for the drain. 

Once finished ur new service will take place. <br>

You can simply go check the lb URL and add ur backend port and map to the health check endpoint. 

```
:4567/api/health-check
```


- Browser gave me:

```JSON
{
     "success":true
}
```



---
> Next.
---