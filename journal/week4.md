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


## Restart RDS:
<img src="assets/week4/5- Establish RDS-Connection/1 we back to RDS.png">

## Getting started:
<img src="assets/week4/5- Establish RDS-Connection/2 lets start it.png">


## Env Var set:
<img src="assets/week4/5- Establish RDS-Connection/3 i have mine set i did env lmao.png">

## Fixing this:
<img src="assets/week4/5- Establish RDS-Connection/4 fixed this.png">


# Here:
<img src="assets/week4/5- Establish RDS-Connection/5 here it is.png">


## Gitpod IPadress required:
<img src="assets/week4/5- Establish RDS-Connection/6 it is hanging because we require gitpod ipadress.png">


## Configure Security Rule:
<img src="assets/week4/5- Establish RDS-Connection/7 the solution will be to configure a security rule to allow trafic from gitpod postgre to aws.png">

## Also possible:
<img src="assets/week4/5- Establish RDS-Connection/8 u can also do directly postgre and it will map the port.png">

## Into env var:
<img src="assets/week4/5- Establish RDS-Connection/9 to get the ip this command help dig it into env var tho.png">


## Safe:
<img src="assets/week4/5- Establish RDS-Connection/10 it is here safe.png">


## Included:
<img src="assets/week4/5- Establish RDS-Connection/11 include it here.png">


## Overview:
<img src="assets/week4/5- Establish RDS-Connection/12 overview.png">


## Issue:
<img src="assets/week4/5- Establish RDS-Connection/13 running of an issue.png">


## Set new pw:
<img src="assets/week4/5- Establish RDS-Connection/14 i set new pw and made new co.png">


## Port missing:
<img src="assets/week4/5- Establish RDS-Connection/15 is port is mising..png">


## Connection after script:
<img src="assets/week4/5- Establish RDS-Connection/16 trying  connect after adding to script.png">


## Port Took effects:
<img src="assets/week4/5- Establish RDS-Connection/16 updated port as required.png">


## Add New GitPod Ip: 
<img src="assets/week4/5- Establish RDS-Connection/17 added new gitpod ip.png">


## Trying Inbound:
<img src="assets/week4/5- Establish RDS-Connection/18 trying all inbound.png">


## yet:
<img src="assets/week4/5- Establish RDS-Connection/19- still mhh.png">

## Delete and Again:
<img src="assets/week4/5- Establish RDS-Connection/20 delete and do again.png">


## Doing the delete:
<img src="assets/week4/5- Establish RDS-Connection/21 doing the delete.png">

## Done:
<img src="assets/week4/5- Establish RDS-Connection/22 done.png">

## Re creation:
<img src="assets/week4/5- Establish RDS-Connection/23 re creation.png">


## Still:
<img src="assets/week4/5- Establish RDS-Connection/24 still not working.png">

## New pw:
<img src="assets/week4/5- Establish RDS-Connection/25 pw new.png">

## Great!
<img src="assets/week4/5- Establish RDS-Connection/26 lets go.png">


## Listing RDS Databases
<img src="assets/week4/5- Establish RDS-Connection/27 listing rds db.png">

## Usage:
<img src="assets/week4/5- Establish RDS-Connection/28 using it directly like god.png">

---

# Automate RDS Security Rule

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/1 we need to export the rule id.png">

## Getting security groups id:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/2 and security groups id.png">


## Setting export and gitpodip env:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/3 setting them export and env forgitpod.png">

## Manual Test:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/4 testing manually changing the inbound ip.png">


## Application:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/5 applied it.png">

## Applied and ready to automate:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/6 hey applied perfect ready to include it in a script.png">


## Description for clarity:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/7 added description ofc.png">

## Looking Amazing:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/8 what can i say just amazing.png">


## Creating the exe script:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/9 making the script and makin it exe the up rds sg rule.png">


## Manual changes:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/10 changed this manually for test.png">

## Reloading:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/11 applied the script.png">


## Applied:
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/12 looking good its applied.png">

## Required at Init:
> automated.

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/13 making it a requirement in every init gitpo.png">

---

# Lambda Post Confirmation

<img src="assets/week4/6- Lambda Time/1- Create new function.png">

## Create Function:
<img src="assets/week4/6- Lambda Time/2- create function.png">

## Creating:
<img src="assets/week4/6- Lambda Time/3- create.png">

## Created:
<img src="assets/week4/6- Lambda Time/4 created.png">

## Function Space:
<img src="assets/week4/6- Lambda Time/5 we can do stuff here but we are dev lets do it from vscode.png">

## Create from dev space:
<img src="assets/week4/6- Lambda Time/6 create a lambda like a dev from here.png">

## Coding the function:
<img src="assets/week4/6- Lambda Time/7 coding the function.png">

## Testing:
<img src="assets/week4/6- Lambda Time/8 jk lets test it here to save ourself some troubles.png">

## Deploy equals SAVE:
<img src="assets/week4/6- Lambda Time/9- console function deploy they mean save lmao.png">

## New ENV VAR:
<img src="assets/week4/6- Lambda Time/10 neew env var setup for connection.png">

## Value specify:
<img src="assets/week4/6- Lambda Time/11 specify the value.png">

## Our prod:
<img src="assets/week4/6- Lambda Time/12 it is our prod.png">

## Region Ref:
<img src="assets/week4/6- Lambda Time/13 add region reference in lambda layers.png">

## Trigger required:
<img src="assets/week4/6- Lambda Time/14 trigger is required.png">

<img src="assets/week4/6- Lambda Time/15 lambda trigger.png">

## Settin a trigger:
<img src="assets/week4/6- Lambda Time/16 setting trigger with lambda.png">

## Adding:
<img src="assets/week4/6- Lambda Time/17 lets add.png">

## Proxy for production considerations:
<img src="assets/week4/6- Lambda Time/18 the proxy incase u thought to go prod for real and security et.png">

## Requires secret manager:
<img src="assets/week4/6- Lambda Time/19 the proxy will require secret manager money brother.png">

## Back to Lambda for logs:
<img src="assets/week4/6- Lambda Time/20 go back to lambda and check for logs.png">

## Nothing here(never ran):
<img src="assets/week4/6- Lambda Time/21 nothing here because it never ran.png">

## Delete myself to trigger lambda:
<img src="assets/week4/6- Lambda Time/22 let me delete myself to trigger lambda and logs.png">

## Joinig fresh:
<img src="assets/week4/6- Lambda Time/23 joining frech.png">

## Confirmed BUT:
<img src="assets/week4/6- Lambda Time/24 CONFIRMED BUT.png">

## Cloudwatch Logs:
<img src="assets/week4/6- Lambda Time/25 going back to cloudwatch.png">

## We have something:
<img src="assets/week4/6- Lambda Time/26 we have something in here.png">

## Looking careful:
<img src="assets/week4/6- Lambda Time/27 investigate and look carefully.png">

## Delete again:
<img src="assets/week4/6- Lambda Time/28 lets delete again.png">

## Code:
<img src="assets/week4/6- Lambda Time/29 another code...png">


## Still: 
<img src="assets/week4/6- Lambda Time/30 still.png">

## Connect to VPC:
<img src="assets/week4/6- Lambda Time/31 so lets now start to connect the fuinctions to vpc.png">

## VPC Specification:
<img src="assets/week4/6- Lambda Time/32 vpc specificiation.png">

## Error
<img src="assets/week4/6- Lambda Time/33 before we require the error.png">

## Required for LAMBDA:
<img src="assets/week4/6- Lambda Time/33 we require this stuf fin our lambda.png">

## Checking permissions:
<img src="assets/week4/6- Lambda Time/34 checking permissions.png">

## Limited:
<img src="assets/week4/6- Lambda Time/35 only have basic roles.png">

## Attaching policy:
<img src="assets/week4/6- Lambda Time/36 attach policy but bayko did one it said customer managed gj.png">

## Creating one:
<img src="assets/week4/6- Lambda Time/37 lets go create ours too.png">

## Picking:
<img src="assets/week4/6- Lambda Time/38 picking ops or.png">

## Going JSON:
<img src="assets/week4/6- Lambda Time/39 lets do it json.png">

## Done:
<img src="assets/week4/6- Lambda Time/40 policy creatted.png">

## Attachin the policy:
<img src="assets/week4/6- Lambda Time/41 attach policy .png">

## Attached:
<img src="assets/week4/6- Lambda Time/42 attached.png">

## Here:
<img src="assets/week4/6- Lambda Time/43 here.png">

## Permission Applied:
<img src="assets/week4/6- Lambda Time/44 permission applied to lambda.png">

## Trying the VPC NOW:
<img src="assets/week4/6- Lambda Time/45 re doing the vpc again.png">

## Worked:
<img src="assets/week4/6- Lambda Time/46 finger crossed its creatinggggg.png">

## VPC Created:
<img src="assets/week4/6- Lambda Time/47 vpc created.png">


## Updating the functions
<img src="assets/week4/6- Lambda Time/52 deployed the new version.png">

## Re-doing a user, 1:

<img src="assets/week4/6- Lambda Time/48 lets try it and delete the user again.png">

## Two:
<img src="assets/week4/6- Lambda Time/49 sign up.png">

## Three:
<img src="assets/week4/6- Lambda Time/50 code.png">

## Confirmed but still ERROR:
<img src="assets/week4/6- Lambda Time/53 still error.png">

# ERRORED - Lambda Debug

## Cloudwatch Logs:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/0 cloud logs.png">


## Code changes:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/1 code changes.png">

## Delete user again:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/2- delete user again.png">


## Code EMAIL:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/3 code.png">



## Confirming
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/4 confirming.png">


## Still:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/5 still.png">


## Cloudwatch Logs Again:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/6 cloudwatch loggs.png">


## Taking B:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/7 i took the b .png">


## Added this rule:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/8 and added this rule.png">

## Doing it again:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/9 doing it again.png">


## Confirming:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/10 confirming.png">

## Sounds good:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/10 sounds good.png">


## Left Lambda Error:      
<img src="assets/week4/6- Lambda Time/55 further issue solved -left lambda error.png">


## Checking current user:
<img src="assets/week4/6- Lambda Time/56 ready to check  current users.png">


## Good step ahead:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/11 this page appeared nice.png">


## Latest Logs:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/12 latest logs.png">


## Hm, why:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/13 why.png">


## Reload Schema:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/14 reload schema.png">


## See you again:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/15 bye again.png">


## User again:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/16 do it again the user.png">


## VERIFYING:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/17 verify.png">

## Finger CROSSED:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/18 finger crossed.png">

## Okay here, lets logs:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/19 done here lets go logs.png">


## This one:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/20 this one i believe xD.png">


## Not yet:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/21 pfff.png">


## Coding and re deploy the code:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/22 deploy the code after coding etc.png">


## Deleting myself:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/23 deleing mysel.png">



## Again!
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/24 again.png">


## Code:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/25 code.png">

## Lets:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/27 lets go.png">


## Latest Login:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/28 latest login.png">

## Perfect:
<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/29 perfect again.png">

## Lambda is Functioning!
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
| Propagate metrics from DDB to an RDS metrics table |✅|
|Create Congito Trigger to insert user into database|✅|
|Create new activities with a database insert|✅|
|||


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