To create the role:

```sh
aws iam create-role \
    --role-name CruddurTaskRole \
    --assume-role-policy-document file://aws/policies/task-role/cruddur-task-role.json
```

To create the policy:

```sh
aws iam put-role-policy \
  --policy-name SSMAccessPolicy \
  --role-name CruddurTaskRole \
  --policy-document file://aws/policies/task-role/ssm-access-policy.json
```

The policy will be attached thanks to the line 3 of the above command.

<br>

**To get access to cloudwatch for observability attach this policy:**

```sh
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess --role-name CruddurTaskRole
```


**To X-RAY:**

```sh
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess --role-name CruddurTaskRole
```

