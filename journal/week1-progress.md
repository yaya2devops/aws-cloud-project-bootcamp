# Week 1 — App Containerization 🐳

<img src="assets/week1/week1.png">


| Objective           | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| **Backend**  | Learn how to use Flask framework to create web applications                 |
| **Docker for 1container**  | Learned how to Dockerize applications using Dockerfile                         |
| **Mutiple Containers**  | Learned how to use Docker Compose to run containers //                   |
| **Problem Solving**  | Learned how to troubleshoot using the debugger and error codes                |


---

## Brief Considerations

This week was jam-packed of learning experiences. 


- I created a `Dockerfiles` and built the Docker containers for both the front end & the backend. 
- I then ran each individually before configuring Docker Compose to run both containers // with `docker-compose up`.
- In the front end, I installed required dependencies and packages, such as `react-scripts`, and made certain that package installations were correctly directory-targeted. 
- In addition, I learned more about React components and patterns, which were relatively simple in comparison to the backend.
- Moving on to the backend with Flask on top of the great Python, I installed some packages and added 'em to the backend directory's gitignore file. 
- I also learned more about APIs & the services features towards a microservice architecture, and `README.IO` proved to be a useful tool for creating API documentation.
- I worked on adding the notification feature to the website. 
- I  installed DynamoDB using AWS CLI and performed additional database operations such as table creation and listing
- I configured Postgres in `.gitpod` along AWS CLI required commands incl. in [journal zero](week0.md), connecting to the database, and performed basic database operations.



---

## Week One Main Tasks
> week two if we started counting from one.

- [Containerize Application](#application-containerization)
- [Document the Notification Flask Endpoint for Notifications](#document-notification-api)
- [React Page for Notifications](#notification-endpoint)  
- [Run DynamoDB Local Container](#dynamo-local)
- [Run Postgres Container](#postgresql-overview)
- [Run the Dockerfile CMD as an external script](#external-cmd-script)
- [Running container on local machine](#docker-desktop)
- [Multi-Stage Docker Build](#multi-stage-containerization)
- [Health check in Docker Compose](#flask-health-check)
- [Push and tag image to DockerHub](#cruddur-imgs-to-dockerhub)
- [Launch Docker Container on EC2](#docker-container-on-ec2)


---
Do you know, i wrote an article about Docker last year? <br>**Click**.

[<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1655984124905/gp-4TqsOT.gif?w=1600&h=840&fit=crop&crop=entropy&auto=format,compress&gif-q=60&format=webm" width="200">](https://blog.yahya-abulhaj.dev/containers-docker-or-what-exactly-is-that)
---






| Prerequisites           | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| **Project**    | Install [Docker ](../.gitpod.yml#L49) extension                                         |
| **Backend**    | Install Flask and its [dependencies](../backend-flask/requirements.txt)                                         |
| **Frontend**    | Install NPM for ReactJS to use react-scripts                                |


### Backend, Install Flask
<img src="assets/week1/install%20flask.png">

### Install Flask Core
<img src="assets/week1/installed%20flask%20core.png">



### Docker Run, Env Variable
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

# Troubleshooting

This didnt work cause i forgot to install npm which itself will require the react scripts required for our front end reactjs application frontend


<img src="assets/week1/troubleshoot before the go.png">




## This command was a game changer
<img src="assets/week1/gamerchanger.png">


# More Troubleshooting


[![Docker Troubleshooting Video!](https://img.youtube.com/vi/QHj7mUYc0LE/0.jpg)](https://www.youtube.com/watch?v=QHj7mUYc0LE&ab_channel=Yahya)


| CONTAINER ID   | IMAGE                                          | COMMAND                  | CREATED          | STATUS                 | PORTS                                       | NAMES                                      |
| -------------- | ---------------------------------------------- | ------------------------ | ---------------- | ---------------------- | ------------------------------------------- | ------------------------------------------ |
| 61ab34832d8a   | aws-cloud-project-bootcamp-frontend-react-js   | "docker-entrypoint.s…"   | 18 minutes ago   | Up 18 minutes          | 0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   | aws-cloud-project-bootcamp-frontend-react-js-1 |
| 3ed9dff36c1e   | aws-cloud-project-bootcamp-backend-flask       | "python3 -m flask ru…"   | 18 minutes ago   | Up 18 minutes          | 0.0.0.0:4567->4567/tcp, :::4567->4567/tcp   | aws-cloud-project-bootcamp-backend-flask-1 |
| 6da1651b38c0   | postgres:13-alpine                             | "docker-entrypoint.s…"   | 4 hours ago      | Up 4 hours (healthy)   | 0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   | aws-cloud-project-bootcamp-db-1             |
| cd062d6c1188   | amazon/dynamodb-local:latest                   | "java -jar DynamoDBL…"   | 4 hours ago      | Up 4 hours             | 0.0.0.0:8000->8000/tcp, :::8000->8000/tcp   | dynamodb-local    |           


## Application Containerization

<img src="assets/week1/WORKS PERFECT.png">


<img src="assets/week1/THE FRONT CONNECTED TO THE BACKEND.png">


# Sign ins

<img src="assets/week1/sign ins.png">


# First CRUDD !
<img src="assets/week1/Crudd.png">


# Notification Feature 

### How i'm starting
<img src="assets/week1/next notifications.png">

READMEDOTIO For APIs 
<img src="assets/week1/OpenAPI, andrew did this page using readmedotio.png">


### A sceenshot me into backend

<img src="assets/week1/backend stuff.png">


## Including the endpoint URL For the notification API

<img src="assets/week1/endpoint URL.png">




#### JSON Pass

<img src="assets/week1/endpoint is back!.png">


### Notification Endpoint




<img src="assets/week1/CocoNotif.png">






### Postgres

Have it in `.gitpod`:

<img src="assets/week1/Postgre/1 postgre installed auto gitpod.png">


After going to DB Explorer and created a connection:

<img src="assets/week1/Postgre/2 connected to server .png">

Connect to postgres:
```
psql --host localhost
```

or our case Connect to postgres with password as pw (Picked it DB Explorer):

```
psql -Upostgres --host localhost
```
<img src="assets/week1/Postgre/3 enter postgre.png">


- This will get you into Postgres

#### Database Ops
to find relations:
```
\d
```


to check tuples on or off:
```
\t
```


to see ID owner and description:

```
\dl
```


to see templates:

```
\l
```

#### PostgreSQL Overview
<img src="assets/week1/Postgre/4 perform postgre.png">


#### Quitting Database

<img src="assets/week1/Postgre/5 quit postgre.png">


### Dynamo Local


AWS check to use for dynamoDB

<img src="assets/week1/1-aws is here.png">

#### Create DB
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


<img src="assets/week1/dynamo work/1 dynamo table created.png">

<img src="assets/week1/dynamo work/2.png">



#### Create an Item
```

aws dynamodb put-item \
    --endpoint-url http://localhost:8000 \
    --table-name Music \
    --item \
        '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}}' \
    --return-consumed-capacity TOTAL  
```



<img src="assets/week1/dynamo work/3 create item.png">



#### list Tables


```
aws dynamodb list-tables --endpoint-url http://localhost:8000
```

<img src="assets/week1/dynamo work/4 list tables.png">



#### Get Records

```
aws dynamodb scan --table-name cruddur_cruds --query "Items" --endpoint-url http://localhost:8000
```

<img src="assets/week1/dynamo work/5 get records.png">



---

**Codespaces**
<img src="assets/Week3/Codespaces/11 cbn codespaces set.png">
> [Cause](week3.md#codespaces-down---moving-to-local)

#### Docker Desktop 

<img src="assets/Week3/docker-local/15 containers stats.png">

**Localhost:**
<img src="assets/Week3/docker-local/21env is set (this is good )we back to the latest error we had before changing env.png">


## Document Notification API

<img src="assets/week1/dockerhub/document-notification-api.png">

### Cruddur Imgs To Dockerhub

**Push & tag images**



- Push to dockerhub
```
docker push yaya2devops/cruddur-frontend:latest
docker push yaya2devops/cruddur-backend:latest
```

**Building and pushing Backend:**

```
docker build -t dockerhub-username/cruddur-backend:a-good-tag .
docker push dockerhub-username/cruddur-backend:a-good-tag
```


<img src="assets/week1/dockerhub/backend-build-push-dockerhub.png">

**The image in Dockerhub w/ Instructions:**
<img src="assets/week1/dockerhub/backend-dockerhub-public-view.png">

**Frontend built and pushed:**
```
docker build -t dockerhub-username/cruddur-frontend:a-good-tag .
docker push dockerhub-username/cruddur-frontend:latest
```

<img src="assets/week1/dockerhub/built-push-frontend-dockerhub.png">

**Managing frontend Image**
<img src="assets/week1/dockerhub/frontend-image-dockerhub.png">


In case you wanted to push a newer image

- Updates

```
docker tag my_username/my_image_name:a-good-tag my_username/my_image_name:latest
docker push my_username/my_image_name:latest
```

Find my images on Dockerhub from [here.](https://hub.docker.com/u/yaya2devops)

### **External CMD Script**

Frontend
```
FROM node:16.18

ENV PORT=3000

COPY . /frontend-react-js
WORKDIR /frontend-react-js
RUN npm install
EXPOSE ${PORT}
CMD ["/bin/bash", "./script.sh"]
```


**The external [script](../frontend-react-js/script.sh)**
```
#!/bin/bash
npm start
```

<img src="assets/week1/dockerhub/dockerfile-external-cmd.png">


For backend, i thought to add ENTRYPOINT. These cannot be overtitten, while we could use cmd but we could change e.g. in this case another script.


I added this `ENTRYPOINT [""]` and directed my `external-script.sh` path

```
FROM python:3.10-slim-buster

WORKDIR /backend-flask

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE ${PORT}

ENV PYTHONUNBUFFERED=1
cd de
ENTRYPOINT ["/backend-flask/external-script.sh"]
```


[`external-script.sh`](../backend-flask/external-script.sh)

```
#!/bin/bash
python3 -m flask run --host=0.0.0.0 --port=${PORT:-4567} --debug
```

### Docker Container on EC2

- Create EC2
  
<img src="assets/week1/EC2/1-config-ec2.png">

- Add key-pair

<img src="assets/week1/EC2/2-config-ec2.png">

- allow ssh and HTTPS from internet



**SSH Using PuTTy**

<img src="assets/week1/EC2/3-ssh-to-ec2.png">

- Add public IP, 
- leave port 22, its standard for ssh
- Expand on SSH -> Auth -> Credentials: Browse your .pem SK and add it
- Click Open, ec2 will open


[Related Lab Helped](https://www.cloudskillsboost.google/focuses/40544?parent=catalog)

<img src="assets/week1/EC2/4-puty-auth.png">


> make sure the you chmod 600 or 400 ur "[rsa-key.pem](assets/week1/EC2/rsa-key.pem)"

**SSH using AWS EC2 Connect**

<img src="assets/week1/EC2/5-ssh-using-aws-connect.png">

- Connect 
- Update yum: `sudo yum update`
- Get git with: `sudo yum install git`
- Clone Project repo
<img src="assets/week1/EC2/6-ec2-git-available.png">


**Install docker**

```
sudo yum install docker
```

##### **Backend on EC2**

- Pulling the image from dockerhb to EC2:

```
sudo docker pull yaya2devops/cruddur-backend:latest
```

<img src="assets/week1/EC2/7-docker-pull-ec2.png">

- Run it

```
sudo docker run -p 4567:4567 yaya2devops/cruddur-backend:latest
```
<img src="assets/week1/EC2/8-docker-run-ec2.png">

Nav to backend using `ec2-public-ip:port/endpoints`


##### **Frontend on EC2**

- Pull frontend Image
- Install Docker Compose
  
##### **Run both on Docker compose**

```yaml
version: "3.8"
services:
  backend-flask:
    environment:
      FRONTEND_URL: "http://IP:3000"
      BACKEND_URL: "http://IP:4567"
    image: yaya2devops/backend-flask:1.0
    ports:
      - "4567:4567"
  frontend-react-js:
    environment:
      REACT_APP_BACKEND_URL: "http://I¨P:4567"
    image: yaya2devops/frontend-react-js:1.0
    ports:
      - "3000:3000"
networks: 
  internal-network:
    driver: bridge
    name: cruddur
```

#### Flask Health check

- Added a new endpoint in `app.py`
```py
@app.route("/api/health-check", methods=["GET"])
def health_check():
    return {'success': True, 'ver': 1}, 200
```
- Config docker compose

```yaml
healthcheck:
  test: curl --fail http://<URL>:4567/api/health || exit 1
  interval: 10s
  timeout: 10s
  start_period: 10s
  retries: 3
```
<img src="assets/week1/dockerhub/backend-health-check.png">

#### Multi-Stage Containerization

- building the application with multistaged dockerfile:
```
gitpod /workspace/aws-cloud-project-bootcamp/backend-flask (main) $ docker build -t backend -f Dockerfile.stage .
[+] Building 33.1s (15/15) FINISHED                                                                                         
 => [internal] load .dockerignore                                                                                      0.0s
 => => transferring context: 44B                                                                                       0.0s
 => [internal] load build definition from Dockerfile.stage                                                             0.0s
 => => transferring dockerfile: 862B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.10-slim-buster                                             0.7s
 => [internal] load build context                                                                                      0.0s
 => => transferring context: 96.01kB                                                                                   0.0s
 => CACHED [build 1/7] FROM docker.io/library/python:3.10-slim-buster@sha256:02874255d484428c9412db98923b387ac73822cb  0.0s
 => CACHED [stage-1 2/4] WORKDIR /backend-flask                                                                        0.0s
 => [build 2/7] RUN apt update                                                                                         2.7s
 => [build 3/7] RUN apt install -y --no-install-recommends     build-essential gcc                                     9.4s
 => [build 4/7] WORKDIR /backend-flask                                                                                 0.0s 
 => [build 5/7] RUN python3 -m venv /backend-flask/venv                                                                4.5s 
 => [build 6/7] COPY requirements.txt .                                                                                0.0s
 => [build 7/7] RUN pip3 install -r requirements.txt                                                                  10.6s
 => [stage-1 3/4] COPY --from=build /backend-flask/venv ./venv                                                         0.6s
 => [stage-1 4/4] COPY . .                                                                                             0.0s
 => exporting to image                                                                                                 3.9s
 => => exporting layers                                                                                                3.9s
 => => writing image sha256:4af2988118c434aea7ecf21dd750de0fec67442e83c35e6f63071c12eaa98cd1                           0.0s
 => => naming to docker.io/library/backend       
 ```

- Make use of our Health check to "check" app running

<img src="assets/week1/dockerhub/docker-multi-stage-test-with-health-check.png">



---

### Concluding

Docker skills was essential throughout the bootcamp period.

This week(s) provided an abundance of invaluable, hands-on learning opportunities. 

🐳I had to go back and accomplish every task because this tool is so amazing🐳




