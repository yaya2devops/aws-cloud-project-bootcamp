
## Packages w/ Image Processing

| Step | Command | Description |
|------|---------|-------------|
| 1. | `npm init -y` | Create an empty Node.js package file |
| 2. | `npm install sharp` | Install the Sharp library for high-performance image processing |
| 3. | `npm i @aws-sdk/client-s3` | Install the S3 client sub-package for convenient Amazon S3 interaction |


**1.** This will generate a `package.json` that describes your package dependencies in the init states (none).

**2.** Sharp is high-performance Node.js image processing library that provides a simple and efficient API to manipulate pics.



**3.** This is a convenient way to interact with Amazon S3. Retrieve Only what you require instead of installing the entire AWS SDK, install a su b-package. 

More libraries are now supporting this, which can help keep your codebase lean and efficient.

### Script

```bash
/bin/avatar/sharp

#!/bin/bash

cd /workspace/aws-bootcamp-cruddur-2023/aws/lambdas/process-images

# Install dependencies
npm install

# Remove the sharp directory
rm -rf node_modules/sharp

# Install sharp with specific arch, platform, and libc flags
SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install --arch=x64 --platform=linux --libc=glibc sharp
```

#### Automated

```yml
  - name: sharp
    command: |
      source  "$THEIA_WORKSPACE_ROOT/bin/avatar/sharp"
```

**Developer Reference:**
- [Sharp Package](https://sharp.pixelplumbing.com/install#aws-lambda)
- [@aws-sdk/client-s3](https://docs.aws.amazon.com/AWSJavaScriptSDK/v3/latest/clients/client-s3/#aws-sdkclient-s3)
  - From [NPM](https://www.npmjs.com/package/@aws-sdk/client-s3)
- [AWS CDK Toolkit](https://docs.aws.amazon.com/cdk/v2/guide/cli.html)
- [Construct Bucket Class ](https://docs.aws.amazon.com/cdk/api/v2/docs/aws-cdk-lib.aws_s3.Bucket.html)
- [Removal Policy](https://docs.aws.amazon.com/cdk/api/v1/docs/@aws-cdk_core.RemovalPolicy.html)