### Create Execution Role

To create an ExecutionRole, follow these steps:

- Open the IAM console and locate the Roles section.
- Click on the **Create Role** button.
- From the use case section, choose **Elastic Container Service**.
- Select the **Elastic Container Service** Task option from the available choices.
- Proceed by clicking on the **Next** button.
- On the next page, locate and click the **Create Policy** button.
- In the visual editor, locate the Service field and choose **Systems Manager**.
- From the list of Actions, select **GetParameter** and **GetParameters**.
- Under the Resources section, select the Specific option and **add the ARN**.

```
arn:aws:ssm:<REGION>:<AWS_ACCOUNT_ID>:parameter/cruddur/backend-flask/*
```

### CruddurServiceExecutionPolicy 

- Click on the **Add additional permissions** option.
- In the visual editor, select **Elastic Container Registry** as the service.
- Choose **GetAuthorizationToken**, **GetDownloadUrlForLayer**, and **BatchGetImage** as the desired Actions.
- Proceed by clicking the **Review Policy** button.
- Additionally, attach the **CloudwatchFullAccess** policy.
- Click on Next and then click on **Next again** to proceed.
- On the review page, name the policy as **CruddurServiceExecutionPolicy**.
- Finally, click on **Create Policy**.
- Go back to the Roles section and repeat the same steps until you reach the policy page.
- In the policy page, search for **CruddurServiceExecutionPolicy** and select it.
- Click on Next.
- Enter the desired Role name as** CruddurServiceExecutionRole**.
- click on **Create Role**.


- Create CruddurServiceExecutionPolicy Role

```s
aws iam create-role --role-name CruddurServiceExecutionPolicy --assume-role-policy-document file://aws/policies/service-assume-role-execution-policy.json
```
- Create Service Execution Policy

```s
aws iam put-role-policy \
  --policy-name CruddurServiceExecutionPolicy \
  --role-name CruddurServiceExecutionRole \
  --policy-document file://aws/policies/service-execution-policy.json
```

The policy I generated is [here](../service-execution-policy.json)


- Attach the policy to Role

```s
  aws iam attach-role-policy --policy-arn POLICY_ARN --role-name CruddurServiceExecutionRole
```