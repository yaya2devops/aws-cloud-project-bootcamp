# Week 7 — Solving CORS with a Load Balancer and Custom Domain
- Manage your domain using Route53 via hosted zone
- Create an SSL certificate via ACM
- Setup a record set for naked domain to point to frontend-react-js
- Setup a record set for api subdomain to point to the backend-flask
- Configure CORS to only permit traffic from our domain
- Secure Flask by not running in debug mode
- Implement Refresh Token for Amazon Cognito
- Refactor bin directory to be top level
- Configure task definitions to contain x-ray and turn on Container Insights
- Change Docker Compose to explicitly use a user-defined network
- Create Dockerfile specifically for production use case
- Using ruby generate out env dot files for docker using erb templates
- How to securely host a website on AWS with custom domain


---

```sh
docker network create cruduur-net
```

```sh
cruddur network list
```

```sh
docker network inspect cruddur-net
```