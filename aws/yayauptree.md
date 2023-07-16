```sh
./
├── cfn/
│   ├── cicd/
│   │   ├── config.toml
│   │   ├── nested/
│   │   │   └── codebuild.yaml
│   │   ├── README.md
│   │   └── template.yaml
│   ├── cluster/
│   │   ├── config.toml
│   │   ├── config.toml.sample
│   │   ├── README.md
│   │   └── template.yaml
│   ├── cross-account/
│   │   └── template.yaml
│   ├── db/
│   │   ├── config.toml
│   │   ├── config.toml.sample
│   │   ├── README.md
│   │   └── template.yaml
│   ├── ddb/
│   │   └── README.md
│   ├── ecs_cluster.guard
│   ├── frontend/
│   │   ├── config.toml
│   │   ├── README.md
│   │   └── template.yaml
│   ├── networking/
│   │   ├── config.toml
│   │   ├── config.toml.sample
│   │   ├── README.md
│   │   └── template.yaml
│   ├── README.md
│   ├── service/
│   │   ├── config.toml
│   │   ├── config.toml.sample
│   │   ├── README.md
│   │   └── template.yaml
│   ├── sync/
│   │   ├── config.toml
│   │   └── template.yaml
│   ├── task-definition.guard
│   └── template.yaml
├── json/
│   ├── alarm-config.json
│   ├── budget.json
│   ├── budget-notifications-with-subscribers.json
│   ├── LambdaGetPara.json
│   ├── README.md
│   ├── service-backend-flask.json
│   ├── service-frontend-react-js.json
│   ├── sns-event-bridge.json
│   └── xray.json
├── lambdas/
│   ├── cruddur-messanging-stream.py
│   ├── cruddur-post-confirmation.py
│   ├── ecs/
│   │   ├── README.md
│   │   └── stop-service.py
│   ├── lambda-authorizer/
│   │   ├── index.js
│   │   ├── package.json
│   │   ├── package-lock.json
│   │   └── README.md
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
│   ├── secure-cruddur-post-confirmation.py
│   └── yacrud-upload-avatar/
│       ├── function.rb
│       ├── Gemfile
│       ├── Gemfile.lock
│       ├── jwt.md
│       ├── lore.jpg
│       └── README.md
├── policies/
│   ├── cloudfront-frontend-host-s3-policy.json
│   ├── cross-account/
│   │   ├── bootcamp-policy-one.json
│   │   ├── bootcamp-policy-two.json
│   │   └── bootcamp-policy-zero.json
│   ├── cruddur-stream-policy.json
│   ├── ecs-stop-lambda-policy.json
│   ├── README.md
│   ├── s3-upload-avatar-presigned-url-policy.json
│   ├── service-assume-role-execution-policy.json
│   ├── service-execution-policy.json
│   ├── sync.json
│   ├── sync-trusted-relationship.json
│   └── task-role/
│       ├── cruddur-task-role.json
│       ├── README.md
│       └── ssm-access-policy.json
├── README.md
├── s3/
│   └── cors.json
├── task-definitions/
│   ├── backend-flask.json
│   ├── console/
│   │   └── backend-flask-revision1.json
│   ├── frontend-react-js.json
│   └── README.md
├── terraform/
│   ├── cicd/
│   │   ├── codebuild.tf
│   │   ├── codepipe.tf
│   │   ├── main.tf
│   │   ├── roles.tf
│   │   └── variables.tf
│   ├── cluster/
│   │   ├── alb.tf
│   │   ├── ecs.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── README.md
│   │   ├── tg.tf
│   │   └── variables.tf
│   ├── ddb/
│   │   ├── ddb.tf
│   │   ├── main.tf
│   │   ├── README.md
│   │   ├── stream.tf
│   │   └── variableS.tf
│   ├── fargate/
│   │   ├── backend/
│   │   │   └── main.tf
│   │   ├── frontend/
│   │   │   └── main.tf
│   │   ├── iam.tf
│   │   ├── main.tf
│   │   ├── param.tf
│   │   ├── service.tf
│   │   └── variables.tf
│   ├── network/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── routes.tf
│   │   ├── variables.tf
│   │   └── vpc.tf
│   └── rds/
│       ├── main.tf
│       └── variables.tf
├── yaya_tree.md
└── yayauptree.md

32 directories, 118 files
```
