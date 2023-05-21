
**Developer Reference**



- Use this command to create a new `Gemfile`  

```sh
bundle init
```


- Add AWS SDK for S3 to `Gemfile`
```rb
gem "aws-sdk-s3"
```

- Add Ox to `Gemfile`
```rb
gem "ox"
```


-  install the gems specified in your `Gemfile`
```
bundle install
```
> output: Gemfile.lock

- Run the function

```sh
bundle exec ruby function.rb
```

e.g. The Presigned URL
```
https://yaya-cruddur-uploaded-avatars.s3.ca-central-1.amazonaws.com/mock.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAYWWEDIBCSDRAZ3DX%2F20230520%2Fca-central-1%2Fs3%2Faws4_request&X-Amz-Date=20230520T161335Z&X-Amz-Expires=3000&X-Amz-SignedHeaders=host&X-Amz-Signature=34fe90896017e8bc6bdc9fdf7966a2ac84302d3657c9ecd995fedd851f7917e2
```

- Set environment variable
```
export UPLOADED_BUCKET_NAME=""
gp env UPLOADED_BUCKET_NAME=""
```

