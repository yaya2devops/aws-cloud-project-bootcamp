# Week 4 — Postgres and RDS

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
13. Monitor creation progress on the RDS Dashboard.
14. Access the database using the provided `endpoint`, `username`, and `password`.


<img src="assets/week4/1-ProdDB/3 anyway bro.png">

```
DB instance created:
Instance ID: `cruddur-db-instance`
Engine: `PostgreSQL`
Instance Class: `db.t3.micro`
...
Status: `Creating`
```

### Creating an RDS Instance in AWS CLI
The preceding clicks were meticulously crafted within a solitary command-line prompt, encompassing all operations within distinct flags with [this synopsis.](https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html)

<img src="assets/week4/1-ProdDB/6 done.png">

- Copy the following CLI command and observe the required areas.

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

- Please await the RDS status to transition to the "Available" stated by the green indicator.

<img src="assets/week4/1-ProdDB/9 overviw rds itruns ontop of ec2.png">

#### Considerations
**5432** is the default port used by PostgreSQL. Many attackers will scan for databases on the default port, so changing it might reduce the number of automated attacks targeting your database.

## PSQL for Everyone

In this segment, I will make every effort to equip you with SQL knowledge. We are going to initiate our local PostgreSQL instance and establish a connection to it.

- Earlier ([Week-1](week1.md#postgresql-container)), we set up psql as a container, and I walked you through the procedure right here.

Now, we will demonstrate how to simply execute that.

1. Run the following command in a terminal:
```
docker compose up
```
2. Connect with the password `password`.
```bash
gitpod /workspace/aws-bootcamp-cruddur-2023 (main) $ psql -Upostgres -h localhost
```

<img src="assets/week4/2- localwork/2 opla we are back.png">

### SQL Maestro Pro

The array of tasks and activities that can be accomplished within the realm of database management is remarkably extensive.
1. To start off, initiate the process by creating your own database, for instance;
```sql
CREATE DATABASE database_name; 
```
2. Discard the database if it's no longer required.
```sql
DROP DATABASE database_name;
```
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

I'm new Yaya! Sure [check this](https://www.w3schools.com/sql/sql_syntax.asp)

</details>


## Cruddur Database Create
1. To get started, simply prepare your databse by creating one.

<img src="assets/week4/2- localwork/4 create db.png">

```sql
CREATE database cruddur;
```
2. Inside the psql shell, run `\l` to list DBs.

<img src="assets/week4/2- localwork/2 opla we are back.png">

```bash
List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 cruddur   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
```
To establish the foundational SQL structure the database we require an SQL file that defines its schema.

### Design PSQL Schema
While many web frameworks include a schema.sql file for the purpose of defining database tables during database creation, Flask, on the other hand, requires the manual creation of this file.

A `schema.sql` file is a script or a set of instructions written in SQL (Structured Query Language) that outlines the structure and organization of a database. In this file, you define the `tables`, their `columns`, data `types`, `constraints`, `relationships`, and other relevant database `elements`.

- In `backend-flask/db`, create a `schema.sql` file.



#### Step 1: Dropping Tables (if they exist)
Start by dropping two tables `public.users` and `public.activities` if they already exist in the database. This ensures that any previous versions of these tables are removed before creating new ones.
```sql
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.activities;
```
The `DROP TABLE IF EXISTS` statement is used to delete the specified table if it exists. The public in `public.users` and `public.activities` indicates the schema where the tables are located.

#### Step 2: Creating the `users` Table
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

#### Step 3: Creating the `activities` Table

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

#### Step 4 : PostgreSQL UUID
Include the following line within the file to enable the UUID extension for PostgreSQL.
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

We'll use `uuid-ossp` to enable PostgreSQL to generate UUIDs.

|💡      |UUIDs enhances uniqueness and reduces the likelihood of ID collisions when compared to numeric IDs.      |
|---------------|:------------------------|

#### Step 5: Schema Successfully Established
Review your design, Mr. Database Architect, and ensure its alignment with the following structure.

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
#### Step 6 : Load PSQL Schema


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

3. **Password Prompt:** When you run the command, you'll be prompted to enter the password for the "postgres" user. Enter the correct password associated with the "postgres" user.

4. **Terminal Output:** If the schema file is loaded successfully, you'll see output analogous to the one I had:

 ```
$ psql cruddur < db/schema.sql -h localhost -U postgres
Password for user postgres: 

CREATE EXTENSION 
 ```

<img src="assets/week4/2- localwork/6 executing extension.png">

This output indicates that the commands in the `schema.sql` have been executed, including creating extension and the tables.

### Simplify Connecting To PSQL
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

**Production PostgreSQL**<br>
Following the approach employed earlier, we will once again incorporate the URL from the RDS instance we established at the outset.

- Set and presist the connection URL for the production RDS DB;

```bash
export PROD_CONNECTION_URL="postgresql://cruddurroot:<password>@<DB_endpoint>:5432/cruddur"

gp env PROD_CONNECTION_URL="postgresql://cruddurroot:<password>@<DB_endpoint>:5432/cruddur"
```

<img src="assets/week4/2- localwork/9 set up prod connection.png">


---
*To Be Continued..*
---