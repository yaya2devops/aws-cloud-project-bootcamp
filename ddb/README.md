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

## Tom's Obvious, Minimal Language Files

TOML is a config file to read and write to store settings and parameters for our scripts and the actual template.


| **Benefits** | **Usage in IaC** |
|-------------------|------------------|
| Provides a structured and readable way to specify configuration parameters for IaC templates and scripts. | Define variables and values in a separate file for easy modification and reuse of configurations. |
| Enables passing environment variables between the IaC template and accompanying scripts. | Access values specified in TOML files within IaC templates or scripts using the appropriate parser or library. |
| Simplifies the management of configurations in IaC workflows. | Use TOML files to define parameters passed to CloudFormation stacks for dynamic and flexible deployments. |

**PS:** The environnement variables transfer was executed using this [toml file](config.toml).
