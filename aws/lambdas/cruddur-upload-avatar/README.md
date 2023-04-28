
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


- Set environment variable
```
export UPLOADED_BUCKET_NAME=""
gp env UPLOADED_BUCKET_NAME=""
```

