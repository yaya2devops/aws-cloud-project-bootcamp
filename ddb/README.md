# Provision DynamoDB Via SAM CFN
| Step     | Description                                    |
| -------- | ---------------------------------------------- |
| [Build](build)    | Build your SAM application.                     |
| [Package](package)  | Package your application and dependencies.      |
| [Deploy](deploy)   | Deploy the application and provision DynamoDB.  |


### DynamoDB CFN Template

- Open the AWS SAM template file `template.yaml`

- Configure and develop the [template](template.yaml) as per your requirements.

The provided will deploy DynamoDB Table and DynamoDB Stream straight to the console.

**PS:** The environnement variables transfer for DynamoDB was executed using this [toml file](config.toml).

## Tom's Obvious, Minimal Language Files

TOML is a config file to read and write to store settings and parameters for our scripts and the actual template.


| **Benefits** | **Usage in IaC** |
|-------------------|------------------|
| Provides a structured and readable way to specify configuration parameters for IaC templates and scripts. | Define variables and values in a separate file for easy modification and reuse of configurations. |
| Enables passing environment variables between the IaC template and accompanying scripts. | Access values specified in TOML files within IaC templates or scripts using the appropriate parser or library. |
| Simplifies the management of configurations in IaC workflows. | Use TOML files to define parameters passed to CloudFormation stacks for dynamic and flexible deployments. |

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
ArtifactBucketName = "codepipeline-cruddur-artifacts"
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


