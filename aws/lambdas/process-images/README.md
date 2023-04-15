## Developer Guide

|               | AWS SDK                                           | AWS CDK                                                    |
|---------------|---------------------------------------------------|------------------------------------------------------------|
| Programming   | Available in multiple languages (Node.js, Java, Python, Ruby, .NET, etc.) | Limited number of languages (TypeScript, JavaScript, Python, Java, C#, Go) |
| Abstraction   | Low-level API for configuring and managing resources | Higher-level abstraction that allows you to define resources using code |
| Deployment    | Does not provide built-in deployment capabilities   | Provides a deployment framework using AWS CloudFormation    |

**Create an empty Package**

```sh
npm init -y
```


**Sharpen the package file:**
```sh
npm install sharp
```


**Install
```sh
npm i @aws-sdk/client-s3
```




Reference:

- [Sharp Package](https://sharp.pixelplumbing.com/install#aws-lambda)
- [@aws-sdk/client-s3](https://docs.aws.amazon.com/AWSJavaScriptSDK/v3/latest/clients/client-s3/#aws-sdkclient-s3)
  - From [NPM](https://www.npmjs.com/package/@aws-sdk/client-s3)
- [AWS CDK Toolkit](https://docs.aws.amazon.com/cdk/v2/guide/cli.html)