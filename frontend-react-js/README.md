
### Production

[sign-in](../bin/ecr/sign-in)

```sh
export ECR_FRONTEND_REACT_URL="598485450821.dkr.ecr.canada-central-1.amazonaws.com/frontend-react-js"
```


**NGINX conf**
Run single build process as container

```sh
cd frontend
npm run build
```


**Create repo in ECR:**

```sh
aws ecr create-repository \
  --repository-name frontend-react-js \
  --image-tag-mutability MUTABLE
```


**Build img:**

```sh
docker build \
--build-arg REACT_APP_BACKEND_URL="http://cruddur-alb-1019408750.ca-central-1.elb.amazonaws.com:4567" \
--build-arg REACT_APP_AWS_PROJECT_REGION="$AWS_DEFAULT_REGION" \
--build-arg REACT_APP_AWS_COGNITO_REGION="$AWS_DEFAULT_REGION" \
--build-arg REACT_APP_AWS_USER_POOLS_ID="ca-central-1_RT6uZ6IkV" \
--build-arg REACT_APP_CLIENT_ID="5il3116qm0rh3ropspnirktnls" \
-t frontend-react-js \
-f Dockerfile.prod \
.
```

**Tag img**
```sh
docker tag frontend-react-js:latest $ECR_FRONTEND_REACT_URL:latest
```


**Push Image**
```sh
docker push $ECR_FRONTEND_REACT_URL:latest
```


### Local

**Containers Build**

```sh
docker build -t frontend-react ./frontend-react-js
```

**Containers Run**

```sh
docker run --rm -p 3000:3000 -it frontend-react

```

```sh
docker run --rm -p 3000:3000 -it frontend-react-js 
```


### Supplementary 

**Containers Show**

```sh
docker ps
```

**Container Stop**

```sh
docker stop <id>
```

**Docker Logs**

```sh
docker logs aws-cloud-project-bootcamp-frontend-react-js-1
```
