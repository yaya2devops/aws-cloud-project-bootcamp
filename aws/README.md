## AWS Guidebook

This project contains all code and resources related to AWS console applied during the bootcamp period.

| Main Focus       | Description                                              |
|------------------|----------------------------------------------------------|
| [JSON](json/README.md)             | contain configurations for the AWS Console used in CLI                     |
| [AWS Lambda](lambdas/README.md)        | Functions related to application development             |
| [Policies](policies/README.md)          | Mainly used to grant permissions to specific AWS services                     |
| [Task Definitions](task-definitions/README.md)  | Configuration used to run a Docker container in Amazon ECS, Fargate. |



```sh
./
├── directory_tree.md
├── json/
│   ├── alarm-config.json
│   ├── budget.json
│   ├── budget-notifications-with-subscribers.json
│   ├── README.md
│   ├── service-backend-flask.json
│   ├── service-frontend-react-js.json
│   └── xray.json
├── lambdas/
│   ├── cruddur-messanging-stream.py
│   ├── cruddur-post-confirmation.py
│   ├── ecs/
│   │   ├── README.md
│   │   └── stop-service.py
│   ├── outdate-post-confirm.py
│   ├── process-images/
│   │   ├── example.json
│   │   ├── index.js
│   │   ├── package.json
│   │   ├── package-lock.json
│   │   ├── README.md
│   │   ├── s3-image-processing.js
│   │   └── test.js
│   ├── README.md
│   └── secure-cruddur-post-confirmation.py
├── policies/
│   ├── cruddur-stream-policy.json
│   ├── ecs-stop-lambda-policy.json
│   ├── README.md
│   ├── service-assume-role-execution-policy.json
│   ├── service-execution-policy.json
│   └── task-role/
│       ├── cruddur-task-role.json
│       ├── README.md
│       └── ssm-access-policy.json
└── task-definitions/
    ├── backend-flask.json
    ├── console/
    │   └── backend-flask-revision1.json
    ├── frontend-react-js.json
    └── README.md

8 directories, 34 files
```


What do you think of the tree displayed above? <br>
Do you find it helpful and informative?
If so, [get in here.](yaya_tree.md)