

### Create CruddurServiceExecutionPolicy Role

```s
aws iam create-role --role-name CruddurServiceExecutionPolicy --assume-role-policy-document file://aws/policies/service-assume-role-execution-policy.json
```
### Create Service Execution Policy

```s
aws iam put-role-policy \
  --policy-name CruddurServiceExecutionPolicy \
  --role-name CruddurServiceExecutionRole \
  --policy-document file://aws/policies/service-execution-policy.json
```

  ### Attach the policy to Role

```s
  aws iam attach-role-policy --policy-arn POLICY_ARN --role-name CruddurServiceExecutionRole
```