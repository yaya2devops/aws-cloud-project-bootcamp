# Week 4 — SQL Databases

In the 4th week, we will leverage the capabilities of **Structured Query Language**, a powerful tool for working with databases. The sophisticated system will function as the repository for user profiles, seamlessly integrating their platform activities which encompass **Create, Read, Update, and Delete operations**. 

Through this exploration, we aspire to deepen our understanding of how databases intricately manage user interactions, thereby **augmenting our practical skill** set in a *significant manner*.

## Week Four Main Tasks
- [Pathways to Success In Databases](#pathways-to-success-in-database)
- [Opting for PostgreSQL](#opting-for-postgresql)
- [Amazon Relational Database Service](#amazon-relational-database-service)
  - [Creating an RDS Instance In The Console](#creating-an-rds-instance-in-aws-console)
  - [Creating an RDS Instance In AWS CLI](#creating-an-rds-instance-in-aws-cli)
- [PSQL for Everyone](#psql-for-everyone)
  - [SQL Maestro Pro](#sql-maestro-pro)
  - [Cruddur Database Create](#cruddur-database-create)
  - [Design PSQL Schema — **`8 Steps`**](#design-psql-schema)
- [Bash Scripts for Database Operations — **`5 Steps`**](#bash-scripts-for-database-operations)
   - [Step Bonus: Aesthetics in Bash Scripts](#bonus-step-aesthetics-in-bash-scripts)
   - [Transform Text with `sed`, The Stream editor](#text-transformation-with-stream-editor)
- [Simplify Connecting To PSQL](#simplify-connecting-to-psql)
- [Connecting to AWS RDS Instance in Gitpod — **`7 Steps`**](#connecting-to-aws-rds-instance-in-gitpod)
- [Implement PostgreSQL Flask Client — **`6 Steps`**](#implement-postgresql-client)
- [A Database of Experiences](#a-database-of-experiences)
  - [Cognito **Users** Post Confirmation — **`11 Steps`**](#lambda-for-cognito-post-confirmation)

# Pathways to Success in Database
I am surpassing my initial expectations with this section, and I am creating a clear path for you, driven by my affection towards you.

DBAs are more concerned with the technical aspects of database management and maintenance, while Data Analysts focus on extracting meaningful insights from the data for decision-making purposes.

[Create a Diagram Like This One.](resources/mermaid.md)

```mermaid
journey
  title Database Management Office Hours
  section Designing Tables
    Define schema: 5: DBA
    Create indexes: 3: DBA
    Optimize queries: 1: DBA, Analyst
  section Data Manipulation
    Insert records: 5: DBA
    Update entries: 3: DBA
    Analyze data: 1: Analyst
  section Maintenance
    Backup data: 5: DBA
    Monitor performance: 3: DBA
    Fine-tune system: 2: DBA
```

If you possess a keen interest in the realm of data, I recommend embarking on a trajectory that starts with assuming the role of a **Data Analyst** and subsequently progressing through the ranks to eventually become a **Data Administrator**, Engineer, and ultimately an Architect.

| Role                     | Responsibilities                                                                                     |
|--------------------------:|:-------------------------------------------------------------------------------------------------------|
| **Data Analyst**             | **Data Manipulation**<br>► Analyze Data: Extract insights and patterns using SQL and analysis tools.   |
| **Database Administrator**   | **Designing Tables**<br>► Define Schema: Design efficient database schema with tables and relationships.<br><br>**Data Manipulation**<br>► Insert Records: Ensure data integrity during record insertion.<br>► Update Entries: Enforce data constraints during updates.<br><br>**Optimizing Queries**<br>► Optimize Queries: Enhance query performance using indexes and analysis.<br><br>**Maintenance**<br>► Backup Data: Perform data backups for recovery.<br>► Monitor Performance: Identify and resolve performance issues.<br>► Fine-Tune System: Optimize system resources. |
| **Data Engineer**            | **Data Management**<br>► ETL Processes: Develop and manage Extract, Transform, Load (ETL) processes.<br>► Data Integration: Integrate data from various sources into cohesive pipelines.<br><br>**Infrastructure**<br>► Data Storage: Design and manage data storage solutions.<br>► Data Transformation: Develop data transformation logic for analysis and reporting.<br><br>**Data Quality**<br>► Data Cleansing: Ensure data quality and consistency.<br>► Data Pipeline Monitoring: Monitor data flows for accuracy and reliability. |
| **Data Architect**         | **System Design**<br>► Architect Data Solutions: Design scalable and efficient data architecture.<br>► Data Modeling: Create advanced data models for complex business needs.<br><br>**Leadership**<br>► Team Collaboration: Lead data teams, aligning efforts with business objectives.<br>► Technology Selection: Evaluate and select appropriate data technologies

You can follow the path I outlined, founded on trust and practical expertise. Drawing from my firsthand experience in working with data and effectively leveraging Google Cloud, Azure, and AWS services for substantial big data and machine learning projects, you can have full confidence in the credibility of this roadmap.

Each role builds upon the previous, culminating in an enriching journey marked by both personal growth and impactful contributions to the world of data management and analysis.


| 💡  | I can direct you towards a range of tech, Incl. Amazon Redshift, BigQuery, and [Google Looker](assets/week4/poc/looker-for-data.png).     |
|---------------|:------------------------|

# Opting for PostgreSQL

![PostgreSQL Top Pick](assets/week4/lq-w4-banner.png)

PostgreSQL is a top database engine in the market for a reason. It offers a wide range of powerful features, it is reliable and robust, and it has a large and active community of users and developers.

* **Open source and free:** It is freely available to use, modify, and distribute.
* **ACID compliance:** PostgreSQL guarantees that all transactions are atomic, consistent, isolated, and durable.
* **JSON and XML support:** The engine supports the JSON and XML data types, which makes it a good choice for applications that need to store and query semi-structured data.
```mermaid
pie
"Advanced Features" : 40
"Robustness and Reliability" : 35
"Community Support" : 20
"Extensibility" : 25
"Standards Compliance" : 30
```
* **Full-text search:** PostgreSQL has built-in full-text search capabilities, which makes it easy to find data within large datasets.
* **Replication and clustering:** PostgreSQL supports replication and clustering, which makes it possible to scale the database to meet the needs of growing applications.

**Our** initial steps will involve creating the database, establishing a connection to it, and subsequently outlining a schema that aligns with the specifications mentioned earlier.

## Amazon Relational Database Service
RDS is a cutting-edge cloud-based solution that has revolutionized the way databases are managed and hosted. 

RDS offers a seamless and efficient way to host, manage, and scale relational databases like PostgreSQL without the need for extensive infrastructure management. We'll integrate this database to facilitate CRUD operations, enabling us to store user posts seamlessly. 

### Creating an RDS Instance in AWS Console
Navigate to the console for further insights into the workings of RDS.
1. Go to the RDS section in the AWS Management Console.
2. Click the `"Create database"` button.
3. Choose `"Standard Create"` and select the `PostgreSQL` engine.
4. Specify a unique identifier for your DB instance.
5. Configure instance details, such as class, storage, and VPC settings.
6. Set a secure master username and password.
7. Configure network settings and enable `"Publicly accessible"`.
8. Provide a database name and choose a port.
9. Enable `Performance Insights` and set a retention period.
10. Set backup retention to `0` and disable deletion protection.
11. Choose storage type and enable encryption.
12. Review and create the instance.

<img src="assets/week4/1-ProdDB/3 anyway bro.png">

- Monitor creation progress on the RDS Dashboard.

```
DB instance created:
Instance ID: `cruddur-db-instance`
Engine: `PostgreSQL`
Instance Class: `db.t3.micro`
...
Status: `Creating`
```
<img src="assets/week4/1-ProdDB/9 overviw rds itruns ontop of ec2.png">

### Creating an RDS Instance in AWS CLI
The preceding clicks were meticulously crafted within a solitary command-line prompt, encompassing all operations within distinct flags with [this synopsis.](https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html)

<img src="assets/week4/1-ProdDB/6 done.png">

- Duplicate the provided CLI command and carefully examine the required areas.

```
aws rds create-db-instance \
  --db-instance-identifier cruddur-db-instance \
  --db-instance-class db.t3.micro \
  --engine postgres \
  --engine-version  14.6 \
  --master-username <required> \
  --master-user-password <required> \
  --allocated-storage 20 \
  --availability-zone <required> \
  --backup-retention-period 0 \
  --port 5432 \
  --no-multi-az \
  --db-name cruddur \
  --storage-type gp2 \
  --publicly-accessible \
  --storage-encrypted \
  --enable-performance-insights \
  --performance-insights-retention-period 7 \
  --no-deletion-protection
```

#### Required
- Choose a `master-username`
- `master-user-password` with a length between 8 and 30 characters.
- Change `availability-zone` with yours

| ⛔ | RDS operates on EC2 and can only undergo a temporary suspension for up to seven days.  Beyond this period, it will automatically resume. |
|:-----:|-------------|
| 💡    | Proceed with a momentary halt of the RDS instance and remember to establish a notification for its automatic restart in seven days. |

- Access AWS RDS, navigate to the "Databases" section, and select the desired database entry.


<img src="assets/week4/1-ProdDB/8 db ready.png">

Please await the RDS status to transition to the "Available" stated by the green indicator.

#### Considerations
**5432** is the default port used by PostgreSQL. Many attackers will scan for databases on the default port, so changing it might reduce the number of automated attacks targeting your database.

# PSQL for Everyone

In this segment, I will make every effort to equip you with SQL knowledge. We are going to initiate our local PostgreSQL instance and establish a connection to it.

- Earlier (Week-1), we set up psql as a container, and I walked you through the procedure [right here](week1.md#postgresql-container).

Now, we will demonstrate how to simply execute that.

1. Run the following command in a terminal:
```
docker compose up
```
2. Connect with the password `password`.
```bash
gitpod /workspace/aws-cloud-project-bootcamp (main) $ psql -Upostgres -h localhost
```

<img src="assets/week4/2- localwork/2 opla we are back.png">

## SQL Maestro Pro

The array of tasks and activities that can be accomplished within the realm of database management is remarkably extensive.
1. To start off, initiate the process by creating your own database, for instance;
```sql
CREATE DATABASE database_name; 
```
2. Discard the database if it's no longer required.
```sql
DROP DATABASE database_name;
```
<img src="assets/week4/2- localwork/18 db drop done ofc pro.png">

3. Additionally, you can execute straightforward tasks such as;

| Command                | Description                                                  | Example |
|------------------------|--------------------------------------------------------------|---------|
| `\x`                   | Enable expanded display when viewing data.                  | `\x on` |
| `\q`                   | Quit the PSQL command-line interface.                       | `\q`    |
| `\l`                   | List all available databases.                               | `\l`    |
| `\c database_name`     | Connect to a specific database.                             | `\c database_name` |
| `\dt`                  | List all tables in the current database.                   | `\dt`   |
| `\d table_name`        | Describe a specific table's structure.                      | `\d table_name` |
| `\du`                  | List all users and their roles.                             | `\du`   |
| `\dn`                  | List all schemas in the current database.                   | `\dn`   |

<details>

<summary>
4. Moreover, you can delve into more sophisticated operations <b> inside.</b>
</summary>
  
| Command         | Description                                                                                              | Example SQL                                   |
|-----------------|----------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| SELECT          | Retrieve data from a database.                                                                          | `SELECT column1, column2 FROM table_name;`    |
| INSERT          | Add new records into a table.                                                                           | `INSERT INTO table_name (column1, column2) VALUES (value1, value2);` |
| UPDATE          | Modify existing records in a table.                                                                     | `UPDATE table_name SET column1 = value1 WHERE condition;` |
| DELETE          | Remove records from a table.                                                                            | `DELETE FROM table_name WHERE condition;`     |
| CREATE TABLE    | Create a new table in the database.                                                                     | ```sql CREATE TABLE table_name ( column1 datatype, column2 datatype, ... ); ``` |
| ALTER TABLE     | Modify an existing table (add, modify, or delete columns).                                            | ```sql ALTER TABLE table_name ADD column_name datatype; ```<br> ```sql ALTER TABLE table_name MODIFY column_name datatype; ```<br> ```sql ALTER TABLE table_name DROP COLUMN column_name; ``` |
| DROP TABLE      | Delete a table and its data.                                                                            | `DROP TABLE table_name;`                     |
| CREATE INDEX    | Create an index on columns to improve query performance.                                               | `CREATE INDEX index_name ON table_name (column_name);` |
| ALTER INDEX     | Modify an existing index.                                                                               | `ALTER INDEX index_name REBUILD;`            |
| JOIN            | Combine rows from multiple tables based on related columns.                                           | `SELECT column1, column2 FROM table1 INNER JOIN table2 ON table1.column = table2.column;` |
| GROUP BY        | Group rows with the same values in specified columns.                                                 | `SELECT column1, COUNT(*) FROM table_name GROUP BY column1;` |
| HAVING          | Filter results of aggregate functions in combination with GROUP BY.                                  | `SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > 5;` |
| ORDER BY        | Sort the result set by one or more columns.                                                           | `SELECT column1, column2 FROM table_name ORDER BY column1 ASC, column2 DESC;` |
| UNION           | Combine result sets of multiple SELECT statements (removes duplicates).                              | `SELECT column1 FROM table1 UNION SELECT column1 FROM table2;` |
| UNION ALL       | Similar to UNION, but includes duplicate rows.                                                        | `SELECT column1 FROM table1 UNION ALL SELECT column1 FROM table2;` |

I'm new Yaya! Sure, [check this out.](https://www.w3schools.com/sql/sql_syntax.asp)

</details>

## Cruddur Database Create
1. To get started, simply prepare your databse by creating one.

```sql
CREATE database cruddur;
```
2. Inside the psql shell, run `\l` to list DBs.
```bash
List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 cruddur   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
```

<img src="assets/week4/2- localwork/4 create db.png">

To establish the foundational SQL structure the database we require an **SQL file that defines its schema**.

## Design PSQL Schema
While many web frameworks include a `schema.sql` file for the purpose of defining database tables during database creation, Flask, on the other hand, requires the manual creation of this file.

```mermaid
graph TD
    A[Users] -->|1| B[Activities]
    B -->|n| C[Comments]
    B -->|1| D[Tags]
    A -->|1..n| E[Profile]
```

A `schema.sql` file is a script or a set of instructions written in SQL (Structured Query Language) that outlines the structure and organization of a database. In this file, you define the `tables`, their `columns`, data `types`, `constraints`, `relationships`, and other relevant database `elements`.

**Step Zero :** In `backend-flask/db`, create a `schema.sql` file.
- [Step 1 : PostgreSQL UUID](#step-1--postgresql-uuid)
- [Step 2 : Load Intial PSQL Schema](#step-2--load-intial-psql-schema)
- [Step 3 : Expand Dropping Tables](#step-3-expand-dropping-tables)
- [Step 4 : Creating the `users` Table](#step-4-creating-the-users-table)
- [Step 5 : Creating the `activities` Table](#step-5-creating-the-activities-table)
- [Step 6 : Schema Successfully Established](#step-6-schema-successfully-established)
- [Step 7 : RELOAD SQL Schema ](#step-7-reload-sql-schema)


### Step 1 : PostgreSQL UUID
Include the following line within the file to enable the UUID extension for PostgreSQL.
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

We'll use `uuid-ossp` to enable PostgreSQL to generate UUIDs.

|💡      |UUIDs enhances uniqueness and reduces the likelihood of ID collisions when compared to numeric IDs.      |
|---------------|:------------------------|


### Step 2 : Load Intial PSQL Schema

1. **Quit `psql`:** If you have a psql session open, close it by typing the command:
```psql
\q
```
This will exit the current `psql` session.

2. **Load schema.sql**: Navigate to the `backend` folder in your project directory and run the following command:
```bash
psql cruddur < db/schema.sql -h localhost -U postgres
```
- `psql`: This is the **PostgreSQL command line tool** used to interact with the PostgreSQL database server.
- `cruddur`: This is the **name of the database** you want to connect to.
- `< db/schema.sql`: This indicates that you want to input the **contents of the `schema.sql` file** into the `psql` command.
- `-h localhost`: This specifies the **host** (in this case, your local machine).
- `-U postgres`: This specifies the **PostgreSQL username** to use (in this case, "postgres").

3. **Password Prompt:** When you run the command, you'll be prompted to enter the password for the "postgres" user. Enter the correct password associated with the "postgres" user equals `password`.

4. **Terminal Output:** If the schema file is loaded successfully, you'll see output analogous to the one I had:

 ```sql
$ psql cruddur < db/schema.sql -h localhost -U postgres 
 ```

<img src="assets/week4/2- localwork/6 executing extension.png">

This output indicates that the commands in the `schema.sql` have been executed, including creating extension.

### Step 3: Expand Dropping Tables
Start by dropping two tables `public.users` and `public.activities` if they already exist in the database. This ensures that any previous versions of these tables are removed before creating new ones.
```sql
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.activities;
```
The `DROP TABLE IF EXISTS` statement is used to delete the specified table if it exists. The public in `public.users` and `public.activities` indicates the schema where the tables are located.

### Step 4: Creating the `users` Table
Create a new table called `users` in the public schema. This table will store information about users.
```sql
CREATE TABLE public.users (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  display_name text NOT NULL,
  handle text NOT NULL,
  email text NOT NULL,
  cognito_user_id text NOT NULL,
  created_at TIMESTAMP default current_timestamp NOT NULL
);
```
Here's a breakdown of the columns in the users table
- **uuid**: A `UUID` (Universally Unique Identifier) column with a default value generated using `uuid_generate_v4()`. This column is set as the primary key of the table.
- **display_name**: A `text` column that stores the display name of the user. It cannot be `NULL` (i.e., it's a required field).
- **handle**: A `text` column that stores a handle or username for the user. It cannot be `NULL`.
- **email**: A `text` column that stores the email address of the user. It cannot be `NULL`.
- **cognito_user_id**: A `text` column that stores an identifier associated with the user in Amazon Cognito (a service for managing user identities). It cannot be `NULL`.
- **created_at**: A `TIMESTAMP` column that stores the timestamp of when the user record was created. It has a default value of the current timestamp and cannot be `NULL`.

### Step 5: Creating the `activities` Table

Create a table called activities in the public schema. This table will store information about various activities.
```SQL
CREATE TABLE public.activities (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_uuid UUID NOT NULL,
  message text NOT NULL,
  replies_count integer DEFAULT 0,
  reposts_count integer DEFAULT 0,
  likes_count integer DEFAULT 0,
  reply_to_activity_uuid integer,
  expires_at TIMESTAMP,
  created_at TIMESTAMP default current_timestamp NOT NULL
);
```
- **uuid**: A `UUID` column with a default value generated using `uuid_generate_v4()`. This column is set as the primary key of the table.
- **user_uuid**: A `UUID` column that stores the UUID of the user associated with the activity. It cannot be `NULL`.
- **message**: A `text` column that stores the message or content of the activity. It cannot be `NULL`.
- **replies_count**, **reposts_count**, **likes_count**: Integer columns that store the counts of replies, reposts, and likes for the activity, respectively. They have default values of 0.
- **reply_to_activity_uuid**: An `integer` column that stores the ID of the activity to which this activity is a reply. It allows for creating a hierarchical structure of activities.
- **expires_at**: A `TIMESTAMP` column that stores the expiration timestamp of the activity (if applicable).
- **created_at**: A `TIMESTAMP` column that stores the timestamp of when the activity record was created. It has a default value of the current timestamp and cannot be `NULL`.

<img src="assets/week4/2- localwork/31 create table and explicit public for microservice later for efverydomain.png">

The SQL table provided above lacks a comma, which previously took me a while to troubleshoot and resolve. <br>Quite amusing, actually!

### Step 6: Schema Successfully Established
Review your design, Mr. Database Architect, and ensure its alignment with the following structure and adequately meets your business requirements.

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS public.users;
CREATE TABLE public.users (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  display_name text NOT NULL,
  handle text NOT NULL,
  email text NOT NULL,
  cognito_user_id text NOT NULL,
  created_at TIMESTAMP default current_timestamp NOT NULL
);

DROP TABLE IF EXISTS public.activities;
CREATE TABLE public.activities (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_uuid UUID NOT NULL,
  message text NOT NULL,
  replies_count integer DEFAULT 0,
  reposts_count integer DEFAULT 0,
  likes_count integer DEFAULT 0,
  reply_to_activity_uuid integer,
  expires_at TIMESTAMP,
  created_at TIMESTAMP default current_timestamp NOT NULL
);
```

Schema is like the excel file, tables /views are like the sheets in it.

### Step 7: RELOAD SQL Schema 

Once we have successfully refined our schema, it's time to reload it along with the newly created tables for activities and users.

- **Load `schema.sql`**: run the following command again
```bash
psql cruddur < db/schema.sql -h localhost -U postgres
```

 ```
Password for user postgres: 

CREATE EXTENSION 
 ```

- Verify by listing the current relations in your psql using `\dt` 

<img src="assets/week4/2- localwork/41 beautify create.png">

> Do you like the terminal color? [Me too.](#bonus-step-aesthetics-in-bash-scripts)

Now you have the `public.users` and `public.activities` tables ready to store data for your application along the previously loaded extension.


## Simplify Connecting To PSQL
In here, we will allocate PostgreSQL development and production connection URLs to environment variables, simplifying the process of connecting to the specific workspace you require in a more efficient manner.

**Local PostgreSQL**
1. Compose the following code to establish a connection with your database:
```bash
psql "postgresql://postgres:password@localhost:5432/cruddur"
```

2. Export the PostgreSQL connection URL as an environment variable. 
```bash
export CONNECTION_URL="postgresql://postgres:password@localhost:5432/cruddur"
```
This will not only simplify the connection process through the environment variable but also enhance the convenience of utilizing it in our upcoming scripts.

3. Persist the variable for future Gitpod workspaces.

```bash
gp env CONNECTION_URL="postgresql://postgres:password@localhost:5432/cruddur"
```

4. Run the following command to examine the connectivity URL

<img src="assets/week4/2- localwork/8 co url done.png">

```bash
psql $CONNECTION_URL
```

5. Reflect on schema design by running the following command
```psql
\dt
```
```
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | activities | table | postgres
 public | users      | table | postgres
```

**Production PostgreSQL**<br>
Following the approach employed earlier, we will once again incorporate the URL from the RDS instance we established at the outset.

- Set and presist the connection URL for the production RDS DB;

```bash
export PROD_CONNECTION_URL="postgresql://cruddurroot:<password>@<DB_endpoint>:5432/cruddur"

gp env PROD_CONNECTION_URL="postgresql://cruddurroot:<password>@<DB_endpoint>:5432/cruddur"
```

![Asset Not Found. 👇Find Out Why!]()

## Connecting to AWS RDS Instance in Gitpod

Try running the following to connect to prod.
```
psql $PROD_CONNECTION_URL
```
The command will hang indefinitely because the default security group on our RDS instance is configured to allow inbound access exclusively from the security group itself, preventing any external connections.

Get ready for the complete solution.
- [Step 1: Set Environment Variable](#step-1-set-environment-variable)
- [Step 2: Adjust Security Group Inbound Rules](#step-2-adjust-security-group-inbound-rules)
- [Step 3: Test Database Connection](#step-3-test-database-connection)
- [Step 4: Security Group Update](#step-4-security-group-update)
- [Step 5: Automate Security Group Update](#step-5-automate-security-group-update)
- [Step 6: Load Schema to RDS](#step-6-load-schema-to-rds)
- [Step 7: Test Prod Connection and Schema](#step-7-test-prod-connection-and-schema)

### Step 1: Set Environment Variable
In your GitPod environment, i you haven't already, set the `PROD_CONNECTION_URL` environment variable in the following format:
```sh
export PROD_CONNECTION_URL="postgresql://<user>:<password>@<RDS>:5432/<master-db-name>"
gp env PROD_CONNECTION_URL="postgresql://<user>:<password>@<RDS>:5432/<master-db-name>"
```

### Step 2: Adjust Security Group Inbound Rules

1. Connect to your AWS RDS console.
2. Adjust the security group inbound rules to allow Gitpod's IP address to connect to your database.
3. Get the Gitpod IP address using the command:
```sh
GITPOD_IP=$(curl ifconfig.me)
```
4. Add an inbound rule to the RDS security group for the Gitpod IP address (`$GITPOD_IP`).

<img src="assets/week4/5- Establish RDS-Connection/12 overview.png">


### Step 3: Test Database Connection
1. Run the command:
```sh
psql $PROD_CONNECTION_URL
```
2.  Run the `\l` command to list prod databases.

<img src="assets/week4/5- Establish RDS-Connection/27 listing rds db.png">

The existing configuration requires us to manually update the IP address each time.

### Step 4: Security Group Update

1. Set environment variables for the security group and the inbound rule:

```sh
export DB_SG_ID="<security-group-id>"
export DB_SG_RULE_ID="<security-group-rule-id>"

gp env DB_SG_ID="<security-group-id>"
gp env DB_SG_RULE_ID="<security-group-rule-id>"
```
- Use `DB_SG_ID` to refer to the ID of the security group itself.
- Use `DB_SG_RULE_ID` for the unique identifier of the inbound rule we've configured in the security group.

2. Use the following CLI script to update the security group rule with the Gitpod IP address:
```sh
aws ec2 modify-security-group-rules \
    --group-id $DB_SG_ID \
    --security-group-rules "SecurityGroupRuleId=$DB_SG_RULE_ID,SecurityGroupRule={Description=GITPOD,IpProtocol=tcp,FromPort=5432,ToPort=5432,CidrIpv4=$GITPOD_IP/32}"
```
3. Verify it returns the following

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/7 added description ofc.png">

```
{
    "Return": true
}
```
4. Verify the ip is updated in the console

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/4 testing manually changing the inbound ip.png">


### Step 5: Automate Security Group Update
1. Create a file named `rds-update-sg-rule` inside the `/bin` with the following content:
```sh
#! /usr/bin/bash

aws ec2 modify-security-group-rules \
    --group-id $DB_SG_ID \
    --security-group-rules "SecurityGroupRuleId=$DB_SG_RULE_ID,SecurityGroupRule={Description=GITPOD,IpProtocol=tcp,FromPort=5432,ToPort=5432,CidrIpv4=$GITPOD_IP/32}"
```
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/9 making the script and makin it exe the up rds sg rule.png">

2. Make the script executable:
```
chmod u+x rds-update-sg-rule
```
<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/11 applied the script.png">

And now, each time you initiate it, updates are reflected in the console in real-time.

3. Update `.gitpod.yml` to run the script on environment startup part of postgre setup:
```yaml
- name: postgres
  init: |
      # check the file.
  command: |
    export GITPOD_IP=$(curl ifconfig.me)
    source "$THEIA_WORKSPACE_ROOT/backend-flask/bin/rds-update-sg-rule"
```

<img src="assets/week4/5- Establish RDS-Connection/AutomateRDSrules/13 making it a requirement in every init gitpo.png">

### Step 6: Load Schema to RDS
1. Update the Docker Compose connection URL to the production URL in `docker-compose.yml`:
```
CONNECTION_URL: "${PROD_CONNECTION_URL}"
```
2. Run the `db-schema-load` script in production:
```
./backend-flask/bin/db-schema-load prod
```

### Step 7: Test Prod Connection and Schema
1. Update `./bin/db-connect` to include a condition for the 'prod' parameter.
2. Test connectivity to the production database by running the script.
```
./bin/db-connect prod
```
```bash
bin/db-connect prod
running in production
psql (13.10 (Ubuntu 13.10-1.pgdg22.04+1), server 14.6)
WARNING: psql major version 13, server major version 14.
         Some psql features might not work.
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

cruddur=>
```

## Bash Scripts for Database Operations

In this comprehensive instructional guide, we will walk you through the process of setting up a series of bash scripts to manage various database operations, such as creating and dropping databases, loading schemas, and seeding data. 

This week initiates the launch of the much-awaited bin directory's construction. This organized workflow will enhance your efficiency and maintainability while working with databases.

```bash
./bin
├── db-create
├── db-drop
├── db-connect
├── db-sessions
├── db-setup
├── db-seed
├── db-schema-load
└── db-rds-update-sg-rule
```

These scripts will be relocated to bin/db ([Week Seven](week7.md#refactor-bin-directory)), attributed to the implementation of diverse technological scripts in a proactive development approach. 

> Check the [ 🌲Great Bin Directory!](../bin/README.md)

- [Step 1: Organize Script Files](#step-1-organize-script-files)
- [Step 2: Add Shebang and Permissions](#step-2-add-shebang-and-permissions)
- [Step 3: Implement Database Operation Scripts](#step-3-implement-database-operation-scripts)
- [Step 4: Synergizing Scripts for Speed](#step-4-synergizing-scripts-for-speed)
- [Step Bonus: Aesthetics in Bash Scripts](#bonus-step-aesthetics-in-bash-scripts)

### Step 1: Organize Script Files

1. Begin by creating a new directory called bin within your backend project's root directory. This directory will house all your bash scripts related to database operations.
```
mkdir bin
```
2. Inside the bin directory, create the file structure provided.
```sh
touch bin/db-create
touch bin/db-drop
touch bin/db-connect
touch bin/db-sessions
touch bin/db-setup
touch bin/db-seed
touch bin/db-schema-load
touch bin/db-rds-update-sg-rule
```
Benefits of naming scripts without extensions Inlc. **Clear Intent, Portability, File Type Agnostic and looks *n*ice**.

### Step 2: Add Shebang and Permissions
1. For each script file, add the shebang line at the top to indicate that the script should be executed with Bash.
```sh
#! /usr/bin/bash
```
<img src="assets/week4/2- localwork/10 continue with db treate this files as bash scripts.png">

2. Make all the script files executable by running the following command for each file:
```sh
chmod u+x bin/<filename>
```
3. You can apply to all the bin directory in one command to all files:
```sh
chmod -R u+x bin/
```

<img src="assets/week4/2- localwork/13 exec not just for user but all of em incl groups.png">

### Step 3: Implement Database Operation Scripts

1. Develop `db-create` script
```sh
#! /usr/bin/bash

NO_DB_CONNECTION=$(sed 's/\/cruddur//g' <<< "$CONNECTION_URL")
psql $NO_DB_CONNECTION -c "create database cruddur;"
```
- `First`: Uses the `sed` command to extract a modified version of the `CONNECTION_URL`. This modified URL removes the trailing "/cruddur" segment from the connection URL. The modified URL is stored in the `NO_DB_CONNECTION` variable.
- `Second`: Executes the `psql` command to create a new database named "cruddur" using the modified connection URL stored in the `NO_DB_CONNECTION` variable. The `-c` flag specifies a command to be executed within `psql`.

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

For more, refer to the [sed command.](#text-transformation-with-stream-editor)

2. Develop `db-drop` script
```sh
#! /usr/bin/bash

NO_DB_CONNECTION_URL=$(sed 's/\/cruddur//g' <<<"$CONNECTION_URL")
psql $NO_DB_CONNECTION_URL -c "drop database IF EXISTS cruddur;"
```
- `First`: Modify `CONNECTION_URL` to remove "/cruddur" segment, store in `NO_DB_CONNECTION_URL`.
- `Second`: Drop database "cruddur" using modified URL, if exists.

3. Develop `db-connect` script
```sh
#! /usr/bin/bash

if [ "$1" = "prod" ]; then
  echo "using production"
  URL=$PRODUCTION_URL
else
  URL=$CONNECTION_URL
fi

psql $URL
```
   - Determine connection URL based on argument:
     - If argument is "prod," use production URL.
     - Otherwise, use default connection URL.
   - Use the determined URL to connect using `psql`.
```bash
./bin/db-connect
psql (13.10 (Ubuntu 13.10-1.pgdg22.04+1))
Type "help" for help.


cruddur=#
```
4. Develop `db-sessions` script
```sh
#! /usr/bin/bash


if [ "$1" = "prod" ]; then
  echo "using production"
  CONNECTION_URL=$PROD_CONNECTION_URL
else
  CONNECTION_URL=$CONNECTION_URL
fi

NO_DB_URL=$(sed 's/\/cruddur//g' <<<"$CONNECTION_URL")
psql $NO_DB_URL -c "select pid as process_id, \
       usename as user,  \
       datname as db, \
       client_addr, \
       application_name as app,\
       state \
from pg_stat_activity;"
```
- Determine connection URL based on argument:
  - If argument is "prod," use production connection URL.
  - Otherwise, use default connection URL.
- Modify the determined connection URL, store in `NO_DB_URL`.
- Use `psql` to execute a SQL query that retrieves process information from the PostgreSQL `pg_stat_activity` view.

```bash
+-------------+----------+----------+--------------+------+---------+
| Process ID  |   User   |    DB    | Client Addr  | App  |  State  |
+-------------+----------+----------+--------------+------+---------+
|      A      | postgres | postgres | x.y.z.a      | psql | active  |
|      B      | postgres | cruddur  | x.y.z.a      |      | idle    |
+-------------+----------+----------+--------------+------+---------+
```


5. Develop `seed.sql` for the testing data.

```bash
./backend-flask/
│
└── sql/
    └── seed.sql
```
> Take me to [where this worked.](#step-6-verify-and-test)
```SQL
-- this file was manually created

INSERT INTO
    public.users (
        display_name,
        handle,
        cognito_user_id
    )
VALUES  (
        'Yahya Abulhaj',
        'yaya2devops',
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
6. Develop `db-seed` script to seed the above.
```sh
#! /usr/bin/bash

ABS_PATH=$(readlink -f "$0")
DB_PATH=$(dirname $ABS_PATH)
BIN_PATH=$(dirname $DB_PATH)
PROJECT_PATH=$(dirname $BIN_PATH)
BACKEND_FLASK_PATH="$PROJECT_PATH/backend-flask"
seed_path="$BACKEND_FLASK_PATH/db/seed.sql"
echo $seed_path

if [ "$1" = "prod" ]; then
  echo "using production"
  CONNECTION_URL=$PRODUCTION_URL
else
  CONNECTION_URL=$CONNECTION_URL
fi

psql $CONNECTION_URL cruddur < $seed_path
```
- Get script's absolute path, store in `ABS_PATH`.
- Derive script's directory path, store in `DB_PATH`.
- Derive bin directory path, store in `BIN_PATH`.
- Derive project directory path, store in `PROJECT_PATH`.
- Define Flask project path in `BACKEND_FLASK_PATH`.
- Define seed SQL file path in `seed_path`.
- Echo `seed_path` to console.
- Determine connection URL based on provided argument:
  - If `prod,` use production connection URL.
  - Else, use default connection URL.
- Use psql to execute seed SQL file on specified database (cruddur) using determined connection URL.
```sql
./bin/db-seed
== db-seed
db-seed
running in development
INSERT 0 2
INSERT 0 1
```
6. Develop `db-schema-load` script
```sh
#! /usr/bin/bash

ABS_PATH=$(readlink -f "$0")
DB_PATH=$(dirname $ABS_PATH)
BIN_PATH=$(dirname $DB_PATH)
PROJECT_PATH=$(dirname $BIN_PATH)
BACKEND_FLASK_PATH="$PROJECT_PATH/backend-flask"
schema_path="$BACKEND_FLASK_PATH/db/schema.sql"
echo $schema_path

if [ "$1" = "prod" ]; then
  echo "using production"
  CONNECTION_URL=$PRODUCTION_URL
else
  CONNECTION_URL=$CONNECTION_URL
fi


psql $CONNECTION_URL cruddur < $schema_path
```
- Get absolute path as `ABS_PATH`.
- Derive script's directory as `DB_PATH`.
- Define Flask project path as `BACKEND_FLASK_PATH`.
- Determine connection URL based on argument as `CONNECTION_URL`.
- Define schema file path as `schema_path`.
- Echo schema path.
- If argument is "prod," use production URL.
- Use `psql` to apply schema setup using determined URL.

> Refer to the process of [designing the schema for PostgreSQL](#design-psql-schema).

7. Observe `rds-update-sg-rule`, It was used for [this purpose](#step-5-automate-security-group-update).

### Step 4: Synergizing Scripts for Speed

We'll streamline the scripts needed to set up PostgreSQL each time, simplifying the process of configuring psql for future workspaces.

- Develop `db-setup` script
```sh
#! /usr/bin/bash
set -e # stop it if it failed at any stage

ABS_PATH=$(readlink -f "$0")
DB_PATH=$(dirname $ABS_PATH)

source "$DB_PATH/drop"
source "$DB_PATH/create"
source "$DB_PATH/schema-load"
source "$DB_PATH/seed"
python "$DB_PATH/migrate"
python "$DB_PATH/update_cognito_user_ids"
```

This script is designed to automate the process of managing a database. It performs several essential tasks related to the database setup and maintenance.
- `source "$DB_PATH/drop"`: Executes a script to drop an existing database.
- `source "$DB_PATH/create"`: Executes a script to create a new database.
- `source "$DB_PATH/schema-load"`: Executes a script to load the database schema.
- `source "$DB_PATH/seed"`: Executes a script to populate the database with initial data.
- `python "$DB_PATH/migrate"`: Executes a Python script named `migrate` for database migrations.
- `python "$DB_PATH/update_cognito_user_ids"`: Executes a Python script for updating user IDs cognito

### Bonus Step: Aesthetics in Bash Scripts
Incorporating color into Bash scripts is a way to elevate their visual appeal and clarity. Instead of monotonous plain text, you can add vibrancy using colored outputs. 

To achieve this effect, a combination of escape codes and variables is employed.
```sh
CYAN='\033[1;36m'
NO_COLOR='\033[0m'
LABEL="db-schema-load"
printf "${CYAN}== ${LABEL}${NO_COLOR}\n"
```

The above snippet adds color to the scripts using the echo command that uses escape sequences stored in `CYAN` and `NO_COLOR` variables to apply cyan and default colors to text. 

When combined in the printf statement, it creates visually appealing output with `==` in cyan and the label in the default color. 

Here's a table presenting the colors to choose from; 

| Color    | Escape Code   | Example Variable   | Example Usage               |
|:----------|:---------------|:--------------------|:-----------------------------|
| Red      | '\033[1;31m' | RED='\033[1;31m' | printf "${RED}Text\${NO_COLOR}\\n" |
| Green    | '\033[1;32m' | GREEN='\033[1;32m' | printf "${GREEN}Text\${NO_COLOR}\\n" |
| Blue     | '\033[1;34m' | BLUE='\033[1;34m' | printf "${BLUE}Text\${NO_COLOR}\\n" |
| Yellow   | '\033[1;33m' | YELLOW='\033[1;33m' | printf "${YELLOW}Text\${NO_COLOR}\\n" |
| Magenta  | '\033[1;35m' | MAGENTA='\033[1;35m' | printf "${MAGENTA}Text\${NO_COLOR}\\n" |
| Cyan     | '\033[1;36m' | CYAN='\033[1;36m' | printf "${CYAN}Text\${NO_COLOR}\\n" |
| Reset    | '\033[0m'    | NO_COLOR='\033[0m' | Reset color to default     |


1. Enhance the visual appeal of the script**s** within the setup script by applying colors that align with your preferences, such as using red for "drop" and green for "create," and so on.
2. Add this visual to the *setup* script itself
```sh
CYAN='\033[1;36m'
NO_COLOR='\033[0m'
LABEL="sqldb-welcome-setup"
printf "${CYAN}==== ${LABEL}${NO_COLOR}\n"
```
3. Execute the *Setup* script to experience the visual enhancements in action.

<img src="assets/week4/3- psqlquery/8 all at once.png">

## Text Transformation with Stream editor
The `sed` command is a stream editor in Unix that can be used to perform various operations on text files, such as searching, replacing, inserting, and deleting text. 

It is a powerful tool that can be used to automate many text processing tasks.

First, we will start by elucidating the command. Subsequently, we will delve into structured examples, enabling you to ultimately attain the `sed` mastery.
- [`sed` Quickstart](#open-example-for-cats-and-dogs)
- [`sed` Cruddur Use Case](#cruddur-removing-substring-from-database-connection-urls)
- [`sed` For The Real World](#sed-for-the-real-world)

<img src="assets/week4/2- localwork/17 using sed will solve it.png">


The basic syntax of the sed command is as follows:
```sh
sed [options] 'command' [file]
```
- The `options` are optional modifiers that control the behavior of the sed command. 
- The `command` is the actual text processing operation that you want to perform. 
- The `file` is the name of the file that you want to process.

The sed command supports a variety of commands, but some of the most common ones include:
- `s` - Substitute text. This command replaces all instances of a specified text with another text.
- `d` - Delete text. This command deletes all lines that match a specified pattern.
- `i` - Insert text. This command inserts text at the beginning of each line that matches a specified pattern.
- `p` - Print text. This command prints all lines that match a specified pattern.

### Open Example For Cats and Dogs
The following example shows how to use the sed command to replace:
- The word `dog` with the word `cat`;
- The word `lovely` with `funny`;

In a file called `yaya.txt`
```txt
A dog is lovely.
```
This command will read the file `yaya.txt` line by line and replace **all** instances of the word `dog` with the word `cat` and the word funny with lovely
```sh
sed 's/dog/cat/g; s/lovely/funny/g' yaya.txt
```
The output of the sed command will be written to the standard output.
```txt
A cat is funny.
```
### Cruddur Removing Substring from Database Connection URLs
Take our drop script for instance without the shebang.
```sh
# Using sed to remove '/cruddur' from CONNECTION_URL
NO_DB_CONNECTION_URL=$(sed 's/\/cruddur//g' <<< "$CONNECTION_URL")
psql "$NO_DB_CONNECTION_URL" -c "drop database cruddur;"
```
The sed command is used to replace all occurrences of `/cruddur` with an empty string in the `CONNECTION_URL` variable. The modified URL is then used to drop the database named `cruddur` using the psql command.

This example assumes that the `/cruddur` portion of the URL is related to a specific endpoint and is not required for database operations such as dropping or creating databases.

### `sed` For The Real World
This was part of [my great time on Google Cloud](https://www.cloudskillsboost.google/public_profiles/664bbb5a-6ea0-4005-b3cf-817644fa9c0b). I made sure to keep it close, and the time comes to expose it for you, beautifully presented!

Consider you work for a doctor and possess a configuration file that requires customization for client-associated IDs and related information.
```JSON
{
  "VISION_TOPIC": "projects/[PROJECT-ID]/topics/visionapiservice",
  "VIDEOINTELLIGENCE_TOPIC": "projects/[PROJECT-ID]/topics/videointelligenceservice",
  "BIGQUERY_TOPIC": "projects/[PROJECT-ID]/topics/bqinsert",
  "REJECTED_BUCKET": "[FLAGGED_BUCKET_NAME]",
  "RESULT_BUCKET": "[FILTERED_BUCKET_NAME]",
  "DATASET_ID": "[DATASET_ID]",
  "TABLE_NAME": "[TABLE_NAME]",
  "GCS_AUTH_BROWSER_URL_BASE": "https://storage.cloud.google.com/" ,
  "API_Constants": {
        "ADULT" : "adult",
        "VIOLENCE" : "violence",
        "SPOOF" : "spoof",
        "MEDICAL" : "medical"
  }
}
```
Instead of manually changing each ID and making specific modifications, you can efficiently use the `sed` command. 	
```sh
sed -i 's/[PROJECT-ID]/$PROJECT_ID/g' config.json
```
This command tells the sed command to open the file config.json in interactive mode and replace all occurrences of the text [PROJECT-ID] with the value of the environment variable $PROJECT_ID. 

The `-i` flag tells sed to make the changes to the file in place.

The following commands work in a similar way:
```sh
sed -i 's/[FLAGGED_BUCKET_NAME]/$FLAGGED_BUCKET_NAME/g' config.json
sed -i 's/[FILTERED_BUCKET_NAME]/$FILTERED_BUCKET_NAME/g' config.json
sed -i 's/[DATASET_ID]/$DATASET_ID/g' config.json
sed -i 's/[TABLE_NAME]/$TABLE_NAME/g' config.json
```
Assuming you have the following environment variables defined.
- `$PROJECT_ID` with a value like `"yaya-project"`
- `$FLAGGED_BUCKET_NAME` with a value like `"flagged-bucket"`
- `$FILTERED_BUCKET_NAME` with a value like `"filtered-bucket"`
- `$DATASET_ID` with a value like `"yaya-dataset"`
- `$TABLE_NAME` with a value like `"yaya-table"`

After running these commands, the content of `config.json` would be updated as follows:
```JSON
{
  "VISION_TOPIC": "projects/yaya-project/topics/visionapiservice",
  "VIDEOINTELLIGENCE_TOPIC": "projects/yaya-project/topics/videointelligenceservice",
  "BIGQUERY_TOPIC": "projects/yaya-project/topics/bqinsert",
  "REJECTED_BUCKET": "flagged-bucket",
  "RESULT_BUCKET": "filtered-bucket",
  "DATASET_ID": "yaya-dataset",
  "TABLE_NAME": "yaya-table",
  "GCS_AUTH_BROWSER_URL_BASE": "https://storage.cloud.google.com/" ,
  "API_Constants": {
        "ADULT" : "adult",
        "VIOLENCE" : "violence",
        "SPOOF" : "spoof",
        "MEDICAL" : "medical"
  }
}
```
And there you have it, ladies and gentlemen, a compelling use case of the `sed` command.

This process can be further streamlined by scripting these commands into one.

1. Create a file and call it `wo-sed-ho`
```sh
#!/bin/bash

# Replace these with your actual values
PROJECT_ID="your_project_id"
FLAGGED_BUCKET_NAME="your_flagged_bucket"
FILTERED_BUCKET_NAME="your_filtered_bucket"
DATASET_ID="your_dataset_id"
TABLE_NAME="your_table_name"

# Define a function to perform the sed replacement
replace_value() {
    sed -i "s/\[$1\]/$2/g" config.json
}

# Run the sed commands concurrently
replace_value "PROJECT-ID" "$PROJECT_ID" &
replace_value "FLAGGED_BUCKET_NAME" "$FLAGGED_BUCKET_NAME" &
replace_value "FILTERED_BUCKET_NAME" "$FILTERED_BUCKET_NAME" &
replace_value "DATASET_ID" "$DATASET_ID" &
replace_value "TABLE_NAME" "$TABLE_NAME" &

# Wait for all background processes to finish
wait

echo "Yaya Gains You Time. Replaced!"
```

2. Make the file executable
```
chmod u+x wo-sed-ho
```

3. Run the `wo-sed-ho` script
```sh
./bin/wo-sed-ho

Yaya Gains You Time. Replaced!
```
## Implement PostgreSQL Client

Currently, the data we have access to is in a simulated state. In order to retrieve actual information from our database—essentially making a connection between PostgreSQL and Python—we need to develop a PostgreSQL client specifically designed for Python integration using a database pooling.

- [Step 1: Install Required Libraries](#step-1-install-required-libraries)
- [Step 2: Set Environment Variable](#step-2-set-environment-variable)
- [Step 3: Create `db.py` Utility Library](#step-3-create-dbpy-utility-library)
- [Step 4: Integrate `db.py` into Activities](#step-4-integrate-dbpy-into-activities)
- [Step 5: Refactor API Call in home_activities](#step-5-refactor-api-call-in-home_activities)
- [Step 6: Verify and Test](#step-6-verify-and-test)

The following file structure is our target for this implementation:
```sh
./backend-flask
├── db
│   └── seed.sql
├── lib
│   └── db.py
├── services
│   └── home_activities.py
└── requirements.txt
```
### Step 1: Install Required Libraries
1. Add the necessary libraries to your `backend-flask/requirements.txt` file:

```
psycopg[binary]
psycopg[pool]
```

2. Install the libraries using the following command:

<img src="assets/week4/4- Driver and query/1 install psql driver psychopg.png">

```
pip install -r requirements.txt
```

### Step 2: Set Environment Variable
In your `docker-compose.yml` file, set the environment variable for your backend-flask application:

```yaml
CONNECTION_URL: "postgresql://postgres:password@db:5432/cruddur"
```
**Important:** Avoid using a password that ends with the character '!' because this can lead to an issue with the URL structure. The combination of '!' and '@' in the URL might trigger errors when launching certain commands.


### Step 3: Create `db.py` Utility Library

Create a utility library named `db.py` under the `backend-flask/lib`.

- **Purpose:** This file is a utility library that manages interactions with a PostgreSQL database in the Python application.
- **Import:** The `psycopg_pool` library's `ConnectionPool` is imported to handle connection pooling.
- **Import:** The `os` module is imported to access environment variables.

```py
from psycopg_pool import ConnectionPool
import os
```
- **Function `query_wrap_object(template)`:**
  - This function wraps a provided SQL query template in a structure that fetches a single JSON object result.
  - It uses the `row_to_json` function to convert the result row into a JSON object.
  - The `COALESCE` function ensures that an empty JSON object is returned if the result is null.
```py
def query_wrap_object(template):
    sql = f"""
    (SELECT COALESCE(row_to_json(object_row),'{{}}'::json) FROM (
    {template}
    ) object_row);
    """
    return sql
```
- **Function `query_wrap_array(template)`:**
  - This function wraps a provided SQL query template in a structure that fetches a JSON array of rows.
  - It employs `array_to_json` and `array_agg` functions to convert result rows into a JSON array.
  - The `COALESCE` function handles cases where the result is null, returning an empty JSON array.
```py
def query_wrap_array(template):
    sql = f"""
    (SELECT COALESCE(array_to_json(array_agg(row_to_json(array_row))),'[]'::json) FROM (
    {template}
    ) array_row);
    """
    return sql
```
- **Connection URL:**
  - The environment variable `CONNECTION_URL` is fetched using `os.getenv`.
  - This URL is necessary for establishing a connection to the PostgreSQL database.
```py
connection_url = os.getenv("CONNECTION_URL")
pool = ConnectionPool(connection_url)
```

<img src="assets/week4/4- Driver and query/7 andrew way to get json.png">

- **Connection Pool:**
  - The `ConnectionPool` is instantiated using the fetched `CONNECTION_URL`.
  - Connection pooling optimizes database connections for efficiency and performance.


### Step 4: Integrate `db.py` into Activities
1. Import the required functions and objects from `db.py` into your `home_activities`:
```py
from lib.db import pool, query_wrap_array
```
2. Initiate a basic query

<img src="assets/week4/5- Establish RDS-Connection/and the FFF bro.png">

3. Inject the current SQL and examine the user interface.

<img src="assets/week4/4- Driver and query/10 our query data is showing.png">

4. Design the required to retrieve specific columns from two tables: `activities` and `users`.
```SQL
SELECT
  activities.uuid,
  users.display_name,
  users.handle,
  activities.message,
  activities.replies_count,
  activities.reposts_count,
  activities.likes_count,
  activities.reply_to_activity_uuid,
  activities.expires_at,
  activities.created_at
FROM public.activities
LEFT JOIN public.users ON users.uuid = activities.user_uuid
ORDER BY activities.created_at DESC
```
- Columns being retrieved:
  - `activities.uuid`: Unique identifier for each activity.
  - `users.display_name`: Display name of the user associated with the activity.
  - `users.handle`: User's handle or username.
  - `activities.message`: Content or message of the activity.
  - `activities.replies_count`: Number of replies received by the activity.
  - `activities.reposts_count`: Number of times the activity has been reposted.
  - `activities.likes_count`: Number of likes received by the activity.
  - `activities.reply_to_activity_uuid`: UUID of the activity to which this activity is a reply.
  - `activities.expires_at`: Expiry date of the activity.
  - `activities.created_at`: Timestamp of when the activity was created.
- The `LEFT JOIN` operation connects the `users` table with the `activities` table using the UUIDs, linking user information to each activity.
- The results are ordered by the `created_at` timestamp in descending order.

5. Pass it to sql and create multi-line strings with `"""`
```
sql = """
  QUERY GOES HERE
 """
```
- Using triple quotes eliminates the need to escape line breaks or other special characters within the query.

6. Print the SQL to help you up verify the query and debug any issues.
```
print(sql)
```
7. Fetch data from a database, and handling the results. 
```py
span.set_attribute("app.result_length", len(results))
with pool.connection() as conn:
    with conn.cursor() as cur:
        cur.execute(sql)
        json = cur.fetchall()
return json[0]
```
- Sets an attribute related to the length of query results.
- Establishes a connection to the database using a connection pool.
- Creates a cursor to interact with the database.
- Executes the SQL query using the cursor.
- Fetches all results from the executed query.
- Returns the first row of fetched data as a tuple.

This process effectively retrieves data from the database, processes it, and returns a specific data point for further handling or display.

8. Replace the existing code in the `home_activities` script with the code we just created.

```py
sql = """
      SELECT
        activities.uuid,
        users.display_name,
        users.handle,
        activities.message,
        activities.replies_count,
        activities.reposts_count,
        activities.likes_count,
        activities.reply_to_activity_uuid,
        activities.expires_at,
        activities.created_at
      FROM public.activities
      LEFT JOIN public.users ON users.uuid = activities.user_uuid
      ORDER BY activities.created_at DESC
      """
print(sql)
span.set_attribute("app.result_length", len(results))
with pool.connection() as conn:
    with conn.cursor() as cur:
        cur.execute(sql)
        json = cur.fetchall()
return json[0]
```

<img src="assets/week4/4- Driver and query/12 what about from this getting the entire query.png">

Reechoing, the code is responsible for executing the SQL query, fetching data from a PostgreSQL database, and processing the results.

### Step 5: Refactor API Call in home_activities
Refactor the API call in the `home_activities` script to load SQL templates and query data using the functions from `db.py`:

```py
sql = db.load_template('activities', 'home')
params = {}
results = db.query_array_json(sql, params)
return results
```

### Step 6: Verify and Test
After composing your Docker containers, the home page should display activity data from the `db/seed.sql` file instead of mock data.

<img src="assets/week4/seed-yaya.png">

#  A Database of Experiences
This development holds immense significance within our application. We'll ensure the storage of users and activities in a production environment, aligned with our SQL schema design.

![Jk. Get serious—Mark Zuckerberg](assets/week4/your-data-is-ours.png)


## Lambda for Cognito Post Confirmation
Upon user sign-ups , we lay their entry into the users table. To achieve this, we are considering the implementation of an AWS Lambda function that triggers the user sign up process and store it in RDS.

Get your strokes ready; We'll create and employ the following.
```sh
./aws-cloud-project-bootcamp
├── aws
│   ├── lambdas
│   │   └── cruddur-post-confirmation.py
│   └── policies
│       └── LambdaVPCAccessPolicy.json
├── bin
│   ├── db-schema-load prod
│   ├── db-connect prod
└── docker-compose.yml
```
**Step 0 :** Create in `aws/lambdas/` a `cruddur-post-confirmation.py` in your codebase.

- [Step 1: Create Lambda Function](#step-1-create-lambda-function)
- [Step 2: Configure Environment Variables](#step-2-configure-environment-variables)
- [Step 3: Add `Psycopg2` Layer](#step-3-add-psycopg2-layer)
- [Step 4: Connect Lambda to VPC](#step-4-connect-lambda-to-vpc)
- [Step 5: Create Lambda Code](#step-5-create-lambda-code)
- [Step 6: Configure Execution Role Permissions](#step-6-configure-execution-role-permissions)
- [Step 7: Deploy Lambda Function](#step-7-deploy-lambda-function)
- [Step 8: Configure Cognito Trigger](#step-8-configure-cognito-trigger)
- [Step 9: Testing and Verifying](#step-9-testing-and-verifying)
- [Step 10 : Post Verify](#step-10--post-verify)

### Step 1: Create Lambda Function
1. Navigate to the AWS Management Console.
2. Open the Lambda service.
3. Click on "Create function."
4. Choose "Author from scratch."
5. Provide the function name as `cognito-post-confirm-function` and select runtime as "Python 3.8."
6. Keep the default settings for other configurations and click "Create function."

<img src="assets/week4/6- Lambda Time/2- create function.png">

### Step 2: Configure Environment Variables
1. In the Lambda function's configuration, go to the "Environment variables" section.
2. Add a new variable with the key as `CONNECTION_URL` and the value as your `PROD_CONNECTION_URL`.
3. In your `docker-compose.yml` make backend environment as follows:
```
    CONNECTION_URL: "${PROD_CONNECTION_URL}"
```

### Step 3: Add `Psycopg2` Layer
PostgreSQL libraries being unavailable in the AWS Lambda AMI image, it was necessary for us to undertake the compilation of psycopg2 along with the inclusion of the PostgreSQL libpq.
1. In the "Layers" section of the Lambda configuration, click on "Add a layer."
2. Use the ARN of Psycopg2 layer to your Lambda function: 
```sh
arn:aws:lambda:us-east-1:898466741470:layer:psycopg2-py38:2
```

### Step 4: Connect Lambda to VPC

1. Open the Functions page of the Lambda console.
2. Choose a function.
3. Choose Configuration go to Network
4. Under Network, choose Edit.
5. Choose the VPC.<br>
For reference, I used [this link](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html)

<img src="assets/week4/6- Lambda Time/45 re doing the vpc again.png">

### Step 5: Create Lambda Code

Let me break down the magic of this function for you.
1. Start by the import of the Required Modules

```py
import json
import psycopg2
import os
```
Here the necessary modules are imported: `json` for JSON manipulation, `psycopg2` for PostgreSQL database interaction, and `os` for accessing environment variables.

2. Define the Lambda Handler
```py
def lambda_handler(event, context):
```
The `lambda_handler` function is the entry point for the Lambda function. It takes two arguments, `event` (containing input data) and `context` (Lambda runtime information).

3. Extract User Attributes
```py
    user = event["request"]["userAttributes"]
```
Here, the user attributes are extracted from the incoming `event` dictionary.

4. Establish Database Connection

```py
    try:
        conn = psycopg2.connect(os.getenv("CONNECTION_URL"))
        cur = conn.cursor()
```
a connection to the PostgreSQL database is established using the connection URL retrieved from the environment variables. A cursor object is created to execute SQL commands.

5. Prepare SQL Parameters using a Parameters List
```sql
        parameters = [
            user["name"],
            user["email"],
            user["preferred_username"],
            user["sub"],
        ]

        sql = f"INSERT INTO public.users (display_name, email, handle, cognito_user_id) VALUES (%s, %s, %s, %s)"
```
In this part, a list of parameters is created from the extracted user attributes. The SQL command for insertion is prepared using placeholders to avoid SQL injection.

6. Or Assigning Variables Directly
```sql
user_display_name  = user['name']
user_email         = user['email']
user_handle        = user['preferred_username']
user_cognito_id    = user['sub']

sql = f"""
  INSERT INTO public.users(
    display_name,
    email, 
    handle, 
    cognito_user_id)
  VALUES ( %s, %s, %s, %s)
"""
```
Both approaches achieve the same result. <br>
This one provides better readability and allows you to use more descriptive variable names, making the code more self-explanatory. 

7. Execute SQL Command
```py
        cur.execute(sql, *parameters)
```
The SQL command is executed using the cursor, and the parameters are passed in to complete the insertion operation.

8. Commit Changes and Handle Exceptions
```py
        conn.commit()

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
```
The changes are committed to the database. If an exception occurs during the database interaction, the error is printed.

9. Close Database Connection
```py
    finally:
        if conn is not None:
            cur.close()
            conn.close()
            print("Database connection closed.")
```
In the `finally` block, the cursor and connection are closed to ensure proper resource management.

10.  Return Event
```py
    return event
```

The Lambda function concludes by returning the `event` dictionary.

11. After undergoing rigorous development, your function's code now appears as follows:

<img src="assets/week4/6- Lambda Time/7 coding the function.png">

```python
import json
import psycopg2
import os

def lambda_handler(event, context):
    user = event['request']['userAttributes']
    user_display_name  = user['name']
    user_email         = user['email']
    user_handle        = user['preferred_username']
    user_cognito_id    = user['sub']
    
    sql = f"""
      INSERT INTO public.users(
        display_name,
        email, 
        handle, 
        cognito_user_id)
      VALUES ( %s, %s, %s, %s)
    """

    params = [user_display_name, user_email, user_handle, user_cognito_id]
    
    try:
        conn = psycopg2.connect(os.getenv('CONNECTION_URL'))
        cur = conn.cursor()
        cur.execute(sql, *params)
        conn.commit() 

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        
    finally:
        if conn is not None:
            cur.close()
            conn.close()
            print('Database connection closed.')

    return event
```

<img src="assets/week4/6- Lambda Time/11 specify the value.png">

Remember to replace `CONNECTION_URL` with the actual environment variable name that holds your PostgreSQL connection URL.


### Step 6: Configure Execution Role Permissions
1. Create a policy named `LambdaVPCAccessPolicy` in IAM Policies. You can employ this right away.

<img src="assets/week4/6- Lambda Time/37 lets go create ours too.png">

```python
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeNetworkInterfaces"
                ],
                "Resource": "*"
        }]
}
```
<img src="assets/week4/6- Lambda Time/39 lets do it json.png">

2. Attach the `LambdaVPCAccessPolicy` policy to the execution role of your Lambda function.

<img src="assets/week4/6- Lambda Time/40 policy creatted.png">

### Step 7: Deploy Lambda Function
1. In the Lambda function's configuration, click "Deploy" to deploy the code.

<img src="assets/week4/6- Lambda Time/9- console function deploy they mean save lmao.png">

That's what the step about. Deploy your Lambda when It is ready.

### Step 8: Configure Cognito Trigger
1. Open your AWS Cognito User Pool settings.
2. Under the "Triggers" tab, configure a trigger for "Post Confirmation."
3. Go to User Pool Properties.
4. Assign the previously created Lambda function (`cognito-post-confirm-function`) to this trigger.
5. Click Add Lambda Trigger.

<img src="assets/week4/6- Lambda Time/16 setting trigger with lambda.png">


### Step 9: Testing and Verifying
1. Ensure your Docker environment is up using `docker-compose up`.
2. Load the production database schema using `./bin/db-schema-load prod`.

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/14 reload schema.png">

3. Sign up to the Cruddur web app.
4. Connect to the prod DB using `./bin/db-connect prod`
5. Verify that the newly signed-up user is added to the users table using the database command:

```sql
SELECT * FROM users;
```

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/31 new users looking good after cleaning data.png">

```bash
cruddur=> 
-[ RECORD 1 ]---+-------------------------------------
uuid            | UUID1
display_name    | Yahya Abulhaj
handle          | yaya2devops
email           | yah..@..
cognito_user_id | UUID2
created_at      | DATE TIME.ID
```

### Step 10 : Post Verify
We can ensure absolute certainty regarding this process by consulting the CloudWatch logs.
1. Open `CloudWatch`.
2. Navigate to `Log groups`.
3. Select `/aws/lambda/cruddur-post-confirmation`.
4. Review the logs displayed.

<img src="assets/week4/6- Lambda Time/troubleshoot-Lambda/29 perfect again.png">

I *encountered* several errors prior to reaching the above state. <br>You can find more in [this directory.](https://github.com/yaya2devops/aws-cloud-project-bootcamp/tree/main/journal/assets/week4/6-%20Lambda%20Time/troubleshoot-Lambda)

---
*To Be Continued..*
---