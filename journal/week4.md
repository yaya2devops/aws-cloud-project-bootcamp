# Week 4 — SQL Databases


## Table Of Contents

- [AWS RDS Setup](#amazon-relational-database-service)
- [Setup PostgreSQL - DEV](#postgresql-local-dev-environment)
   - [Setting DEV/PROD Connections](#setting-service-connection)
   - [Create DB Shell Scripts](#shebang-and-path)
   - [Create Tables ](#create-table-explicit-public)
   - [Create Seed](#create-seed)
      - [Results](#select--from-table)
   - [Setup All Script](#setup-all-script)
- [Install PostgreSQL Driver](#install-psycopg-vthree)
   - [Queried Data](#queried-data)
- [Connecting Gitpod to RDS](#rds-gitpod-connection)
   - [Automate RDS Rule](#automate-rds-security-rule)
- [Lambda Post Confirmation](#lambda-post-confirmation)
   - [Debugging](#errored---lambda-debug)
   - [Sign up Users](#rds-users)

---

# Amazon Relational Database Service

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

## And this:
<img src="assets/week4/5- Establish RDS-Connection/and the FFF bro.png">

## Queried data:
<img src="assets/week4/4- Driver and query/10 our query data is showing.png">

## From this:
<img src="assets/week4/4- Driver and query/11 from this.png">

## Doing the entire query:
<img src="assets/week4/4- Driver and query/12 what about from this getting the entire query.png">

## Result:
<img src="assets/week4/4- Driver and query/13 boom here it is.png">


---

# RDS Gitpod Connection

<img src="assets/week4/5- Establish RDS-Connection/1 we back to RDS.png">

<img src="assets/week4/5- Establish RDS-Connection/2 lets start it.png">


<img src="assets/week4/5- Establish RDS-Connection/3 i have mine set i did env lmao.png">


<img src="assets/week4/5- Establish RDS-Connection/4 fixed this.png">


<img src="assets/week4/5- Establish RDS-Connection/5 here it is.png">


<img src="assets/week4/5- Establish RDS-Connection/6 it is hanging because we require gitpod ipadress.png">


<img src="assets/week4/5- Establish RDS-Connection/7 the solution will be to configure a security rule to allow trafic from gitpod postgre to aws.png">


<img src="assets/week4/5- Establish RDS-Connection/8 u can also do directly postgre and it will map the port.png">


<img src="assets/week4/5- Establish RDS-Connection/9 to get the ip this command help dig it into env var tho.png">

<img src="assets/week4/5- Establish RDS-Connection/10 it is here safe.png">

<img src="assets/week4/5- Establish RDS-Connection/11 include it here.png">

<img src="assets/week4/5- Establish RDS-Connection/12 overview.png">

<img src="assets/week4/5- Establish RDS-Connection/13 running of an issue.png">

<img src="assets/week4/5- Establish RDS-Connection/14 i set new pw and made new co.png">

<img src="assets/week4/5- Establish RDS-Connection/15 is port is mising..png">

<img src="assets/week4/5- Establish RDS-Connection/16 trying  connect after adding to script.png">

<img src="assets/week4/5- Establish RDS-Connection/16 updated port as required.png">

<img src="assets/week4/5- Establish RDS-Connection/17 added new gitpod ip.png">

<img src="assets/week4/5- Establish RDS-Connection/18 trying all inbound.png">

<img src="assets/week4/5- Establish RDS-Connection/19- still mhh.png">

<img src="assets/week4/5- Establish RDS-Connection/20 delete and do again.png">

<img src="assets/week4/5- Establish RDS-Connection/21 doing the delete.png">

<img src="assets/week4/5- Establish RDS-Connection/22 done.png">

<img src="assets/week4/5- Establish RDS-Connection/23 re creation.png">

<img src="assets/week4/5- Establish RDS-Connection/24 still not working.png">

<img src="assets/week4/5- Establish RDS-Connection/25 pw new.png">

<img src="assets/week4/5- Establish RDS-Connection/26 lets go.png">

<img src="assets/week4/5- Establish RDS-Connection/27 listing rds db.png">

<img src="assets/week4/5- Establish RDS-Connection/28 using it directly like god.png">

---

# Automate RDS Security Rule

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/1 we need to export the rule id.png">

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/2 and security groups id.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/3 setting them export and env forgitpod.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/4 testing manually changing the inbound ip.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/5 applied it.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/6 hey applied perfect ready to include it in a script.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/7 added description ofc.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/8 what can i say just amazing.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/9 making the script and makin it exe the up rds sg rule.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/10 changed this manually for test.png">


<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/11 applied the script.png">



<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/12 looking good its applied.png">

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/13 making it a requirement in every init gitpo.png">

---

# Lambda Post Confirmation
<img src="assets/week4/6- Lambda Time/1- Create new function.png">

<img src="assets/week4/6- Lambda Time/2- create function.png">
<img src="assets/week4/6- Lambda Time/3- create.png">
<img src="assets/week4/6- Lambda Time/4 created.png">
<img src="assets/week4/6- Lambda Time/5 we can do stuff here but we are dev lets do it from vscode.png">
<img src="assets/week4/6- Lambda Time/6 create a lambda like a dev from here.png">
<img src="assets/week4/6- Lambda Time/7 coding the function.png">
<img src="assets/week4/6- Lambda Time/8 jk lets test it here to save ourself some troubles.png">
<img src="assets/week4/6- Lambda Time/9- console function deploy they mean save lmao.png">
<img src="assets/week4/6- Lambda Time/10 neew env var setup for connection.png">

<img src="assets/week4/6- Lambda Time/11 specify the value.png">
<img src="assets/week4/6- Lambda Time/12 it is our prod.png">
<img src="assets/week4/6- Lambda Time/13 add region reference in lambda layers.png">
<img src="assets/week4/6- Lambda Time/14 trigger is required.png">
<img src="assets/week4/6- Lambda Time/15 lambda trigger.png">
<img src="assets/week4/6- Lambda Time/16 setting trigger with lambda.png">
<img src="assets/week4/6- Lambda Time/17 lets add.png">
<img src="assets/week4/6- Lambda Time/18 the proxy incase u thought to go prod for real and security et.png">
<img src="assets/week4/6- Lambda Time/19 the proxy will require secret manager money brother.png">


<img src="assets/week4/6- Lambda Time/20 go back to lambda and check for logs.png">
<img src="assets/week4/6- Lambda Time/21 nothing here because it never ran.png">
<img src="assets/week4/6- Lambda Time/22 let me delete myself to trigger lambda and logs.png">
<img src="assets/week4/6- Lambda Time/23 joining frech.png">
<img src="assets/week4/6- Lambda Time/24 CONFIRMED BUT.png">
<img src="assets/week4/6- Lambda Time/25 going back to cloudwatch.png">
<img src="assets/week4/6- Lambda Time/26 we have something in here.png">
<img src="assets/week4/6- Lambda Time/27 investigate and look carefully.png">
<img src="assets/week4/6- Lambda Time/28 lets delete again.png">

<img src="assets/week4/6- Lambda Time/29 another code...png">
<img src="assets/week4/6- Lambda Time/30 still.png">
<img src="assets/week4/6- Lambda Time/31 so lets now start to connect the fuinctions to vpc.png">
<img src="assets/week4/6- Lambda Time/32 vpc specificiation.png">
<img src="assets/week4/6- Lambda Time/33 before we require the error.png">
<img src="assets/week4/6- Lambda Time/33 we require this stuf fin our lambda.png">
<img src="assets/week4/6- Lambda Time/34 checking permissions.png">
<img src="assets/week4/6- Lambda Time/35 only have basic roles.png">
<img src="assets/week4/6- Lambda Time/36 attach policy but bayko did one it said customer managed gj.png">

<img src="assets/week4/6- Lambda Time/37 lets go create ours too.png">
<img src="assets/week4/6- Lambda Time/38 picking ops or.png">
<img src="assets/week4/6- Lambda Time/39 lets do it json.png">
<img src="assets/week4/6- Lambda Time/40 policy creatted.png">
<img src="assets/week4/6- Lambda Time/41 attach policy .png">
<img src="assets/week4/6- Lambda Time/42 attached.png">
<img src="assets/week4/6- Lambda Time/43 here.png">
<img src="assets/week4/6- Lambda Time/44 permission applied to lambda.png">

## Trying the VPC NOW:
<img src="assets/week4/6- Lambda Time/45 re doing the vpc again.png">

# Worked:
<img src="assets/week4/6- Lambda Time/46 finger crossed its creatinggggg.png">

<img src="assets/week4/6- Lambda Time/47 vpc created.png">


## Updating the functions
<img src="assets/week4/6- Lambda Time/52 deployed the new version.png">

# Re-doing a user:

## One:
<img src="assets/week4/6- Lambda Time/48 lets try it and delete the user again.png">

## Two
<img src="assets/week4/6- Lambda Time/49 sign up.png">

## Three
<img src="assets/week4/6- Lambda Time/50 code.png">

## Confirmed but still ERROR:
<img src="assets/week4/6- Lambda Time/53 still error.png">

# ERRORED - Lambda Debug


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/0 cloud logs.png">

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/1 code changes.png">

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/2- delete user again.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/3 code.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/4 confirming.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/5 still.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/6 cloudwatch loggs.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/7 i took the b .png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/8 and added this rule.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/9 doing it again.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/10 confirming.png">

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/10 sounds good.png">

<img src="assets/week4/6- Lambda Time/55 further issue solved -left lambda error.png">

<img src="assets/week4/6- Lambda Time/56 ready to check  current users.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/11 this page appeared nice.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/12 latest logs.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/13 why.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/14 reload schema.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/15 bye again.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/16 do it again the user.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/17 verify.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/18 finger crossed.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/19 done here lets go logs.png">

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/20 this one i believe xD.png">

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/21 pfff.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/22 deploy the code after coding etc.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/23 deleing mysel.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/24 again.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/25 code.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/27 lets go.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/28 latest login.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/29 perfect again.png">


<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/30 lambda worked.png">

## RDS Users
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/31 new users looking good after cleaning data.png">

---





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
| Configure local backend application to use production connection URL ( Connect Gitpod to RDS Instance) |✅  |
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