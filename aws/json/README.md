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


#### Frontend:

```sh
aws ecs create-service --cli-input-json file://aws/json/service-frontend-react-js.json
```


#### Suppl.
- Creating a Cost and Usage budget:  `Budget.json` and `budget-notifications-with-subscribers.json`
- Creating a Cloudwatch Metric Alarm using `alarm_config.json` <br>
[Reference](../../journal/week0.md#create-aws-budget)
