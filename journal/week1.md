# Week 1 — App Containerization 🐳

> Refer to [the Initial version](week1-progress.md).

## Week One Main Tasks

- [Containerize Application](#containerize-application)
    - [Technical Essentials](#technical-essentials)
  - [Before Docker](#before-docker)
  - [After Docker](#after-docker)
    - [Containerize Flask App](#containerize-flask-app)
  - [Continue To Reactjs App](#continue-to-reactjs-app)
- [Open Container Initiative](#open-container-initiative)
    - [Considering Alternatives to Docker?](#considering-alternatives-to-docker)
- [Add notification endpoint and Reactjs page](#add-notification-endpoint-and-reactjs-page)
  - [OpenAPI](#openapi)
    - [Adding OpenAPI endpoint](#adding-openapi-endpoint)
  - [Define Endpoint Flask App](#define-endpoint-flask-app)
  - [Design Reactjs Notifications Webpage](#design-reactjs-notifications-webpage)
- [Container Management and Scaling](#container-management-and-scaling)
- [External CMD Script](#external-cmd-script)
- [Containers on Docker Desktop](#containers-on-docker-desktop)
- [Docker Container on EC2](#docker-container-on-ec2)
- [Flask Health check](#flask-health-check)
- [Multi-Stage Containerization](#multi-stage-containerization)
- [Images On Dockerhub](#cruddur-on-dockerhub)

#  Containerize Application


Containerization has literally revolutionized the software development landscape, enabling developers like yourself to package applications and their dependencies into lightweight and portable containers. 

Docker has emerged as the de facto standard for containerization. The tech follows a client-server architecture and comprises various components that work together seamlessly. 

- **Docker Engine** The core runtime that creates and manages containers.
- **Docker Images** Self-contained snapshots of applications and their dependencies e.g Frontend.
- **Docker Containers** Runnable instances of Docker images that encapsulate the application and its runtime environment.
- **Docker Registry** A centralized repository for storing and sharing Docker images e.g. Dockerhub or ECR.


### Technical Essentials

These are the 2 key components and utilities that you should be familiar with

- `Dockerfile` is a text file that contains instructions for building Docker images. It specifies the base image, adds dependencies, configures the environment, and defines runtime commands.
- `Docker Compose` simplifies managing multi-container applications. With a YAML file, it defines services, their configurations, and relationships between them.

For interacting with containers Docker provides a set of command-line utilities


| Command                  | Description                                               |
|--------------------------|-----------------------------------------------------------|
| `docker build`           | Builds an image from a Dockerfile.                        |
| `docker run`             | Runs a container based on an image.                        |
| `docker stop`            | Stops a running container.                                 |
| `docker ps -a`           | Lists all containers, including stopped ones.              |
| `docker images`          | Lists all available Docker images.                         |
| `docker logs`            | Displays logs of a running container.                      |
| `docker exec`            | Executes a command in container shell.                 |
| `docker-compose arg`      | Starts services with  `up ` and stop with  `down` as **arg**         |


## Before Docker

Say I have a backend application built on Flask.
```sh
-backend-flask
---etc
```


To install its dependencies run it i'll have to do the following everytime.


```sh
cd /workspace/aws-cloud-project-bootcamp/backend-flask
pip3 install -r requirements.txt
export FRONTEND_URL="*"
export BACKEND_URL="*"
python3 -m flask run --host=0.0.0.0 --port=4567
```

<img src="assets/week1/install%20flask.png">

As you can see, we have to explicilty do many of these tasks.


## After Docker


Let's get you going with Docker.

1. Get to a root of directory that you want containerize its project
2. Create a file and call it `Dockerfile`
3. Add this content and follow up
```Dockerfile
FROM <base_image>
RUN <command>
COPY <source> <destination>
WORKDIR <directory>
EXPOSE <port>
```


These instructions collectively define the build process and you can make most Dockerfiles.
- **FROM**: Specifies the base image to use as the starting point.
- **RUN**: Executes a command during the image build process.
- **COPY** or **ADD**: Copies files and directories from the build context into the image.
- **WORKDIR**: Sets the working directory for subsequent instructions.
- **EXPOSE**: Exposes a specific port to allow communication with the container.
- **CMD**: Sets the default command to run when the container starts. 
- **ENV**: Sets environment variables inside the container. 


We created this after some time spent designing to containerize that flask application; 
<br>
let's talk about it below.

```Dockerfile
FROM python:3.10-slim-buster

WORKDIR /backend-flask

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE ${PORT}

ENV PYTHONUNBUFFERED=1

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567", "--debug"]
```


- `FROM python:3.10-slim-buster`: This instruction sets the base image as `python:3.10-slim-buster`, which is a slim version of Python 3.10 based on Debian Buster.
- `WORKDIR /backend-flask`: Sets the working directory inside the container to `/backend-flask`.
- `COPY requirements.txt requirements.txt`: Copies the `requirements.txt` file from the build context into the container's `/backend-flask` directory.
- `RUN pip3 install -r requirements.txt`: Runs the command `pip3 install -r requirements.txt` inside the container to install the Python dependencies specified in the `requirements.txt` file.
- `COPY . .`: Copies the remaining files and directories from the build context into the container's `/backend-flask` directory.
- `EXPOSE ${PORT}`: Exposes the port specified by the `${PORT}` environment variable, allowing communication with the container.
- `ENV PYTHONUNBUFFERED=1`: Sets the `PYTHONUNBUFFERED` environment variable to `1`, which ensures that Python output is not buffered.
- `CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567", "--debug"]`: Sets the default command to run when the container starts. In this case, it runs the Flask application using the `python3 -m flask run` command, specifying the host as `0.0.0.0` and the port as `4567`, with the `--debug` option enabled.



### Containerize Flask App

1. Build the Dockerfile aka the container:

```sh
docker build -t  backend-flask ./backend-flask
```

- `-t backend-flask`: Sets the tag name for the Docker image as "backend-flask".
- `./backend-flask`: Specifies the build context, indicating the location of the Dockerfile and any necessary files or directories required for the build.

2. Run the Dockerfile aka the container
```sh
docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
```
- `--rm`: Automatically removes the container and its file system after it exits.
- `-p 4567:4567`: Maps port 4567 of the host to port 4567 inside the container, allowing external access to the containerized application.
- `-it`: Provides an interactive terminal for the container.
- `-e FRONTEND_URL='*' -e BACKEND_URL='*'`: Sets environment variables inside the container, with values assigned to `FRONTEND_URL` and `BACKEND_URL`.
- `backend-flask`: Specifies the name of the Docker image to run.

<img src="assets/week1/images built list.png">

Better right? it will be even better when we make use of the docker compose.

3.1. You can use the host url to test a backend endpoint from the browser.<br>
http://workspace-url:4567/api/activities/home

<img src="assets/week1/data is here!.png">


3.2 Alternatively, start acting essentially and use curl.


```sh
curl -X GET http://<workspace-url>:4567/api/activities/home -H "Accept: application/json" -H "Content-Type: application/json"
```

It will reply the response from the browser but json in the cli.



## Continue To Reactjs App

Typically, to set up the frontend, we need first to install the Node Package Manager.


```sh
cd frontend-react-js
npm i
```

Once the dependencies are installed, you can run the ReactJS app on port
```sh
npm start -- --port=3000
```

By integrating both the backend and frontend processes, we can now get access to the app.

You probably got the the point of using Docker. It allows us to specify all tasks for each container in a single file, making them implicit.


In our current scenario, we only have two containers. Imagine an entreprise app with µservices architectures where it's common to have around 70 features each have its own container and dependencies.


### Containerize Reactjs

Create Dockerfile for frontend

```Dockerfile
FROM node:16.18

ENV PORT=3000

COPY . /frontend-react-js

WORKDIR /frontend-react-js

RUN npm install

EXPOSE ${PORT}

CMD ["npm", "start"]
```

1. Build the Frontend container

```sh
docker build -t frontend-react-js ./frontend-react-js
```
- `-t frontend-react-js`: Sets the tag name for the Docker image as "frontend-react-js".
- `./frontend-react-js`: Denotes the build context directory containing the Dockerfile and associated resources.  
2. Run Frontend container
```sh
docker run --rm -p 3000:3000 -d frontend-react-js
```

- `--rm`: Automatically removes the container and its file system after it exits.
- `-p 3000:3000`: Maps port 3000 of the host to port 3000 inside the container, enabling access to the containerized application from the host machine.
- `-d`: Runs the container in detached mode, allowing it to run in the background without blocking the terminal.
- `frontend-react-js`: Refers to the name of the Docker image to run.
- check the status of both containers at this point
<img src="assets/week1/WORKS PERFECT.png">

Access the application on `https://3000-workspace-url`.

<img src="assets/week1/APP LIVE.png">

Still time consuming right? [Refer to Container Management and Scaling](#container-management-and-scaling)

# [Open Container Initiative](https://github.com/opencontainers)

![OCI Official Logo](https://opencontainers.org/img/logos/OCI-logo.svg)

The OCI is an open governance structure and specification for container formats and runtime. It was established in 2015 by industry leaders, including Docker, CoreOS with the aim of creating open standards for containerization technologies.


 OCI has developed two main specifications:

- **Image Specification:** This specification defines the format and structure of container images. It specifies the layout and contents of an OCI-compliant container image, including layers, metadata, and configuration.
- **Runtime Specification:** This specification defines the runtime environment for executing OCI-compliant container images. It describes the execution environment, lifecycle management, and interactions between the container runtime and the underlying host system.

Whether you know it or not, It plays a crucial role in driving the evolution of container technologies today and tomorrow providing open standards that promote collaboration, innovation, and choice in the container ecosystem.

### Considering Alternatives to Docker?

If you're considering alternatives to Docker for containerization, worry not! OCI and the runc project have got you covered.

Runc serves as a reference implementation of the OCI runtime specification

It is already natively integrated with tools like Docker. If you consider exploring other tools you may consider deploying it.




You will have first to build runc to make use of it by creating the OCI Bundle and then building your container image following the specification.

> Follow [the project instructions](https://github.com/opencontainers/runc)



# Add notification endpoint and Reactjs page

To implement the notification, We will do the following

- Code a Flask notification endpoint and 
- Build React.js page for users to interact with.
- Document the endpoint using OpenAPI specs

The files that will be affected are listed below.

| Frontend                                        | Backend                                                     |
|-------------------------------------------------|-------------------------------------------------------------|
| `frontend-react-js/src/App.js`                  | `backend-flask/openapi-3.0.yml`                              |
| `frontend-react-js/src/pages/NotificationsFeedPage.js` | `backend-flask/app.py`                                   |
| `frontend-react-js/src/pages/NotificationsFeedPage.css` | `backend-flask/services/notifications_activities.py` |
  


## OpenAPI

OpenAPI, formerly known as Swagger, is a specification that provides a machine-readable format for defining and documenting RESTful APIs. At its core, OpenAPI provides a comprehensive and user-friendly framework for defining APIs by adhering to the OpenAPI specification

Developers can create detailed documentation that precisely outlines the structure, endpoints, request/response formats, and even authentication requirements of their APIs. 


Here's a sample OpenAPI specification template
```YAML
openapi: 3.0.3
info:
  title: Document Your First API
  description: This is a sample OpenAPI specification.
  version: 1.0.0
servers:
  - url: https://api.example.com/v1
    description: Production server
paths:
  /users:
    get:
      summary: Get all users
      description: Retrieves a list of all users.
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'
    post:
      summary: Create a new user
      description: Creates a new user.
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/User'
      responses:
        '201':
          description: User created successfully
components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: integer
          format: int64
          description: User ID
        name:
          type: string
          description: User's name
        email:
          type: string
          format: email
          description: User's email address
```
- `openapi`: Specifies the version of the OpenAPI specification being used. In this case, it's set to version 3.0.3.
- `info`: Provides general information about the API, including its title, description, and version.
- `servers`: Defines the server(s) where the API is hosted. In this example, there is one production server specified with its URL and description.
- `paths`: Contains the API endpoints and their associated operations (e.g., GET, POST) and responses.
  - `/users`: Represents the `/users` endpoint.
    - `get`: Describes the GET operation for retrieving all users. It includes a summary, description, and the expected response.
    - `post`: Describes the POST operation for creating a new user. It specifies a summary, description, the expected request body, and the possible responses.
- `responses`: Defines the possible responses that an API operation can return. In this example, `200` and `201` are the HTTP status codes representing successful responses.
- `components`: Contains reusable components used throughout the specification.
  - `schemas`: Defines data models or schemas used in the API. In this case, there is a `User` schema with properties such as `id`, `name`, and `email`.

This spec  demonstrates the basic structure of an API definition. Let's head over Cruddur API.



### Adding OpenAPI endpoint

To experience the power of OpenAPI in this project open the `openapi-3.0.yml` file and explore its contents. 


1. Start by creating a new path in your OpenAPI specification. 

You can do this by adding the following
```YAML
paths:
  /api/activites/notifications:
```

Once you've created the new path

2.  It's time to edit it to define the behavior of the notification endpoint. For this, I suggest you refer to the OpenAPI [specs](https://spec.openapis.org/oas/v3.1.0).


```yaml
/api/activites/notifications:
    get:
      description: 'Return a feed of activity for all of those that I interact with'
      tags:
        - activities
      parameters: []
      responses:
        '200':
          description: Return an array of activities
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Activity'
```

We defined the path `/api/activities/notifications`, which represents the endpoint for retrieving activity notifications. The `get` keyword indicates that this path supports the HTTP GET method.

- **description**: This field provides a brief description of the endpoint's purpose, which in this case is to return a feed of activity for all the users that the current user follows.
- **tags**: Tags are used to categorize endpoints. In this case, the endpoint is tagged with `activities`.
- **parameters**: This section specifies any parameters required by the endpoint. In the given code snippet, there are no parameters defined ([] empty array).
- **responses**: Here, we define the responses that the endpoint can return. In this case, there is a single response with the status code `200` (indicating a successful response).
  - **description**: This field provides a brief description of the response, stating that it returns an array of activities.
  - **content**: Describes the content type of the response. In this case, it is `application/json`, indicating that the response will be in JSON format.
    - **schema**: Defines the structure of the response data. Here, it specifies that the response is an array (`type: array`) of items that follow the schema defined in `#/components/schemas/Activity`.

<img src="assets/week1/dockerhub/document-notification-api.png">

The provided code is a simplified example of an OpenAPI specification for the `/api/activities/notifications` endpoint, outlining its purpose, parameters, and response structure. Let go code it.

## Define Endpoint Flask App

- Define the endpoint route in `app.py`

```python
@app.route("/api/activities/notifications", methods=['GET'])
def data_notification():
  data = NotificationActivities.run()
  return data, 200
```

- Create a file called `services/notification_activities.py` within the `backend-flask` directory and add the code below.
```python
from datetime import datetime, timedelta, timezone

class NotificationActivities:
  def run():
    now = datetime.now(timezone.utc).astimezone()
    results = [{
      'uuid': '68f126b0-1ceb-4a33-88be-d90fa7109eee',
      'handle':  'Tron',
      'message': 'I am a character in a movie where human gets inside game.',
      'created_at': (now - timedelta(days=2)).isoformat(),
      'expires_at': (now + timedelta(days=5)).isoformat(),
      'likes_count': 5,
      'replies_count': 1,
      'reposts_count': 0,
      'replies': [{
        'uuid': '26e12864-1c26-5c3a-9658-97a10f8fea67',
        'reply_to_activity_uuid': '68f126b0-1ceb-4a33-88be-d90fa7109eee',
        'handle':  'Worf',
        'message': 'This post has no honor!',
        'likes_count': 0,
        'replies_count': 0,
        'reposts_count': 0,
        'created_at': (now - timedelta(days=2)).isoformat()
      }],
    }
    ]
    return results
```

- Incorporate the `notification_activities.py` file into the `app.py` file importing it at the top level.

- Curl the backend with the new endpoint `api/activities/notifications`

```sh
curl -X GET http://<workspace-url>:4567/api/activities/notifications -H "Accept: application/json" -H "Content-Type: application/json"
```
You can also access it via the browser. But you need the curl skills.

<img src="assets/week1/endpoint is back!.png">


## Design Reactjs Notifications Webpage

- Create a `frontend-react-js/src/pages/NotificationsFeedPage.js` and paste the code below
```js
import './NotificationsFeedPage.css';
import React from "react";

import DesktopNavigation  from '../components/DesktopNavigation';
import DesktopSidebar     from '../components/DesktopSidebar';
import ActivityFeed from '../components/ActivityFeed';
import ActivityForm from '../components/ActivityForm';
import ReplyForm from '../components/ReplyForm';

// [TODO] Authenication
import Cookies from 'js-cookie'

export default function NotificationsFeedPage() {
  const [activities, setActivities] = React.useState([]);
  const [popped, setPopped] = React.useState(false);
  const [poppedReply, setPoppedReply] = React.useState(false);
  const [replyActivity, setReplyActivity] = React.useState({});
  const [user, setUser] = React.useState(null);
  const dataFetchedRef = React.useRef(false);

  const loadData = async () => {
    try {
      const backend_url = `${process.env.REACT_APP_BACKEND_URL}/api/activities/notifications`
      const res = await fetch(backend_url, {
        method: "GET"
      });
      let resJson = await res.json();
      if (res.status === 200) {
        setActivities(resJson)
      } else {
        console.log(res)
      }
    } catch (err) {
      console.log(err);
    }
  };

  const checkAuth = async () => {
    console.log('checkAuth')
    // [TODO] Authenication
    if (Cookies.get('user.logged_in')) {
      setUser({
        display_name: Cookies.get('user.name'),
        handle: Cookies.get('user.username')
      })
    }
  };

  React.useEffect(()=>{
    //prevents double call
    if (dataFetchedRef.current) return;
    dataFetchedRef.current = true;

    loadData();
    checkAuth();
  }, [])

  return (
    <article>
      <DesktopNavigation user={user} active={'notifications'} setPopped={setPopped} />
      <div className='content'>
        <ActivityForm  
          popped={popped}
          setPopped={setPopped} 
          setActivities={setActivities} 
        />
        <ReplyForm 
          activity={replyActivity} 
          popped={poppedReply} 
          setPopped={setPoppedReply} 
          setActivities={setActivities} 
          activities={activities} 
        />
        <div className='activity_feed'>
          <div className='activity_feed_heading'>
            <div className='title'>Notifications</div>
          </div>
          <ActivityFeed 
            setReplyActivity={setReplyActivity} 
            setPopped={setPoppedReply} 
            activities={activities} 
          />
        </div>
      </div>
      <DesktopSidebar user={user} />
    </article>
  );
}
```

- Create a `NotificationsFeedPage.css` in the same dir to apply styling
- In the `App.js` file, include the following import statement

```js
import NotificationsFeedPage from './pages/NotificationsFeedPage';
```

- Below where the endpoints are declared add thi following
```jsx
{
  path: "/notifications",
  element: <NotificationsFeedPage />
},
```

<img src="assets/week1/CocoNotif.png">

---


## Container Management and Scaling
Despite Dockerfile being efficient for saving time, as mentioned earlier, running and building each container individually can still be resource-intensive, especially when dealing with large-scale applications. 

The solution to this challenge is Docker Compose.

> Stay tuned.


## [Cruddur on Dockerhub](https://hub.docker.com/u/yaya2devops)



To start the process, you need to build, tag, and push the image to Docker Hub.

```
docker build -t dockerhub-username/cruddur-backend:a-good-tag .
docker push dockerhub-username/cruddur-backend:a-good-tag
```


<img src="assets/week1/dockerhub/backend-build-push-dockerhub.png">

Once done, you can now visit Docker Hub and refer to the existing images that you have uploaded.

<img src="assets/week1/dockerhub/backend-dockerhub-public-view.png">

Same applies to the frontend container, you need to build, tag, and push the image

```
docker build -t dockerhub-username/cruddur-frontend:a-good-tag .
docker push dockerhub-username/cruddur-frontend:latest
```

<img src="assets/week1/dockerhub/built-push-frontend-dockerhub.png">



If you wish to push a newer image, you can follow these steps to ensure your updates are reflected:


```
docker tag my_username/my_image_name:a-good-tag my_username/my_image_name:latest
docker push my_username/my_image_name:latest
```



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

## Docker Container on EC2

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

### **Backend on EC2**

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
      REACT_APP_BACKEND_URL: "http://IP:4567"
    image: yaya2devops/frontend-react-js:1.0
    ports:
      - "3000:3000"
networks: 
  internal-network:
    driver: bridge
    name: cruddur
```

### Flask Health check

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

### Multi-Stage Containerization

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


## Containers on Docker Desktop 

In this scenario, we will use Docker Desktop to execute the containers on a local environment.


<img src="assets/Week3/docker-local/15 containers stats.png">

Once you have successfully executed the Docker Compose, navigate to the localhost address in your web browser to access and examine the app.

<img src="assets/Week3/docker-local/21env is set (this is good )we back to the latest error we had before changing env.png">
