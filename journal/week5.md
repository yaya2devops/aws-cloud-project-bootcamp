# Week 5 — DynamoDB and Serverless Caching


- [Data Modelling and Patterns](#dynamodb-data-modeling)

- **Implement Setup Scripts**
  - [Implement Schema Load Script](#dynamo-loading-schema-script)
  - [Implement Seed Script](#implement-seed-script)
  - [Implement Scan Script](#implement-scan-script)

- **DynamoDB Patterns**
  - [Implement Pattern Scripts](#dynamodb-patterns)
  - [Automate Cognito ID ](#update-cognito-id-script-for-postgres)
  - [Implement Pattern A](#implement-pattern-a)
  - [Implement Pattern B](#implement-pattern-b)
  - [Implement Pattern C](#implement-pattern-c)
  - [Implement Pattern D](#implement-pattern-d)
  - [Implement Pattern E](#implement-pattern-e)











---

# DynamoDB Data Modeling

The NoSQL data modeling approach in DynamoDB  varies and here i summarized it in the below bullet points:


**Single table design:** All related data should be stored in a single table to simplify data access and reduce complexity.<br>
**Access patterns(our-case):** Data modeling should take into account the most common access patterns to ensure efficient and performant data retrieval.<br>
**Partitioning:** Data is partitioned across multiple nodes for horizontal scalability, with partition keys chosen carefully to avoid hotspots.<br>
**Global secondary indexes:** Additional indexes can be created on different partition and sort keys to support additional query patterns.<br>
**Local secondary indexes:** Additional sort keys can be created within a partition to support specific query patterns.

## **CRUDDUR Spreadsheet Data Modeling** 
This tabluar data modeling represent  our use case to retrieve the messages from the MG.

| pk                | sk                   | data                       | uuid                                | display_name    | handle       | message               | user_uuid                            | message_group_uuid                   |
|-------------------|----------------------|----------------------------|------------------------------------|----------------|--------------|-----------------------|--------------------------------------|--------------------------------------|
| MSG#{message_group_uuid} | MSG#{created_at} |                            | 32423432-235325-3525-325235352-235235 | Yahya ABULHAJ  | yaya2devops  | Hey Bayko             | 232cfd0f-3841-47bc-ad8b-44d9d3b7264f | 23523532-6433634643-234234234-23423525 |
| GRP#{my_user_uuid}      | GRP#{last_reply_at} |                          |                                    | Andrew Bayko   | bayko        | Hey - Yaya, The legend. | 2342342-52353252-23523523-23424    | 23523532-6433634643-234234234-23423525 |
| GRP#{my_user_uuid}      | GRP#{last_reply_at} |                          |                                    | Yahya ABULHAJ  | yaya2devops  | Ty. Love the cloud!    | 232cfd0f-3841-47bc-ad8b-44d9d3b7264f | 23523532-6433634643-234234234-23423525 |


We used a single table design, with a partition key (pk) and sort key (sk) that are specific to each item 

The table incl more attributes such as uuid, display_name, handle, message, user_uuid, and message_group_uuid, it is designed to handle multiple types of items, with different partition and sort keys for each type. 

we also used indexes for retrieving messages by the message_group_uuid.

For your convenience, the model is available in [CSV](assets/week5/Spreadsheet-DynamoDBData%20Modeling.csv) or [PDF](assets/week5/Spreadsheet-DynamoDBData%20Modeling.pdf).

### **DynamoDB Modeling Patterns** -  [SVG](assets/week5/DynamoDB%20Modelling-Patterns.svg)
This Model describe the different ways in which we will access and query data using the NoSQL approach.


Menaing, we are developing a messaging application that offers diverse communication options to users. 

We have **5 patterns**:
<img src="assets/week5/DynamoDB Modelling-Patterns.svg">

The application will allow users to view grouped messages (A) and navigate between different conversations using message groups (B). Users will be able to add new messages to an existing conversation (C) or start a new conversation (D) to connect with other users in novel ways. Additionally, we will use DynamoDB Streams (E) to track changes to message groups, providing real-time updates when messages are added, edited, or deleted.

## Implement DynamoDB Local

<img src="assets/week5/1- DynamoDb Utility Scrips/6 our db back.png">

#### **Dynamo Loading Schema Script**

- Create a new folder ddb inside backend-flask/bin/ddb
- Add schema-load script to this folder and make it executable

<img src="assets/week5/1- DynamoDb Utility Scrips/7 our python based dynamodb schema.png">


- make it exe using:
```sh
chmod u+x backend-flask/bin/ddb/schema-load
```
- Add boto3 to the requirements.txt file and run pip install.

<img src="assets/week5/1- DynamoDb Utility Scrips/1 install boto thpythondsk.png">

- Automate it:

<img src="assets/week5/1- DynamoDb Utility Scrips/1 x add itautomate install all bib.png">



- run script `./bin/ddb/schema-load`



Do the same for scripts to:

→ [**list-tables**](../backend-flask/bin/ddb/list-tables)

<img src="assets/week5/1- DynamoDb Utility Scrips/11 listed.png">

 <br>

→ [**drop**](../backend-flask/bin/ddb/drop)

<img src="assets/week5/1- DynamoDb Utility Scrips/13 dropping db file.png">

Performing the drop:

<img src="assets/week5/1- DynamoDb Utility Scrips/16 that is what we called it - deleting it.png">

#### **Implement Seed Script**

This script is used to seed conversation into from the database to the product interface.
<img src="assets/week5/1- DynamoDb Utility Scrips/18 required to seed.png">

- Create `backend-flask/bin/ddb/seed` and make it executable.


- Seed PSQL:
<img src="assets/week5/1- DynamoDb Utility Scrips/19 seed.png">

This may not be the most efficient way to accomplish this. It is sometimes far more efficient to use BatchWriteItem.

Run 

```sh
./bin/ddb/seed to seed the DynamoDB
```

<img src="assets/week5/1- DynamoDb Utility Scrips/20 seed from dynamo.png">










#### **Implement Scan Script**
This script to list all data in ddb - kinda verification.
In our case, i saw the exact data i seed.


- Create `backend-flask/bin/ddb/scan` and make it executable.

<img src="assets/week5/1- DynamoDb Utility Scrips/26 SCAN EXE.png">

```sh
./bin/ddb/scan
```

<img src="assets/week5/1- DynamoDb Utility Scrips/26 tu peux scan here.png">



---

# DynamoDB Patterns

### **Implement Get  Conversations Script:**

Create `backend-flask/bin/ddb/patterns/get-conversation` and make it executable.

<img src="assets/week5/1- DynamoDb Utility Scrips/27 get conversation file and exe.png">

```sh
./bin/ddb/patterns/get-conversation
```


<img src="assets/week5/1- DynamoDb Utility Scrips/27 here convo get.png">



### **Implement List Conversations Script:**

- Add this to function to db.py

```python
# when we want to return a a single value
  def query_value(self, sql, params={}):
      self.print_sql("value", sql, params)

      with self.pool.connection() as conn:
          with conn.cursor() as cur:
              cur.execute(sql, params)
              json = cur.fetchone()
              return json[0]

```

- Create `backend-flask/bin/ddb/patterns/list-conversation` and make it exe


Get it from [here.](../backend-flask/bin/ddb/patterns/list-conversations)


- Update `print_sql` function and prereq in `db.py` to pass params.


```python
def print_sql(self,title,sql,params={}):
    cyan = '\033[96m'
    no_color = '\033[0m'
    print(f'{cyan} SQL STATEMENT-[{title}]------{no_color}')
    print(sql,params)
```
<img src="assets/week5/1- DynamoDb Utility Scrips/31 coding before listing validation.png">


Run the command:


```sh
./bin/ddb/patterns/list-conversation
```
<img src="assets/week5/1- DynamoDb Utility Scrips/32 listed validation.png">


### **Update Cognito ID** Script for Postgres:

- Create  `backend-flask/bin/cognito/list-users` and make it exe using `chmod`






- Consult user details:

 ```sh
 ./backend-flask/bin/cognito/list-users
 ```

<img src="assets/week5/2- ImplementConversations/3 the required script.png">

- Create `backend-flask/bin/db/update_cognito_user_ids` and `chmod`

<img src="assets/week5/2- ImplementConversations/4 script to update user pool.png">


- Add this to `backend-flask/bin/db/setup`

```bash
python3 "$bin_path/db/update_cognito_user_ids"
```

- Create  `backend-flask/db/sql/users/uuid_from_cognito_user_id.sql`

```sql
SELECT users.uuid
FROM public.users
WHERE
    users.cognito_user_id = %(cognito_user_id)s
LIMIT 1
```

**Updated:**

<img src="assets/week5/2- ImplementConversations/10 done.png">



### Implement **Pattern A** 
Listing Messages in Message Group into Application:


- create `backend-flask/lib/ddb.py`

- Add environment variable to backend service, Docker Compose to connect to the local DynamoDB:

```yaml
AWS_ENDPOINT_URL: "http://dynamodb-local:8000"
```

- in `app.py` update `data_message_group` function like this

```python
@app.route("/api/message_groups", methods=["GET"])
def data_message_groups():
    claims = request.environ["claims"]
    cognito_user_id = claims["sub"]
    model = MessageGroups.run(cognito_user_id=cognito_user_id)

    if model["errors"] is not None:
        return model["errors"], 422
    else:
        return model["data"], 200
```

- Remove @ sign from `data_messages` route in app.py.
- Update `backend-flask/services/message_groups.py`
- Update `backend-flask/bin/ddb/patterns/list-conversation`
- Update `backend-flask/bin/ddb/patterns/get-conversation`



**Authorization Portability:**
Start with including this in the required code files and eliminate any cookies:

```jsx
headers: {
  'Authorization': `Bearer ${localStorage.getItem("access_token")}`,
},
```

- frontend-react-js/src/pages/MessageGroupPage.js
- frontend-react-js/src/pages/MessageGroupsPage.js
- frontend-react-js/src/components/MessageForm.js


**Create the file independent `frontend-react-js/src/lib/CheckAuth.js`**

```jsx
import { Auth } from "aws-amplify";

const checkAuth = async (setUser) => {
    Auth.currentAuthenticatedUser({
        bypassCache: false,
    })
        .then((user) => {
            console.log("user", user);
            return Auth.currentAuthenticatedUser();
        })
        .then((cognito_user) => {

            setUser({
                display_name: cognito_user.attributes.name,
                handle: cognito_user.attributes.preferred_username,
            });
        })
        .catch((err) => console.log(err));
};
```

- Import this in `HomeFeedPage.js`, `MessageGroupPage.js`, and `MessageGroupsPage.js`


```jsx
import checkAuth from '../lib/CheckAuth'
```

- Update `checkAuth();` function call in `HomeFeedPage.js` , `MessageGroupPage.js`, and `MessageGroupsPage.js`:

```jsx
checkAuth(setUser);
```


- update `App.js` route.

```jsx
{
  path: "/messages/:message_group_uuid",
  element: <MessageGroupPage />,
},
```

- Update `frontend-react-js/src/pages/MessageGroupPage.js`

```jsx
const loadMessageGroupData = async () => {
    try {
      const backend_url = `${process.env.REACT_APP_BACKEND_URL}/api/messages/${params.message_group_uuid}`
      const res = await fetch(backend_url, {
        method: "GET"
      });
      let resJson = await res.json();
      if (res.status === 200) {
        setMessages(resJson)
      } else {
        console.log(res)
      }
    } catch (err) {
      console.log(err);
    }
  };
```

- Update classe `frontend-react-js/src/components/MessageGroupItem.js`

```jsx
const classes = () => {
    let classes = ["message_group_item"];
    if (params.message_group_uuid == props.message_group.uuid) {
      classes.push("active");
    }
    return classes.join(" ");
  };

  return (
    <Link className={classes()} to={`/messages/` + props.message_group.uuid}>
```



<img src="assets/week5/3- NeatDelivery/pattern A (without seed).png">


---

### Implement **Pattern B** 

Listing Messages Group into Application:


- Update `data_messages` in `app.py`
- Update `backend-flask/services/messages.py`
- Update `backend-flask/services/create_message.py`


<img src="assets/week5/3- NeatDelivery/pattern B.png">


### Implement **Pattern C** 

Creating a Message for an existing Message Group into Application

Remove @ before uuid if messages are not visible.
- Create `backend-flask/db/sql/users/create_message_users.sql`

```sql
SELECT 
  users.uuid,
  users.display_name,
  users.handle,
  CASE users.cognito_user_id = %(cognito_user_id)s
  WHEN TRUE THEN
    'sender'
  WHEN FALSE THEN
    'recv'
  ELSE
    'other'
  END as kind
FROM public.users
WHERE
  users.cognito_user_id = %(cognito_user_id)s
  OR 
  users.handle = %(user_receiver_handle)s
```

- Update `onsubmit` in `frontend-react-js/src/components/MessageForm.js`
- Update `data_create_message()` in `app.py`

- Posting message is successful.

<img src="assets/week5/3- NeatDelivery/pattern C.png">

- Add this to routes in `App.js`

```python
import MessageGroupNewPage from "./pages/MessageGroupNewPage";

{
  path: "/messages/new/:handle",
  element: <MessageGroupNewPage />,
},
```

- Create a new User Group `/pages/MessageGroupNewPage.js`
- Update `backend-flask/db/seed.sql`

```sql
-- this file was manually created
INSERT INTO
    public.users (
        display_name,
        email,
        handle,
        cognito_user_id
    )
VALUES (
        'Yahya Abulhaj',
        'yahyaincloud@gmail.com',
        'yaya2devops',
        'MOCK'
    ), (
        'Andrew Bayko',
        'bayko@exampro.co',
        'bayko',
        'MOCK'
    ), (
        'Londo Mollari',
        'lmollari@centari.com',
        'londo',
        'MOCK'
    );
    

INSERT INTO
    public.activities (user_uuid, message, expires_at)
VALUES ( (
            SELECT uuid
            from public.users
            WHERE
                users.handle = 'yaya2devops'
            LIMIT
                1
        ), 'This was imported as seed data!', current_timestamp + interval '10 day'
    )
```

- Add this to `app.py`

```python
from services.users_short import *

@app.route("/api/users/@<string:handle>/short", methods=["GET"])
def data_users_short(handle):
    data = UsersShort.run(handle)
    return data, 200
```

- Create `backend-flask/services/users_short.py` and add

```python
from lib.db import db

class UsersShort:
    def run(handle):
        sql = db.template("users", "short")
        results = db.query_object_json(sql, {"handle": handle})
        return results
```

- Create `backend-flask/db/sql/users/short.sql` and add

```python
SELECT
    users.uuid,
    users.handle,
    users.display_name
FROM public.users
WHERE users.handle = %(handle)s
```

- Create `frontend-react-js/src/components/MessageGroupNewItem.js` and add


In Case Cognito UUID didnt take effects:

```SQL
UPDATE public.users SET cognito_user_id='f73f4b05-a59e-468b-8a29-a1c39e7a2222' WHERE users.handle='bayko';
```



### Implement **Pattern D** 

 Creating a Message for a new Message Group into Application
 
 - Update `frontend-react-js/src/components/MessageGroupFeed.js`


- Go to this URL to start chat with a new user

```shell
http://3000-URL/messages/new/londo
```

<img src="assets/week5/3- NeatDelivery/pattern D.png">


- Update the portion below `frontend-react-js/src/components/MessageForm.js` using this code

```jsx
let data = await res.json();
if (res.status === 200) {
  console.log('data:',data)
  if (data.message_group_uuid) {
    console.log('redirect to message group')
    window.location.href = `/messages/${data.message_group_uuid}`
  } else {
    props.setMessages(current => [...current,data]);
  }
} else {
  console.log(res)
}
} catch (err) {
console.log(err);
}
}
```

- When you send a message to the new user, it should now send and redirect the user to this page.

<img src="assets/week5/3- NeatDelivery/patternABCD.png">

###  Implement **Pattern E** 
Updating a Message Group using DynamoDB Streams:





Create table in dynamo:

<img src="assets/week5/3- NeatDelivery/streams/1 dynamo.png">

- Add this to `backend-flask/bin/ddb/schema-load` in **AttributeDefinitions** list.

```python
{"AttributeName": "message_group_uuid", "AttributeType": "S"},
```
- and update GSI

```python
GlobalSecondaryIndexes=[
        {
            "IndexName": "message-group-sk-index",
            "KeySchema": [
                {"AttributeName": "message_group_uuid", "KeyType": "HASH"},
                {"AttributeName": "sk", "KeyType": "RANGE"},
            ],
            "Projection": {
                "ProjectionType": "ALL",
            },
            "ProvisionedThroughput": {
                "ReadCapacityUnits": 5,
                "WriteCapacityUnits": 5,
            },
        },
    ],
```

- Create schema in ddb prod.

```bash
./backend-flask/bin/ddb/schema-load prod
```

<img src="assets/week5/1- DynamoDb Utility Scrips/9 it outputs our table.png">

- From **Exports and streams** tab turn on **DynamoDB stream details** with **New Image** attribute.

### VPC Endpoint

- Go to **VPC** console.
- Click on **Endpoints** tab in main window
- Click **Create Endpoint**
- Select **DynamoDB** from **Services.**
- Select Default VPC
- Choose the available **Route tables**
- Select **Full Access**
- And **Create**

<img src="assets/week5/3- NeatDelivery/streams/2 vpc.png">

### Lambda function -  message stream

> Another way to create the function is using AWS SAM template.


- In DDB you cannot update something instead you have to delete and create it with updated data
- Create a new lambda function with python 3.9 runtime
- From **Change default execution role** choose **Create a new role with basic Lambda permissions**
- From **Advanced settings** select **Enable VPC** and choose the VPC
- Choose 3 subnets
- Choose **Default Security groups** and create
- Add this code to lambda function also create a copy in `aws/lambdas/cruddur-messaging-stream.py`

```python
import json
import boto3
from boto3.dynamodb.conditions import Key, Attr

dynamodb = boto3.resource(
 'dynamodb',
 region_name='<region>',
 endpoint_url="http://dynamodb.<region>.amazonaws.com"
)

def lambda_handler(event, context):
	print("event-data", event)

  eventName = event["Records"][0]["eventName"]
  if eventName == "REMOVE":
      print("skip REMOVE event")
      return

  pk = event['Records'][0]['dynamodb']['Keys']['pk']['S']
  sk = event['Records'][0]['dynamodb']['Keys']['sk']['S']
  if pk.startswith('MSG#'):
    group_uuid = pk.replace("MSG#","")
    message = event['Records'][0]['dynamodb']['NewImage']['message']['S']
    print("GRUP ===>",group_uuid,message)
    
    table_name = 'cruddur-messages'
    index_name = 'message-group-sk-index'
    table = dynamodb.Table(table_name)
    data = table.query(
      IndexName=index_name,
      KeyConditionExpression=Key('message_group_uuid').eq(group_uuid)
    )
    print("RESP ===>",data['Items'])
    
    # recreate the message group rows with new SK value
    for i in data['Items']:
      delete_item = table.delete_item(Key={'pk': i['pk'], 'sk': i['sk']})
      print("DELETE ===>",delete_item)
      
      response = table.put_item(
        Item={
          'pk': i['pk'],
          'sk': sk,
          'message_group_uuid':i['message_group_uuid'],
          'message':message,
          'user_display_name': i['user_display_name'],
          'user_handle': i['user_handle'],
          'user_uuid': i['user_uuid']
        }
      )
      print("CREATE ===>",response)
```

- From **Configuration → Permissions → Execution role** click **Role name.**
- From **Permissions policies → Add Permissions → Attach Policy.**
- Select this policy `AWSLambdaInvocation-DynamoDB` and add it.
- **Add Permissions → Create Inline Policy** and add this json to create policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "dynamodb:PutItem",
                "dynamodb:DeleteItem",
                "dynamodb:Query"
            ],
            "Resource": [
                "arn:aws:dynamodb:<region>:<account_id>:table/cruddur-messages/index/message-group-sk-index",
                "arn:aws:dynamodb:<region>:<account_id>:table/cruddur-messages"
            ]
        }
    ]
}
```

**Or using the console:**

| Account       | Region       | Table Name         | Index Name              |
|---------------|--------------|--------------------|-------------------------|
| ur aws ID     | Yours        | cruddur-messages   | message-group-sk-index  |
| Your aws ID   | Yours        | cruddur-messages   | message-group-sk-index  |


<img src="assets/week5/3- NeatDelivery/streams/6 custom policy.png">

**It Gave Effect**:

<img src="assets/week5/3- NeatDelivery/streams/6 the policy.png">


**Overview:**
<img src="assets/week5/3- NeatDelivery/streams/7 attached.png">








#### Setup Trigger in Dynamo


- From **Exports and streams** tab create trigger.
- Select Lambda function
- Leave rest as default and create trigger

#### Going back to our dev env

- Comment local ddb endpoint in docker-compose.yaml and docker compose up
- Type in URL:

```python
http://3000-URL/messages/new/bayko
```
- Send a new message:

<img src="assets/week5/3- NeatDelivery/streams/8 pattern E.png">

**Streams Data in DynamoDB:**

<img src="assets/week5/3- NeatDelivery/streams/9 patternE-Dynamo.png">


**Streams Logs In Cloudwatch:**
<img src="assets/week5/3- NeatDelivery/streams/10- patternE-Cloudwatch.png">

Traceability of logs is available in [CSV](assets/week5/%5BLOGS%5Dmessanging-streams-cloudwatch.csv) and [JSON](assets/week5/%5BLOGS%5Dmessanging-streams-cloudwatch.json).

---



**DynamoDB Reference:**

I have a solid dev with dynamo thnx to my [AWS experience](https://www.credly.com/badges/e3006b62-c8ee-430d-8dec-5da2a75b2c32).


- [Read about DynamoDB in Official website](https://aws.amazon.com/fr/dynamodb/?trk=94bf4df1-96e1-4046-a020-b07a2be0d712&sc_channel=ps&s_kwcid=AL!4422!3!610000101513!e!!g!!dynamodb&ef_id=Cj0KCQjwwtWgBhDhARIsAEMcxeDoOTqTBoS97XAHp4vUA5eci9pKGYnVyneMfNsopppX474j1f_e8X8aAjVCEALw_wcB:G:s&s_kwcid=AL!4422!3!610000101513!e!!g!!dynamodb)
- [Learned more how Dynamo works](https://docs.getcommandeer.com/docs/DynamoDB/viewing-your-dynamodb-er-diagram/#viewing-your-dynamodb-er-diagram)
- [Watched this playlist from Serverless Land](https://www.youtube.com/playlist?list=PLJo-rJlep0EDNtcDeHDMqsXJcuKMcrC5F)

