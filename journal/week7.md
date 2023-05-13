# Week 7 — Solving CORS with a Load Balancer and Custom Domain
In this, we will continue from last week by focusing on maintaining equilibrium. 

<img src="assets/week6-7/ArchitectStuff/2-app-via-lb.jpg">

- [Get it.](assets/week6-7/ArchitectStuff/2-app-via-lb.drawio)


Our technical responsibility for the week involves provisioning and operating containers to execute load balancing tasks, configuring our custom domain and mapping it to the load balancer's URL for seamless functionality.

Our domain, on the other hand, will be fully onboarded to route53 and will be issued the necessary SSL certificate.



We'll also tackle technical tasks like refreshing the JWT token from week 3, refactoring bin directory scripts, and enhancing Docker networking, among others.



## Main Week Seven  Tasks
- [Provision and configure Application Load Balancer along with target groups](#setup-load-balancer)
- [Manage your domain using Route53 via hosted zone](#route-53-with-porkbun-domain-provider)
- [Create an SSL certificate via ACM](#ssl-request-using-aws-certificate-manager)
- [Setup a record set for naked domain to point to frontend-react-js](#connect-dns-to-alb)
- [Setup a record set for api subdomain to point to the backend-flask](#connect-dns-to-alb)
- [Configure CORS to only permit traffic from our domain](#cross-origin-resource-sharing)
- [Secure Flask by not running in debug mode](#flask-security-restricting-access-based-on-ip-address)
- [Implement Refresh Token for Amazon Cognito](#implement-refresh-token-cognito)
- [Refactor bin directory to be top level](#refactor-bin-directory)
- [Configure task definitions to contain x-ray and turn on Container Insights](#fargate---configuring-for-container-insights)
- [Change Docker Compose to explicitly use a user-defined network](#docker-container-networks)
- [Create Dockerfile specifically for production use case](#working-with-docker-images-in-production)
- [Using ruby generate out env dot files for docker using erb templates](#env-var)
- [How to securely host a website on AWS with custom domain](#frontend-application-on-cloudfront)

---

## Setup Load Balancer

Console → EC2 → Load Balancers <br>
Create an Application Load Balancer named "cruddur-alb" → select 3 subnets.<br>

Create a new Security Group named "cruddur-alb-sg" <br>
- inbound rules for HTTP  <br>
-  HTTPS traffic from any source.<br>

<img src="assets/week6-7/2-Fargate/7 load-balancer.png">


Listeners and routing: <br>
-  create a target group backend and another. <br>
-  create a target group backendthe frontend.


**Security Rules:**<br>
Change "crud-srv-sg" security group inbound rule:<br>
-  create a new rule that allows traffic from "cruddur-alb-sg" on port 4567.<br>
-  delete the old rule that allowed direct access to the backend Flask server.<br>

<img src="assets/week6-7/2-Fargate/8 cruddur LB.png">


### Create Target Group

**Backend:**<br>
-  Navigate to Basic Configuration and select IP addresses for Fargate, ECS, or EC2.<br>
-  Set the target group name as "cruddur-backend-flask-tg."<br>
-  Configure the target group to use port 4567 and set "/api/health-check" as the health check path.<br>
-  Under Advanced Health Check Settings, set the healthy threshold to 3.<br>
→ Click "Next" and then "Create Target Group."<br>

**Frontend:**<br>
- Navigate to Basic Configuration and select IP addresses for Fargate, ECS, or EC2.<br>
- Set the target group name as "cruddur-frontend-react-js."<br>
- Configure the target group to use port 3000.<br>
- Under Advanced Health Check Settings, set the healthy threshold to 3.<br>
→ Click "Next" and then "Create Target Group."<br>


**Harmonize:**<br>
- Remove the default Def SG only from LB  <br>
- Set "cruddur-alb-sg SG"<br>
- Set the default action to use the "cruddur-backend-flask-tg" target group with port 4567.<br>
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
{ "success":true }
```




---

## Route 53 with Porkbun Domain Provider

<details>
<summary>
Porkbun Overview
</summary>

<img src="assets/week6-7/yacrud.me/1-name-server-to-route53.png">

</details>

- Log in to your AWS account and navigate to the Amazon Route 53 console.
- Click on the "Hosted zones" option and select the domain for which you want to add the nameservers.
- Click on the "Create record" button and select "NS" and SOA as the record type.
- Copy the NS and SOA values 
- In the "Value" field, enter the nameservers that you want to add. 
- You can find the nameservers in your domain registrar's account or with your web hosting provider.
- Click on the "Create records" button to save the changes.


<img src="assets/week6-7/yacrud.me/2-route-name-servers-map.png">



Once the changes are saved, you will need to wait for the changes to propagate across the DNS network, which can take anywhere from a few minutes to a 48 hours; Mine happened extremely quick.

## SSL Request using AWS Certificate Manager

- Log in to your AWS account and navigate to the AWS Certificate Manager (ACM) console.
- Click on the "Request a certificate" button.
- Enter the domain name for which you want to create the SSL certificate:
   - In the **Fully qualified domain name** field, enter [`yacrud.me`]()
   - Click **Add another name to this certificate**, and add `*.yacrud.me`

   <img src="assets/week6-7/yacrud.me/3-ssl-certificate.png">

- click on the "Request" button.
- Follow the on-screen instructions to complete the domain validation process.
- Check the required CNAME in Route 53

<img src="assets/week6-7/yacrud.me/5-cert-success-with-route-53.png">


You can now use this SSL certificate route 53 when it returns as success.


**OFF-CRUDDUR**

- I took my main domain to Route53 as well.

<img src="assets/week6-7/3-DNS/2- route.png">

- Assigned the Certificate

<img src="assets/week6-7/3-DNS/3-certificate-after-cloudflare.png">

Here are my [DNS Configuration](assets/week6-7/3-DNS/DNS_Configuration.csv)

## Configuring ALB Listeners and Routing for Frontend and API 

- Go to the EC2 Load Balancer page and select the "cruddur-alb" load balancer.
- Navigate to the "Listeners" tab and click on "Add Listener."
- Set the "Default actions" to "Redirect" and the "Port" to "443," then click "Add."
- Add another listener and set the "Protocol" to "HTTPS" and the "Port" to "443."
- In the "Default actions" field, select "Forward" and choose the "frontend-react-js" target group from the dropdown menu.
- Choose the SSL/TLS certificate that you previously created from the "Default SSL/TLS certificate" dropdown, then click "Add."
<img src="assets/week6-7/yacrud.me/6-443-rules-manage.png">
- Delete the "HTTP:3000" and "HTTP:4567" listeners.
- Check the box for "HTTPS:443" and click the "Manage Rules" button.
- Click on "Insert Rule" and then click "Add Condition" followed by "Host Header."
- Set the "is" field to "api.yacrud.me" and click "Add Action" followed by "Forward to."
- Select the "backend-flask" target group from the dropdown menu, then click "Save."
Your backend API is now accessible via the "api.yacrud.me" in my case.
<img src="assets/week6-7/yacrud.me/8-listener-associated-with-cert.png">





## Connect DNS to ALB



- Check App on Loadbalancer
<img src="assets/week6-7/yacrud.me/9-checking-load-balancer-rule.png">
- Open the Route53 console in your AWS account and select the domain you want to point to the ALB.
- In the domain management section, click on the "Create Record" button to add a new record.
- Under the record creation options, choose "Alias" and select "Alias to Application and Classic Load Balancer" from the dropdown menu for "Route traffic to."
- Choose the "ca-central-1" region and select your target Application Load Balancer from the list of load balancers.
- Click on the "Create Route" button to save the record.
<img src="assets/week6-7/yacrud.me/7-create-alias-internal-resource-for-lb-record.png">
- To create a subdomain for your API, click on "Create Record" again and this time set the "Record name" to "api."
- Follow the same alias setup as above, choosing the same ALB target as the main domain.
- Expect to have these records
<img src="assets/week6-7/yacrud.me/14-route53-cruddur-records-overview-final.png">
- Wait for the DNS changes to propagate, which can take a few minutes or several hours.
- Once the changes have taken effect, visit your custom domain in a web browser to view the frontend. 

Your frontend should now be working on the custom domain, with API requests being directed to the ALB.

Note that it may take some time for the changes to take effect, so you may need to wait or try accessing the site from a different browser.

- Try checking Frontend
<img src="assets/week6-7/yacrud.me/11-website-functional.png">

**Test the backend**

- Start from CLI using Curl
<img src="assets/week6-7/yacrud.me/10-backend-dns-test.png">

- Head over the browser and test
<img src="assets/week6-7/yacrud.me/12-website-backend-working.png">

- Check Access to Data
<img src="assets/week6-7/yacrud.me/13-backend-path.png">

- App Function with RDS in PROD
<img src="assets/week6-7/yacrud.me/15-cruddur-week7-done.png">





---


### Cross-origin resource sharing 


To update the CORS settings for your backend task definition, follow these steps:

1- Open the `aws/task-definitions/backend-flask.json` file and add your domain to the following section:

```
{"name": "FRONTEND_URL", "value": "https://<domain>"},
{"name": "BACKEND_URL", "value": "https://api.<domain>"},
```

2- Save the changes to the file.

3- Run the following command to update the task definition:

```sh
aws ecs register-task-definition --cli-input-json file://aws/task-definitions/backend-flask.json
```



#### Frontend Docker Build

- Login to ECR.

```bash
docker build \
--build-arg REACT_APP_BACKEND_URL="https://api.yacrud.me" \
--build-arg REACT_APP_FRONTEND_URL="https://yacrud.me" \
--build-arg REACT_APP_AWS_PROJECT_REGION="$AWS_DEFAULT_REGION" \
--build-arg REACT_APP_AWS_COGNITO_REGION="$AWS_DEFAULT_REGION" \
--build-arg REACT_APP_AWS_USER_POOLS_ID="" \
--build-arg REACT_APP_CLIENT_ID="" \
-t frontend-react-js \
-f Dockerfile.prod .
```
- Run build command with updated URL from frontend folder.
- Tag and push container image.


## ECS Services for Full-Stack App


Update your ECS services with the latest changes, follow these steps
- Navigate to the ECS console.
- Check the box next to the `backend-flask` service, and click **Update** to make changes.
- Check the **Force new deployment** checkbox.
- Select the latest **Revision**.
- Click **Update**.
- Repeat the same steps for the `frontend` service.
- Wait for the changes to complete.
- Verify that both the frontend and backend URLs are running.

You can check if your full-stack app is running by visiting the URL shown in the ECS console or navigating to the frontend URL in your browser. If the app is running correctly, you should see a success message or the expected content for your application.



## Flask Security: Restricting Access based on IP Address

To restrict access to your Flask application to specific IP addresses, follow these steps:

- Navigate to the EC2 console and select **Security Groups**.
- Check the box next to **cruddur-alb-sg** and click on **Edit inbound rules**.
- Remove the rules for ports 4567 and 3000.
- For the remaining rules, change the Source Type to **My IP**.
- Save the changes to the security group.
This will ensure that only IP addresses added to the Source Type can access the website.



### Disable Debug Mode
To disable debug mode, follow these steps:

- Navigate to the `backend-flask` directory.
- Create a new file called `Dockerfile.prod` and copy the contents of `Dockerfile` into this new file.
- Update the CMD line in `Dockerfile.prod` with the following command:
```
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567", "--no-debug","--no-debugger", "--no-reload" ]
```
- Delete `ENV FLASK_DEBUG=1`
- Update the CMD line in `Dockerfile` to include the `--debug` flag, as follows:
```sh
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567", "--debug"]
```
- Build and run the docker container locally using the following command:
```sh
docker build -f Dockerfile.prod -t backend-flask-prod .
```
To use the backend-flask-prod image Update Docker Compose




### ECR Sign-in
Create a new file called `backend-flask/bin/ecr/sign-in` and make it executable. 

Paste the following code into the file

```
#! /usr/bin/bash

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
```

The script is still there and is now being automated in `.gitpod.yml`.

## Working With Docker Images in Production

### Build Prod Image

- Create a new file called `backend-flask/bin/docker/build/backend-flask-prod` with the following script:

```sh
#! /usr/bin/bash
docker build -f backend-flask/Dockerfile.prod -t backend-flask-prod ./backend-flask
```

- Create a new file called backend-flask/bin/docker/build/frontend-react-js-prod with the following script:
```sh
#! /usr/bin/bash

docker build \
    --build-arg REACT_APP_BACKEND_URL="https://api.yacrud.me" \
    --build-arg REACT_APP_FRONTEND_URL="https://yacrud.me" \
    --build-arg REACT_APP_AWS_PROJECT_REGION="$AWS_DEFAULT_REGION" \
    --build-arg REACT_APP_AWS_COGNITO_REGION="$AWS_DEFAULT_REGION" \
    --build-arg REACT_APP_AWS_USER_POOLS_ID="$AWS_USER_POOLS_ID" \
    --build-arg REACT_APP_CLIENT_ID="$CLIENT_ID" \
    -t frontend-react-js-prod \
    -f frontend-react-js/Dockerfile.prod ./frontend-react-js
```

- Tag and push Prod image


- Create `backend-flask/bin/docker/push/backend-flask-prod`

```bash
#! /usr/bin/bash
export ECR_BACKEND_FLASK_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/backend-flask"
docker tag backend-flask-prod:latest $ECR_BACKEND_FLASK_URL
docker push $ECR_BACKEND_FLASK_URL
```

- Create `backend-flask/bin/docker/push/frontend-react-js-prod`

```bash
#! /usr/bin/bash
export ECR_FRONTEND_REACT_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/frontend-react-js"
docker tag frontend-react-js-prod:latest $ECR_FRONTEND_REACT_URL
docker push $ECR_FRONTEND_REACT_URL
```

Due to new innovations, both have now been moved to [`bin/frontend/push`](../bin/frontend/push) and [`bin/backend/push`](../bin/backend/push)

> The great Bin Restructure just below.

### Force Service Deploy with bash scripts

- create backend-flask/bin/ecs/force-deploy-backend-flask and bin/ecs/force-deploy-frontend-react-js.
- In backend-flask/bin/ecs/force-deploy-backend-flask, set the CLUSTER_NAME variable to the name of your ECS cluster, the SERVICE_NAME variable to the name of the backend-flask service, and the TASK_DEFINTION_FAMILY variable to the task definition family of your backend-flask service.
- In bin/ecs/force-deploy-frontend-react-js, set the CLUSTER_NAME variable to the name of your ECS cluster, the SERVICE_NAME variable to the name of the frontend-react-js service, and the TASK_DEFINTION_FAMILY variable to the task definition family of your frontend-react-js service.
- Run the scripts to update your services with the new changes. The scripts use the AWS CLI to obtain the latest task definition ARN and force a new deployment of the service with that task definition.

Use this method only when necessary and during off-peak hours to minimize the impact on your users.

**NOTE:** Scripts are now migrated under `bin/backend/deploy` and `bin/frontend/deploy`

# [Refactor Bin Directory](../bin/README.md)
This was one of the most enjoyable parts of my work. 

The [directory](../bin/README.md) should be consulted for potential experience as more scripts are being added to the project.

<details>

<summary>
Check The Process Out
</summary> 

- Step 1

<img src="assets/week6-7/4-bin-refacor/1.png">

- Step 2

<img src="assets/week6-7/4-bin-refacor/2.png">

- Step 3

<img src="assets/week6-7/4-bin-refacor/3.png">

- Step 4

<img src="assets/week6-7/4-bin-refacor/4.png">

</details>



---
To be Continued..

---

## Real Path Experiment

Get the backend onboard to ECR after this step.

## PSQL Session Kill Command
## Fix Messaging in production
## Implement Refresh Token Cognito
---
## Fargate - Configuring for Container Insights

- Turn on container insights
<img src="assets/week6-7/Container-Insights/turn-on-container-insights.png">

- XRAY daemon
<img src="assets/week6-7/Container-Insights/containers stats.png">


- Use case
<img src="assets/week6-7/Container-Insights/container-insights.png">




## Docker Container Networks
- Debug using [Busybox](../bin/busybox)
- Redefined the networking in [docker compose](../docker-compose.yml)


## Env Var

---

## Homework Challenges

### Frontend Application on CloudFront
### Updated `connect-to-service`
### Service On - Service Off
### Path Plays