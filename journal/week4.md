# Week 4 — SQL Databases

---

# Amazon Relational Database Service

## Setup RDS:
<img src="assets/week4/1-ProdDB/1 go to rds in aws console.png">

## Create DB:
<img src="assets/week4/1-ProdDB/2 create db.png">


## Pick the Engine
<img src="assets/week4/1-ProdDB/3 anyway bro.png">

## Think Agile:
<img src="assets/week4/1-ProdDB/4 be smart and combine all clickops in a command from here.png">

## AWS AUTH:
<img src="assets/week4/1-ProdDB/5 check auth.png">

## All in one command:
<img src="assets/week4/1-ProdDB/6 done.png">


## RDS Loading:
<img src="assets/week4/1-ProdDB/7 rds creating.png">

## RDS READY:
<img src="assets/week4/1-ProdDB/8 db ready.png">

## RDS Dashboad:
<img src="assets/week4/1-ProdDB/9 overviw rds itruns ontop of ec2.png">

## Stop tempo:
<img src="assets/week4/1-ProdDB/10 stop it tempo for costs.png">

## Confirm Stop:
<img src="assets/week4/1-ProdDB/11 stop confirm.png">

## Stopped:
<img src="assets/week4/1-ProdDB/12 db resting.png">

---

# PostgreSQL Local Dev Environment

## De-provisioning Dynamo for NOSQL week:
<img src="assets/week4/2- localwork/0 stoppping dynamo for now to gain containers runtime.png">

## Postgre Set:
<img src="assets/week4/2- localwork/1 prereq init cli and server.png">

## Back to Postgre:
<img src="assets/week4/2- localwork/2 opla we are back.png">

## Listing Databases:
<img src="assets/week4/2- localwork/3 my databases.png">

## Creating Cruddur database:
<img src="assets/week4/2- localwork/4 create db.png">

## Adding UUID:
<img src="assets/week4/2- localwork/5 adding  UUI to have it always.png">

## Creating the extension: 
<img src="assets/week4/2- localwork/6 executing extension.png">

## Setting Service Connection:
<img src="assets/week4/2- localwork/7 setting service connection.png">

## Connection URL:
<img src="assets/week4/2- localwork/8 co url done.png">

## Prod Connection URL:
<img src="assets/week4/2- localwork/9 set up prod connection.png">

## Shebang and path:

This will be treated as bash even tho you see no extensions.

And this scripts will be used to interact with the db. Sounds fun, right?

<img src="assets/week4/2- localwork/10 continue with db treate this files as bash scripts.png">

## Consider Files Not executed by default:
<img src="assets/week4/2- localwork/11 we known that files not exec bydefault.png">

## Consult current permissions:
> Learn about [Linux?](https://linux.yahya-abulhaj.dev/)


<img src="assets/week4/2- localwork/12 permissions.png">

## Changing mode:
<img src="assets/week4/2- localwork/13 exec not just for user but all of em incl groups.png">

## Giving permission:
<img src="assets/week4/2- localwork/13 giving permission to one file.png">

## User have the execution
After created the 3 scripts i gave them the X for me.

<img src="assets/week4/2- localwork/14 looking for this.png">

## Drop concern:
<img src="assets/week4/2- localwork/15 exec drop hmm.png">

## Exclusion required:
<img src="assets/week4/2- localwork/16 we have to exclude this because not just its creating but also dropping there.png">

## Sed is RESOLVER:
<img src="assets/week4/2- localwork/17 using sed will solve it.png">

## Lets explain it:

```SQL
sed 's/\/cruddur//g'
```
To get rid of `/` do `\` infront of it

for this `/cruddur//` It will take it and change it with empty using `//`


Now let's feed it to our connection string:

```SQL
sed 's/\/cruddur//g' <<< "$CONNECTION_URL"
```

WRAPPING in dollar sign so we can assign it to our env var

```SQL
NO_DB_CONNECTION=$(sed 's/\/cruddur//g' <<< "$CONNECTION_URL"
```

## Dropping:
<img src="assets/week4/2- localwork/18 db drop done ofc pro.png">

## Create DB script: 
<img src="assets/week4/2- localwork/19 db create.png">

## Create SCHEMA:
<img src="assets/week4/2- localwork/20 schema done.png">

## Path issue:
<img src="assets/week4/2- localwork/21 path dont work unless specified.png">

## Real path:
<img src="assets/week4/2- localwork/22 check real path.png">

## The full path:
<img src="assets/week4/2- localwork/23 full path.png">

## Doing Clarity:
<img src="assets/week4/2- localwork/24 going dot back for clarity.png">

## Will have to launch it inside backend:
<img src="assets/week4/2- localwork/25 skip bro he coudnt set it outside.png">

## Working from inside for now:
<img src="assets/week4/2- localwork/26 we get it working from here now.png">

## Analyze, Design, See, Act:
<img src="assets/week4/2- localwork/27 detect see think etc.png">

## Env-Specific Implementations:
<img src="assets/week4/2- localwork/28 very perfect work.png">

## This is so cool:
<img src="assets/week4/2- localwork/29 colorin prompt.png">

## Result:
<img src="assets/week4/2- localwork/30 looking superrrrrrrrrrrrr greatttt.png">

## Create Table Explicit Public:
<img src="assets/week4/2- localwork/31 create table and explicit public for microservice later for efverydomain.png">

## Taking reference:
<img src="assets/week4/2- localwork/32 always make it from here dont relay even on gpt blabla.png">

> Gloria said; schema is like the excel file, tables /views are like the sheets in it.


## A missed semicoolon:
<img src="assets/week4/2- localwork/34 semi colon traps LOL not really.png">

## Defining Drop Table:
<img src="assets/week4/2- localwork/35 defin drop table if exists.png">

## Execute Table:
<img src="assets/week4/2- localwork/36 table created executed.png">

## Connection Script Execute:
<img src="assets/week4/2- localwork/37 db connect create exec and check.png">

## Connection:
<img src="assets/week4/2- localwork/38 connection works.png">

## List Created Tables:
<img src="assets/week4/2- localwork/39 the tables we created are there indeed.png">

## Create Seed:
<img src="assets/week4/2- localwork/40 create seed diff to schema load but diff path.png">

## Beautify:
<img src="assets/week4/2- localwork/41 beautify create.png">

## And Decorate:
<img src="assets/week4/2- localwork/42 beautify drop.png">

## Seed ready:
<img src="assets/week4/2- localwork/43 seed ready to launch.png">

## Insert UUID:
<img src="assets/week4/2- localwork/44 we first insert our UUID.png">

## Data inserted:
<img src="assets/week4/2- localwork/45 wrap up our data boy are there.png">


## Select * From Table:

<img src="assets/week4/3- psqlquery/0 select but nothing showing cool because data is not clean.png">

## Structuring:
<img src="assets/week4/3- psqlquery/2 data is looking good now.png">


## DB Explorer Ops:
<img src="assets/week4/3- psqlquery/3 easier way to use db.png">

## Dropping Check:
<img src="assets/week4/3- psqlquery/4 we cant drop so we have to kill connections.png">

## Create sessions script:
<img src="assets/week4/3- psqlquery/5 create sessions script and exe it.png">

## Checking Current sessions:
<img src="assets/week4/3- psqlquery/6 current sessions.png">

## Setup All Script:
<img src="assets/week4/3- psqlquery/7 setup all damn.png">

## Launch and Observe:
<img src="assets/week4/3- psqlquery/8 all at once.png">


---

# Install Psycopg V.Three

<img src="assets/week4/4- Driver and query/1 install psql driver psychopg.png">


<img src="assets/week4/4- Driver and query/2 we dont need this static data anymore.png">

## Connect with the LIB:
<img src="assets/week4/4- Driver and query/3 instead connect with the lib.png">

## Add the query here:
<img src="assets/week4/4- Driver and query/4 and we can add our query here.png">

## Fetchone or fetchall:
<img src="assets/week4/4- Driver and query/5 this is required not fetchone.png">

## Blank is perfectly fine:
<img src="assets/week4/4- Driver and query/6 blank perfectly fine.png">

## The way to get JSON:
<img src="assets/week4/4- Driver and query/7 andrew way to get json.png">

## Hm. Idk.
<img src="assets/week4/4- Driver and query/8 idk .png">

## Some cool traps:
<img src="assets/week4/4- Driver and query/9 traps.png">

## Queried data:
<img src="assets/week4/4- Driver and query/10 our query data is showing.png">

## From this:
<img src="assets/week4/4- Driver and query/11 from this.png">

## Doing the entire query:
<img src="assets/week4/4- Driver and query/12 what about from this getting the entire query.png">

## Result:
<img src="assets/week4/4- Driver and query/13 boom here it is.png">


---

# RDS Gitpod Connection - Loading



---

## Week 4 Tasks & Student Status
| Task | Stats |
| :--- | :---: |
| Have a lecture about data modelling in (3rd Normal Form) 3NF for SQL |✅  |
 |Watched Ashish's Week 4 - Security Considerations |✅|
| Launch Postgres locally via a container |  ✅|
|Bash scripting for common database actions|✅|
| Seed our Postgres Database table with data | ✅ |
| Write a DDL (for creating schema) | ✅ |
| Write an SQL read query | ✅ |
| Write an SQL write query |✅  |
| Provision an RDS Postgres instance | ✅ |
| Configure local backend application to use production connection URL ( Connect Gitpod to RDS Instance) |⌛  |
| Configure VPC Security Groups | ✅ |
| Add a caching layer using Momento Serverless Cache | ⌛ |
| Propagate metrics from DDB to an RDS metrics table |⌛|
|Create Congito Trigger to insert user into database|⌛|
|Create new activities with a database insert|⌛|


---


| **Security Quiz**  | Answer |
| :--- | :--- |
| Which of the following databases would you NOT find available as an option on the AWS RDS service? | DynamoDB |
| Which of the following CIDR notations means you want to target any/all possible addresses? | 0.0.0.0/0 |
| Which AWS Service can be used in conjunction with RDS to help rotate access keys regularly? | Secrets Manager |
| True or False, best practice dictates your RDS instance should never be publicly available on the internet | TRUE |  |


| Alternatives and Considerations                              |
|:-------------------------------------------------------------|
| We require a Postgres service if we plan into AuthN which will rely on Postgres to store users for authentication. |
| I want both an OnLine Transaction Processing (OLTP) and an OLAP in this project. |
| Redshift Serverless could be used as an OLAP.                |
| DDB Streams to S3 and then Athena caching to Momento could have been possible as well for our OLAP like solution. |
| When creating security group rules for your RDS instance, only allow private network access with rules targeting specific security groups  |