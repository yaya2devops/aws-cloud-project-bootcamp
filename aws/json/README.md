

## Cloud Operations Field Guide
| JSON File                        | Description                                                                      |
|-----------------------------------|----------------------------------------------------------------------------------|
| [`alarm-config`](alarm-config.json)                    | AWS CloudWatch alarm configuration to trigger when daily charges exceed 1$     |
| [`budget-notif`](budget-notifications-with-subscribers.json)   | Notify subscribers via email when the threshold exceeds 80%                  |
| [`budget`](budget.json)                              | Budget limit for AWS                                                            |
| [`sns-event-bridge`    ](sns-event-bridge.json)                | Event Bridge health check                                                         |
| [`xray`  ](xray.json)                              | Rule for X-Ray                                                                    |

---

##  Amazon Elastic Container Service

| ECS Service                       | Description                                                                      |
|-----------------------------------:|----------------------------------------------------------------------------------|
| [`service-backend-flask`  ](service-backend-flask.json)             | Backend service for Fargate                                                      |
| [`service-frontend-react-js`](service-frontend-react-js.json)           | Frontend service for Fargate                                                     |


**Requirement**

- Once [task registered](../task-definitions/README.md).
```sh
export DEFAULT_SUBNET_IDS=$(aws ec2 describe-subnets  \
 --filters Name=vpc-id,Values=$DEFAULT_VPC_ID \
 --query 'Subnets[*].SubnetId' \
 --output json | jq -r 'join(",")')
echo $DEFAULT_SUBNET_IDS
```

### Backend
```sh
aws ecs create-service --cli-input-json file://aws/json/service-backend-flask.json
```


- **Delete service**

```sh
aws ecs delete-service --cluster <cluster-name> --service <service-name> --force
```

- **Update Service**
```sh
aws ecs update-service --service backend-flask --desired-count 0 && aws ecs delete-service --cluster cruddur --service backend-flask
```


- **Describe**
```sh
aws ecs describe-services --cluster cruddur --services backend-flask
```

#### **Frontend**


- **stop task**
```sh
aws ecs stop-task --cluster <cluster-name> --task <task-id>
```
e.g
```sh
aws ecs stop-task --cluster cruddur --task 5ebadfc5c87b4ba496a8289e0373227f
```

- **Delete**
```sh
aws ecs delete-service --cluster cruddur --service frontend-react-js --force 
```

- **Incase**
```sh
aws ecs delete-service --cluster cruddur --service arn:aws:ecs:<REGION>:<AWSID>:service/cruddur/frontend-react-js
```

- **Describe**

```sh
aws ecs describe-services --cluster cruddur --services frontend-react-js
```

- **Create or Update**

```sh
aws ecs create-service --cli-input-json file://aws/json/service-frontend-react-js.json
```

---

#### Suppl.
- Creating a Cost and Usage budget:  `Budget.json` and `budget-notifications-with-subscribers.json`
- Creating a Cloudwatch Metric Alarm using `alarm_config.json` <br>
[Reference](../../journal/week0.md#create-aws-budget)
