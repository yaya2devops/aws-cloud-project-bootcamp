# Week 5 — DynamoDB and Serverless Caching

```SQL
UPDATE public.users SET cognito_user_id='f73f4b05-a59e-468b-8a29-a1c39e7a2222' WHERE users.handle='bayko';
```



### Streaming:


#### Dynamo:
- create table in dynamo

- in dynamo schema load, We will have to add this message group uuid:

```JSON
    {
      'AttributeName': 'message_group_uuid',
      'AttributeType': 'S'
    },
```


- and we define a secondary global index in here:

```JSON
  GlobalSecondaryIndexes= [{
    'IndexName':'message-group-sk-index',
    'KeySchema':[{
      'AttributeName': 'message_group_uuid',
      'KeyType': 'HASH'
    },{
      'AttributeName': 'sk',
      'KeyType': 'RANGE'
    }],
    'Projection': {
      'ProjectionType': 'ALL'
    },
    'ProvisionedThroughput': {
      'ReadCapacityUnits': 5,
      'WriteCapacityUnits': 5
    },
  }]
```

```bash
./bin/ddb/schema-load prod
```

- enable streams: exports and streams=> dynamo streams details => Turn On => new image => Turn On stream


#### VPC:

- next go to VPC => endpoints tab => create endpoint => specify name e.g. "ddb-cruddur", specify aws services for category and add your created dynamodb service name => check default vpc  => choose route table => full access


#### Lambda:


- specify name e.g. cruddur-messaging-stream
- python runtime 3.9 (whatever version we get)
- x86_64 as architecutre
- create a new role with basic lambda permissions
- in advanced settings, enable vpc: specify the vpc and add a and b subnets => default security group 
- go ahead and create

> Another way to create the function is using AWS SAM template.


configurations=> permissions => click on the role


add this permission to read and write 

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:DescribeStream",
                "dynamodb:GetRecords",
                "dynamodb:GetShardIterator",
                "dynamodb:ListStreams"
            ],
            "Resource": "*"
        }
    ]
}
```

- added this aws managed policy AmazonDynamoDBFullAccess since its not good practice if lambda get compromised...
- instead create policy, with these actions query - deleteitm - putitem

more config: 

**for the index**
 
Region: ca-central-1

Account:  ur aws ID 
Table name: cruddur-messages

get the index from ur dynamo 
Index name: message-group-sk-index

**for table**
Region: ca-central-1
Account: ur aws ID
Table name: cruddur-messages
 

- back to dynamo db, create trigger, pick the lambda we created
- for batch size as 1 for now and turn trigger on; create the trigger


Going back to our dev env, comment local dynamo url


added this to lambda and redeployd: 

```python
  print('event-data',event)
  eventName = event['Records'][0]['eventName']
  if (eventName == 'REMOVE'):
    print("skip REMOVE event")
    return
```