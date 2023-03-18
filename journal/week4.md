# Week 4 — Relational Database: Postgres and RDS

---

# Prod Database; AWS RDS

<img src="assets/week4/1-ProdDB/1 go to rds in aws console.png">


<img src="assets/week4/1-ProdDB/2 create db.png">


<img src="assets/week4/1-ProdDB/3 anyway bro.png">

<img src="assets/week4/1-ProdDB/4 be smart and combine all clickops in a command from here.png">

<img src="assets/week4/1-ProdDB/5 check auth.png">

<img src="assets/week4/1-ProdDB/6 done.png">


<img src="assets/week4/1-ProdDB/7 rds creating.png">

<img src="assets/week4/1-ProdDB/8 db ready.png">

<img src="assets/week4/1-ProdDB/9 overviw rds itruns ontop of ec2.png">

<img src="assets/week4/1-ProdDB/10 stop it tempo for costs.png">

<img src="assets/week4/1-ProdDB/11 stop confirm.png">

<img src="assets/week4/1-ProdDB/12 db resting.png">

---

# Dev DB; psql

<img src="assets/week4/2- localwork/0 stoppping dynamo for now to gain containers runtime.png">

<img src="assets/week4/2- localwork/1 prereq init cli and server.png">

<img src="assets/week4/2- localwork/2 opla we are back.png">
<img src="assets/week4/2- localwork/3 my databases.png">
<img src="assets/week4/2- localwork/4 create db.png">
<img src="assets/week4/2- localwork/5 adding  UUI to have it always.png">
<img src="assets/week4/2- localwork/6 executing extension.png">
<img src="assets/week4/2- localwork/7 setting service connection.png">
<img src="assets/week4/2- localwork/8 co url done.png">
<img src="assets/week4/2- localwork/9 set up prod connection.png">
<img src="assets/week4/2- localwork/10 continue with db treate this files as bash scripts.png">
<img src="assets/week4/2- localwork/11 we known that files not exec bydefault.png">
<img src="assets/week4/2- localwork/12 permissions.png">
<img src="assets/week4/2- localwork/13 exec not just for user but all of em incl groups.png">
<img src="assets/week4/2- localwork/13 giving permission to one file.png">
<img src="assets/week4/2- localwork/14 looking for this.png">
<img src="assets/week4/2- localwork/15 exec drop hmm.png">
<img src="assets/week4/2- localwork/16 we have to exclude this because not just its creating but also dropping there.png">
<img src="assets/week4/2- localwork/17 using sed will solve it.png">
<img src="assets/week4/2- localwork/18 db drop done ofc pro.png">
<img src="assets/week4/2- localwork/19 db create.png">
<img src="assets/week4/2- localwork/20 schema done.png">
<img src="assets/week4/2- localwork/21 path dont work unless specified.png">
<img src="assets/week4/2- localwork/22 check real path.png">
<img src="assets/week4/2- localwork/23 full path.png">
<img src="assets/week4/2- localwork/24 going dot back for clarity.png">
<img src="assets/week4/2- localwork/25 skip bro he coudnt set it outside.png">
<img src="assets/week4/2- localwork/26 we get it working from here now.png">
<img src="assets/week4/2- localwork/27 detect see think etc.png">
<img src="assets/week4/2- localwork/28 very perfect work.png">
<img src="assets/week4/2- localwork/29 colorin prompt.png">
<img src="assets/week4/2- localwork/30 looking superrrrrrrrrrrrr greatttt.png">
<img src="assets/week4/2- localwork/31 create table and explicit public for microservice later for efverydomain.png">
<img src="assets/week4/2- localwork/32 always make it from here dont relay even on gpt blabla.png">
<img src="assets/week4/2- localwork/33 her comment is nice.png">
<img src="assets/week4/2- localwork/34 semi colon traps LOL not really.png">
<img src="assets/week4/2- localwork/35 defin drop table if exists.png">
<img src="assets/week4/2- localwork/36 table created executed.png">
<img src="assets/week4/2- localwork/37 db connect create exec and check.png">
<img src="assets/week4/2- localwork/38 connection works.png">
<img src="assets/week4/2- localwork/39 the tables we created are there indeed.png">

## Create Seed:
<img src="assets/week4/2- localwork/40 create seed diff to schema load but diff path.png">

## Beautify:
<img src="assets/week4/2- localwork/41 beautify create.png">
<img src="assets/week4/2- localwork/42 beautify drop.png">

## Seed ready:
<img src="assets/week4/2- localwork/43 seed ready to launch.png">

## Insert UUID:
<img src="assets/week4/2- localwork/44 we first insert our UUID.png">

## Data inserted:
<img src="assets/week4/2- localwork/45 wrap up our data boy are there.png">



---





---

## Week 4 Tasks & Student Status
| Task | Stats |
| :--- | :---: |
| Have a lecture about data modelling in (3rd Normal Form) 3NF for SQL |⌛  |
| Launch Postgres locally via a container |  ⌛|
| Seed our Postgres Database table with data | ⌛ |
| Write a Postgres adapter |⌛  |
| Write a DDL (for creating schema) | ⌛ |
| Write an SQL read query | ⌛ |
| Write an SQL write query |⌛  |
| Provision an RDS Postgres instance | ⌛ |
| Configure VPC Security Groups | ⌛ |
| Configure local backend application to use production connection URL |⌛  |
| Add a caching layer using Momento Serverless Cache | ⌛ |
| Propagate metrics from DDB to an RDS metrics table |⌛  |