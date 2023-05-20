## Create TaskRole
To create a TaskRole, follow the steps below:

- Run the following command to create the CruddurTaskRole:
```sh
aws iam create-role \
    --role-name CruddurTaskRole \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [{
            "Action": ["sts:AssumeRole"],
            "Effect": "Allow",
            "Principal": {
                "Service": ["ecs-tasks.amazonaws.com"]
            }
        }]
    }'
```

- Or prepare the [policy](cruddur-task-role.json) and run the this command

```sh
aws iam create-role \
    --role-name CruddurTaskRole \
    --assume-role-policy-document file://aws/policies/task-role/cruddur-task-role.json
```

- Attach the SSMAccessPolicy using the following command:
```sh
aws iam put-role-policy \
    --policy-name SSMAccessPolicy \
    --role-name CruddurTaskRole \
    --policy-document '{
        "Version": "2012-10-17",
        "Statement": [{
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }]
    }'

```

- Attach the CloudWatchFullAccess policy using the following command:
```sh
aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess \
    --role-name CruddurTaskRole
```
- Attach the AWSXRayDaemonWriteAccess policy using the following command:
```sh
aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess \
    --role-name CruddurTaskRole
```




