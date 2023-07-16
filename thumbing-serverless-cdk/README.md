

# **Quickstart CDK**

- Write your code
- Check for errors w/ `cdk synth`

**Init AWS CDK running**

```
cdk bootstrap aws://<AWSID>/<AWSREGION>"
```

This command will set up the following resources:
- S3 bucket e.g. `cdk-hnb659fds-assets-<AWSID>-<AWSREGION>`
- CFN Toolkit for CDK e.g. CDKToolkit
- ECR Repo


Before proceeding, make sure to set the environment variable `UPLOADS_BUCKET_NAME` with a unique value, such as `<unique>-cruddur-uploaded-avatars`, using the following commands:



```SH
export UPLOADS_BUCKET_NAME=<unique>-cruddur-uploaded-avatars
gp env UPLOADS_BUCKET_NAME=<unique>-cruddur-uploaded-avatars
```



To provision your application using AWS CDK, perform the following steps:

1. Install the AWS CDK globally by running the command:

```sh
npm install aws-cdk -g
```

2. Initialize a new CDK application with the TypeScript language and synth to check for errors

```sh
cdk init app -language typescript

cdk synth
```

3. Bootstrap the AWS environment by executing the following command:

```sh
cdk bootstrap "aws://<AWSID>/ca-central-1"
```

4. Wait for the S3 bucket named assets.yacrud.me to be available using the AWS CLI command:

```sh
aws s3api wait bucket-exists \
    --bucket assets.yacrud.me
```
5. Generate a CloudFormation template by running the command:

```sh
cdk deploy
```


## Work-related Resource
- [**Developer Guide**](../aws/lambdas/process-images/README.md)
- [**Provision with AWS CDK**](lib/README.md)
- [**AWS CDK Big Dive**](../journal/week8.md)


### Guidelines, SDK — CDK

|               | AWS SDK                                           | AWS CDK                                                    |
|---------------|---------------------------------------------------|------------------------------------------------------------|
| Programming   | Node.js, Java, Python, Ruby, .NET, etc | TypeScript, JavaScript, Python, Java, C#, Go |
| Abstraction   | Low-level API for configuring and managing resources | Higher-level abstraction that allows you to define resources using code |
| Deployment    | Does not provide built-in deployment capabilities   | Provides a deployment framework using AWS CloudFormation    |


> This following is generated as a result of running the TypeScript initialization command.

### Welcome to your CDK TypeScript project

This is a blank project for CDK development with TypeScript.

The `cdk.json` file tells the CDK Toolkit how to execute your app.

## Useful commands

* `npm run build`   compile typescript to js
* `npm run watch`   watch for changes and compile
* `npm run test`    perform the jest unit tests
* `cdk deploy`      deploy this stack to your default AWS account/region
* `cdk diff`        compare deployed stack with current state
* `cdk synth`       emits the synthesized CloudFormation template
