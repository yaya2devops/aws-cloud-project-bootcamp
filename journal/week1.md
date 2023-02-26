# Week 1 — App Containerization


#### First of all, I wrote a blog on docker months ago.

Check it!

[<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1655984124905/gp-4TqsOT.gif?w=1600&h=840&fit=crop&crop=entropy&auto=format,compress&gif-q=60&format=webm" width="500">](https://blog.yahya-abulhaj.dev/containers-docker-or-what-exactly-is-that)







### Week objectives:
- work with flask 
- dockerize using dockerfile
- docker-compose for running more than a container //
- troubleshoot using debugger, the error code and everything in between



#### Prereq 
- Docker extension
- Install Flask on top of py
- NPM for reactjs to use react-scripts


## Backend work:
### Install Flask
<img src="assets/week1/install%20flask.png">

### Install Flask Core
<img src="assets/week1/installed%20flask%20core.png">



### Docker Run issue, Env Variable
<img src="assets/week1/docker run didnt work first because we didnt set envi variable.png">

### Logs Troubleshoot

<img src="assets/week1/10- troubleshoot logs .png">


### Server is working
<img src="assets/week1/works server.png">



### building docker image
<img src="assets/week1/building the docker image.png">

### Success Build

<img src="assets/week1/success built.png">



### Docker PS from BASH
<img src="assets/week1/docker ps from bash.png">


### Listing current images
<img src="assets/week1/images built list.png">


### working ports
<img src="assets/week1/port 4567.png">

### Data is here

<img src="assets/week1/data is here!.png">


### Docker Run
<img src="assets/week1/11docker run.png">

<img src="assets/week1/12 docker run the 5th.png">


## Frontend

Front end is honestly easier, same process, the only diff is the docker compose to be able to run both dockers same time and get ur app running and functional with backend.


### NPM required
<img src="assets/week1/frontend npom install.png">


### Building front docker, using the dockerfile ofc
<img src="assets/week1/build docker front.png">

### Some stats of what i have 
<img src="assets/week1/statas.png">

## Result Front Container

<img src="assets/week1/APP LIVE.png">


### The union port issue
You have to shutdown the frontend container since it will be used by docker compose later when running the entire app.
<img src="assets/week1/The everything ports.png">

### Docker compose, using compose up or from terminal
<img src="assets/week1/docker compose to build both containers.png">

## Tons of troubleshooting

This didnt work cause i forgot to install npm which itself will require the react scripts required for our front end reactjs application frontend


<img src="assets/week1/troubleshoot before the go.png">


## This command was a game changer
<img src="assets/week1/gamerchanger.png">



## Docker Compose Success

<img src="assets/week1/WORKS PERFECT.png">

## I'm there! Welcome To the App

<img src="assets/week1/THE FRONT CONNECTED TO THE BACKEND.png">


# Sign ins

<img src="assets/week1/sign ins.png">


# First CRUDD !
<img src="assets/week1/Crudd.png">


# Notification Feature 

### How i'm starting
<img src="assets/week1/next notifications.png">

Document your api usage ok nice
<img src="assets/week1/OpenAPI, andrew did this page using readmedotio.png">


### A sceenshot me into backend

<img src="assets/week1/backend stuff.png">


## Including the endpoint URL For the notification API

<img src="assets/week1/endpoint URL.png">


# Troubleshoot Space

| CONTAINER ID   | IMAGE                                          | COMMAND                  | CREATED          | STATUS                 | PORTS                                       | NAMES                                      |
| -------------- | ---------------------------------------------- | ------------------------ | ---------------- | ---------------------- | ------------------------------------------- | ------------------------------------------ |
| 61ab34832d8a   | aws-cloud-project-bootcamp-frontend-react-js   | "docker-entrypoint.s…"   | 18 minutes ago   | Up 18 minutes          | 0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   | aws-cloud-project-bootcamp-frontend-react-js-1 |
| 3ed9dff36c1e   | aws-cloud-project-bootcamp-backend-flask       | "python3 -m flask ru…"   | 18 minutes ago   | Up 18 minutes          | 0.0.0.0:4567->4567/tcp, :::4567->4567/tcp   | aws-cloud-project-bootcamp-backend-flask-1 |
| 6da1651b38c0   | postgres:13-alpine                             | "docker-entrypoint.s…"   | 4 hours ago      | Up 4 hours (healthy)   | 0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   | aws-cloud-project-bootcamp-db-1             |
| cd062d6c1188   | amazon/dynamodb-local:latest                   | "java -jar DynamoDBL…"   | 4 hours ago      | Up 4 hours             | 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp   | dynamodb-local                             |


> Include the asset here.

## Checking it, works JSON

<img src="assets/week1/endpoint is back!.png">


## UI NOTIF EFFECTS




<img src="assets/week1/CocoNotif.png">



# Dynamo Local


AWS check to use for dynamoDB

<img src="assets/week1/1-aws is here.png">

## Create DB
```
aws dynamodb create-table \
    --endpoint-url http://localhost:8000 \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    --table-class STANDARD
```

## Create an Item

```

aws dynamodb put-item \
    --endpoint-url http://localhost:8000 \
    --table-name Music \
    --item \
        '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}}' \
    --return-consumed-capacity TOTAL  
```


## list Tables
```
aws dynamodb list-tables --endpoint-url http://localhost:8000
```


## Get Records

```
aws dynamodb scan --table-name cruddur_cruds --query "Items" --endpoint-url http://localhost:8000
```




