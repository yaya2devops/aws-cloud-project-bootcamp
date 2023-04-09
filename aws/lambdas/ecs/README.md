### Optimize Costs: Stop ECS Daily at Specific Time
 

- Create a new [Lambda function](stop-service.py) with latest runtime.

- assign the policy with these [permissions.](../../policies/ecs-stop-lambda-policy.json)


- Navigate to the "Configuration" tab
- Select Triggers
- Add an EventBridge - CloudWatch Events trigger 
- Pick a name for the  rule 

Finally, set a specific time for the function to run by entering the desired cron expression.