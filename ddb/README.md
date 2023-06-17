# Provision DynamoDB Via SAM CFN
SAM templates were chosen over CloudFormation for provisioning DynamoDB mainly because
- Higher-level abstraction designed for serverless applications.
- Simplified packaging and deployment capabilities.
- The streamlined template syntax.


![DyanmoDB SAM](../journal/assets/week11/big-bundle/3-Yacrud_%20AWS%20DynamoDB.svg)

SAM templates provide a clear and focused representation of the required resources.


| Step     | Description                                    |
| --------: | ---------------------------------------------- |
| [`Build`](#building)  | Build your SAM application.                     |
| [`Package`](#package)  | Package your application and dependencies.      |
| [`Deploy`](#deploy)   | Deploy the application and provision DynamoDB.  |

> [Related Commit](https://github.com/yaya2devops/aws-cloud-project-bootcamp/commit/548ccadb38cba2752e305f3a19202387d30f8fdb)

### DynamoDB CFN Template

- Open the AWS SAM template file `template.yaml`

- Configure and develop the [template](template.yaml) as per your requirements.

The provided will deploy DynamoDB Table and DynamoDB Stream straight to the console.

#### **Building**

```yaml
$ ./ddb/build 
/workspace/aws-cloud-project-bootcamp/ddb/template.yaml is a valid SAM Template. This is according to basic SAM Validation, for additional validation, please run with "--lint" option
== build
Starting Build inside a container                                                                                                       
Building codeuri: cruddur-messaging-stream runtime: python3.9 metadata: {} architecture: x86_64 functions: ProcessDynamoDBStream        

Fetching public.ecr.aws/sam/build-python3.9:latest-x86_64 Docker container image.............................................................................................................................................................................................................................................................................................................................................
Mounting /workspace/aws-cloud-project-bootcamp/ddb/cruddur-messaging-stream/cruddur-messaging-stream as /tmp/samcli/source:ro,delegated,
inside runtime container                                                                                                                

Build Succeeded
```

#### **Package**

```sh
$ ./ddb/package 
== package
        Uploading to ddb/d41d8cd98f00b204e9800998ecf8427e  22 / 22  (100.00%)

Successfully packaged artifacts and wrote output template to file /workspace/aws-cloud-project-bootcamp/.aws-sam/build/packaged.yaml.
Execute the following command to deploy the packaged template
sam deploy --template-file /workspace/aws-cloud-project-bootcamp/.aws-sam/build/packaged.yaml --stack-name <YOUR STACK NAME>
```

**PS:** The environnement variables transfer was executed using this [toml file](config.toml).


#### **Deploy**

| Operation | LogicalResourceId                | ResourceType                   | Replacement |
|-----------|---------------------------------|--------------------------------|--------------|
| + Add     | DynamoDBTable                   | AWS::DynamoDB::Table           | N/A          |
| + Add     | ExecutionRole                   | AWS::IAM::Role                 | N/A          |
| + Add     | LambdaLogGroup                  | AWS::Logs::LogGroup            | N/A          |
| + Add     | LambdaLogStream                 | AWS::Logs::LogStream           | N/A          |
| + Add     | ProcessDynamoDBStreamStream     | AWS::Lambda::EventSourceMapping| N/A          |
| + Add     | ProcessDynamoDBStream           | AWS::Lambda::Function          | N/A          |

Changeset created successfully. 
```
arn:aws:cloudformation:<REGION>:<AWS-ID>:changeSet/samcli-deploy1685219291/550c1528-974d-4709-8c6a-f769fb05444f
```


## Tom's Obvious, Minimal Language Files

TOML is a config file to read and write to store settings and parameters for our scripts and the actual template.


| **Benefits** | **Usage in IaC** |
|-------------------|------------------|
| Provides a structured and readable way to specify configuration parameters for IaC templates and scripts. | Define variables and values in a separate file for easy modification and reuse of configurations. |
| Enables passing environment variables between the IaC template and accompanying scripts. | Access values specified in TOML files within IaC templates or scripts using the appropriate parser or library. |
| Simplifies the management of configurations in IaC workflows. | Use TOML files to define parameters passed to CloudFormation stacks for dynamic and flexible deployments. |

<details>
<summary>
Who is Tom?
</summary>
Tom Preston-Werner is the creator of Jekyll and the founder ex-CEO of GitHub
</details>

## Working with TOML
Get to work seamlessly reference the specified environment variable in your code.

1. Sample CloudFormation artifact store :
```yaml
      ArtifactStore:
        Location: "codepipeline-yacrud-artifacts"
        Type: S3
```


2. Specify the environment variable in TOML:


```toml
[parameters]
ArtifactBucketName = "codepipeline-yacrud-artifacts"
```


3. Reference the environment variable in your infra as code:
```yaml
      ArtifactStore:
        Location: !Ref ArtifactBucketName
        Type: S3
```

The instructions provided above are part of a CI/CD CloudFormation deployment process, which includes the following components:

- [CFN Template](../aws/cfn/cicd/template.yaml): This template contains the necessary configurations for the CI/CD deployment.

- [TOML file](../aws/cfn/cicd/config.toml): This file includes specific settings and parameters required for the CI/CD process shipped to the console.


