##  Create Service
> Once [task registered](../task-definitions/README.md).

**Requirements:**

```sh
export DEFAULT_SUBNET_IDS=$(aws ec2 describe-subnets  \
 --filters Name=vpc-id,Values=$DEFAULT_VPC_ID \
 --query 'Subnets[*].SubnetId' \
 --output json | jq -r 'join(",")')
echo $DEFAULT_SUBNET_IDS
```

#### Backend:
```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json

```


**Delete service:**

```sh
aws ecs delete-service --cluster <cluster-name> --service <service-name> --force
```

```sh
aws ecs delete-service --cluster cruddur --service backend-flask --force 
```

```sh
aws ecs update-service --service backend-flask --desired-count 0 && aws ecs delete-service --cluster cruddur --service backend-flask
```


**Describe backend:**
```sh
aws ecs describe-services --cluster cruddur --services backend-flask
```

#### Frontend:


**stop task:**
```sh
aws ecs stop-task --cluster <cluster-name> --task <task-id>
```

```sh
aws ecs stop-task --cluster cruddur --task 5ebadfc5c87b4ba496a8289e0373227f
```


**Delete**

```sh
aws ecs delete-service --cluster cruddur --service frontend-react-js --force 
```

**Incase:**
```sh
aws ecs delete-service --cluster cruddur --service arn:aws:ecs:ca-central-1:598485450821:service/cruddur/frontend-react-js
```

**Describe frontend:**

```sh
aws ecs describe-services --cluster cruddur --services frontend-react-js
```

**Create or Update:**

```sh
aws ecs create-service --cli-input-json file://aws/json/service-frontend-react-js.json
```


#### Suppl.
- Creating a Cost and Usage budget:  `Budget.json` and `budget-notifications-with-subscribers.json`
- Creating a Cloudwatch Metric Alarm using `alarm_config.json` <br>
[Reference](../../journal/week0.md#create-aws-budget)
