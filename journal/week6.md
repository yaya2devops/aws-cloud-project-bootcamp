# Week 6 — Deploying Containers

Weeks 6 and 7 were consolidated into a two-week period of harmony, in here i'll organize them as separate weeks and give it a proper structure.

[Initial Version](assets/week6-7/ArchitectStuff/1-ship-to-aws.jpg)
<img src="assets/week6-7/ArchitectStuff/updates/week-six-arch-update.png">


[**Get it.**](assets/week6-7/ArchitectStuff/updates/week-six-arch-update.drawio)


This will primarily involve onboarding the project to AWS, creating three repositories, building and pushing the Python container, backend flask and frontend reactjs to ECR.

## Main Week Six Tasks
- [Provision ECS Cluster](#ecs-cluster-creation)
- [Create ECR repo and push image for backend-flask](#backend-health-check)
- [Deploy Backend Flask app as a service to Fargate](#deploy-to-fargate)
- [Create ECR repo and push image for frontend-react-js](#ecr-frontend)
- [Deploy Frontend React JS app as a service to Fargate](#frontend-service)
- [Create and Register Frontend Task Definitions](#register-frontend-task-definition)
- [Create and Register backend Task Definitions](#backend-task-definitions)
- [Rebuild containers with custom dockerfiles for prod](#reactjs-static-assets-serve-using-nginx)
- [Frontend Container Updates](#frontend-task)
- [Create Execution and Tasks Roles and Policies](#create-the-required-role-and-permissions)

 
### ECS Cluster Creation


To create a new ECS cluster, run the following command in your terminal:

```sh
aws ecs create-cluster \
--cluster-name cruddur \
--service-connect-defaults namespace=cruddur
```

The `service-connect` flag creates a namespace in cloudmap which can be used internally instead of an endpoint.

- RDS Connection Test
Create the file `backend-flask/bin/db/test` and make it executable.


Run the script to test the RDS connection:

```sh
❯ ./backend-flask/bin/db/test
attempting connection
Connection successful!
```

### Backend Health Check
Add a health check endpoint in `app.py`:


```sh
@app.route("/api/health-check")
def health_check():
    return {"success": True}, 200
```

> Hint: pros dont Ops compose up specific services, but get all using `docker compose up` in CLI


Create the file backend-flask/bin/flask/health-check and make it executable:

```sh
#!/usr/bin/env python3

import urllib.request

try:
  response = urllib.request.urlopen('http://localhost:4567/api/health-check')
  if response.getcode() == 200:
    print("[OK] Flask server is running")
    # yes
    exit(0)
  else:
    print("[BAD] Flask server is not running")
    exit(1) # false
except Exception as e:
  print(e)
  exit(1)
```


- Run the python script to test the backend:


```sh
❯ ./backend-flask/bin/flask/health-check
[OK] Flask server is running
```


### Python Image 
> Duplicable Process

1- Create a new repository named cruddur-python using the following command:
```sg
aws ecr create-repository \
  --repository-name cruddur-python \
  --image-tag-mutability MUTABLE
```

2- Log in to ECR using the following command:
```sh
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
```

3- Export the repo URL:

```sh
export ECR_PYTHON_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/cruddur-python"
echo $ECR_PYTHON_URL
```

4- Get the image from your spot what we call pull image

```sh
docker pull python:3.10-slim-buster
```

<img src="assets/week6-7/1-workflow/16 work proof.png">



5- Tag it

```sh
docker tag python:3.10-slim-buster $ECR_PYTHON_URL:3.10-slim-buster
```

6- Get it straight to ECR:

```sh
docker push $ECR_PYTHON_URL:3.10-slim-buster
```

<img src="assets/week6-7/1-workflow/8-python-image-container-resgitry.png">




### ECR [Backend](../backend-flask#readme)

Build the backend image:

- Make sure you have the Dockerfile and necessary frontend code in a directory.
- Open a terminal or command prompt and navigate to the directory with the Dockerfile.
- Build the image with the script

Login To ECR and AWS CLI.
- Ensure you have the AWS CLI installed and configured with the appropriate credentials.
- Open a terminal or command prompt and start the [sign in](../bin/ecr/sign-in) script.
- Push the frontend image to ECR uing the `backend-push` [script.](../bin/backend/push)

### ECR [Frontend](../bin/frontend/)

> Bin is restructured in week 7, [check from now.](../bin/README.md)

Build the frontend image:

- Ensure that you have the Dockerfile and the necessary frontend code in a directory.
- Open a terminal or command prompt and navigate to the directory containing the Dockerfile.
- Build the frontend image using the appropriate build command or script.
- Log in to ECR and the AWS CLI:

Open a terminal or command prompt and run the sign-in script, if you it wasn't done above  provided, which will handle the ECR login process and authentication with the AWS CLI.

- Push the frontend image to ECR, execute the frontend-push [script. 

The script is specifically designed to handle the pushing of the frontend image to ECR. 

## Register Frontend Task Definition

**Console**
- Open the Amazon ECS console and navigate to the "Task Definitions" page.
- Click on the "Create new Task Definition" button.
- Select the launch type compatibility as "Fargate" and click on the "Next step" button.
- Provide a name for your task definition in the "Task definition name" field.

Configure the task size and resources
- Set the task memory and CPU values based on your application's requirements and the available Fargate task sizes.
- Ensure that the selected task size is within the limits specified by Fargate.
- Scroll down to the "Container Definitions" section and click on the "Add container" button.

In the container configuration:
- call the container `frontend-react-js`.
- Specify the image URL of the frontend container pushed to ECR above.
- Set any required environment variables.
- Configure port mappings if necessary.
- Scroll down and configure any additional container settings as needed.

Review the task definition details and click on the "Create" button.

### Register the task definition**

- On the "Task Definitions" page, select the task definition you just created.
- Click on the "Actions" button and choose "Register new revision" from the dropdown menu.
- Review the details of the new revision and click on the "Create" button to register the task definition.

you can then use it to run tasks on AWS Fargate by creating a new service.

### Using CLI


use `frontend-react-js.json`, adjust it with your infos and run the register [script](../bin/frontend/register)

### Backend Task Definitions

To register task definitions for the backend, follow these instructions:

- Create a new file called **backend-flask.json** in the **aws/task-definitions** directory.

Use the register [script](../bin/backend/register).

<img src="assets/week6-7/fargate-tasks.png">

---

#### Parameter Store


| Secret Storage Option | Features | Costs |
| --- | --- | --- |
| Secrets Manager | Securely store and manage secrets such as passwords, API keys, and database credentials. | $$$$$ |
| Parameter Store | Store secrets as key-value pairs or encrypted strings. | $ |


Use something easy so u can call it somewhere [e.g.](../backend-flask/buildspec.yml#L33)

SecureString is a parameter type to store sensitive data such as passwords, API keys, and other secrets in an encrypted format.


As easy as typing this in ur aws cli:

```bash
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/AWS_ACCESS_KEY_ID" --value $AWS_ACCESS_KEY_ID
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/AWS_SECRET_ACCESS_KEY" --value $AWS_SECRET_ACCESS_KEY
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/CONNECTION_URL" --value $PROD_CONNECTION_URL
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/ROLLBAR_ACCESS_TOKEN" --value $ROLLBAR_ACCESS_TOKEN
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/OTEL_EXPORTER_OTLP_HEADERS" --value "x-honeycomb-team=$HONEYCOMB_API_KEY"
```

- This is now scripted into a [file.](../bin/backend/para-store)

<img src="assets/week6-7/1-workflow/20 parameter store.png">

**Fargate Environment:**

<img src="assets/week6-7/1-workflow/31 task-definition-env.png">

Project Assets can be [found here.](assets/README.md)

### Create The Required Role and Permissions
- Refer [Execution Cruddur Role](../aws/policies/README.md) Instructions
- Refer [Task Role](../aws/policies/task-role#readme) Instructions
---

## Deploy to fargate


#### Creating Security Group


- Execute the following commands to store the VPC ID in an environment variable.

```bash
export DEFAULT_SUBNET_IDS=$(aws ec2 describe-subnets  \
 --filters Name=vpc-id,Values=$DEFAULT_VPC_ID \
 --query 'Subnets[*].SubnetId' \
 --output json | jq -r 'join(",")')
echo $DEFAULT_SUBNET_IDS
```
- Establish the Security Group.
```sh 
export CRUD_SERVICE_SG=$(aws ec2 create-security-group \
  --group-name "crud-srv-sg" \
  --description "Security group for Cruddur services on ECS" \
  --vpc-id $DEFAULT_VPC_ID \
  --query "GroupId" --output text)
echo $CRUD_SERVICE_SG
```
- In case there is a need to retrieve the Security Group ID again.
```sh
export CRUD_SERVICE_SG=$(aws ec2 describe-security-groups \
  --filters Name=group-name,Values=crud-srv-sg \
  --query 'SecurityGroups[*].GroupId' \
  --output text)
```
<img src="assets/week6-7/1-workflow/34backend-service-flask.png">

- Create `aws/json/service-backend-flask.json`

- Run the below command to create it in Fargate
```bash
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```
#### Frontend Service
- Create `aws/json/service-frontend-react-js.json`

- Run the below command to create it in Fargate
```bash
aws ecs create-service --cli-input-json file://aws/json/service-frontend-react-js.json
```

<img src="assets/week6-7/fargate-services.png">

### Connect via Session Manager

- Install package

```bash
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
```

- Checking if it's there:

```bash
session-manager-plugin
```
<img src="assets/week6-7/1-workflow/33 sys manager .png">


- Replace ARN and run 

```bash
aws ecs execute-command  \
--region us-east-1 \
--cluster cruddur \
--task <Valeur> \
--container backend-flask \
--command "/bin/bash" \
--interactive
```

```bash
The Session Manager plugin was installed successfully. Use the AWS CLI to start a session.
```

**Connect:**

<img src="assets/week6-7/2-Fargate/13-connect-backend-container.png">

- Add this to `.gitpod.yml` to auto install session manager auto.

```bash
- name: fargate
    before: |
      curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
      sudo dpkg -i session-manager-plugin.deb
      cd backend-flask
```

**Make sure Containers are healthy:**
<img src="assets/week6-7/Containers-Stats/both-services-inc-container-insights.png">

> health checks should be found in tasks tab, check it in the other asset.



## curl is bad practice in docker. Potential threat.

- Now to make this into a script create this file `backend-flask/bin/ecs/connect-to-service` and make it executable. It's later migrated to just connect under backend.


### Get into pushed App

- Use **URL:4567** to access the backend application.


#### Connect to Conainter from dev env:


```bash
./backend-flask/bin/ecs/connect-to-service backend-flask
```

From **Bash**
<img src="assets/week6-7/2-Fargate/14-connect-using-bash.png">



- Run this command to check connection to RDS.

```bash
./bin/db/test
```

```bash
$backend-flask# ./bin/db/test
attempting connection
Connection successful!
```

#### Service Connect

- In `taskDefinition` add the below:

```bash
,
"serviceConnectConfiguration": {
    "enabled": true,
    "namespace": "cruddur",
    "services": [
      {
        "portName": "backend-flask",
        "discoveryName": "backend-flask",
        "clientAliases": [{"port": 4567}]
      }
    ]
  }
```

- Create service.

```bash
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```

- check Service accessibility.

---

### Frontend Task
> Follow these when doing changes

Same steps applied, go over this [bin/frontend](../bin/frontend) and think.

build and push the image. View Push Commands button to see the commands for pushing images. You should see the three.


Everything you require in one place.

```sh
├── frontend
│   ├── build
│   ├── connect
│   ├── deploy
│   ├── generate-env
│   ├── push
│   ├── register
│   ├── repo
│   ├── run
│   ├── service-off
└───└──service-on
```


## Debug Master: CloudWatch Log

Create a log group to check logs and help you troubleshoot fargate related errors.
```bash
aws logs create-log-group --log-group-name cruddur
aws logs put-retention-policy --log-group-name cruddur --retention-in-days 1
```
<img src="assets/week6-7/1-workflow/5-capture-sans-rentation-cloudwatch-fargate.png">



### **Reactjs** Static assets serve using Nginx:
- create a docker prod.
- add build to .gitignore
- Create frontend-react-js/nginx.conf
- Build Frontend
  - cd frontend-react-js
  - run  `npm run build`
  - run `docker build command` - it's [here](../bin/frontend/build)

#### Resend 
- [Create a repo for front.](../bin/frontend/repo)
- Set URL - [Login](../bin/ecr/sign-in)  pull - Tag img and [push](../bin/frontend/push). to ECR.


### Flask App

For backend, now it's time to do a sperate prod for it as well.
- Use the dockerfile for prod and incl the `FROM` command to use the py image from ECR.
- [Create a repo for backend.](../bin/backend/repo)
- Set URL - [Login](../bin/ecr/sign-in) - pull - Tag img and [push](../bin/backend/push).



> I'm also good in Azure, wanna [see?](https://sentinel.yahya-abulhaj.dev/)



**Containers Reference**

I consulted the below sources to build up.
- [Amazon Elastic Container Service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
- [Amazon Elastic Container Registry](https://aws.amazon.com/fr/ecr/)
- [EC2 vs Fargate?](https://containersonaws.com/introduction/ec2-or-aws-fargate/)
- [Security and Assurance for AWS Fargate Containers](https://www.youtube.com/watch?v=FdiPiirOqfs&ab_channel=DevOpsTV)
- [Fargate Task Definitions Considerations](https://docs.aws.amazon.com/AmazonECS/latest/userguide/fargate-task-defs.html)
