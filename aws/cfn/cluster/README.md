## TOML CFN


TeacherSeat [Read Toml files](https://github.com/teacherseat/cfn-toml)

Get ruby to get toml from gem

```
ruby -v

gem list
```

- Install TOML

```
gem install cfn-toml
```

CFN Cluster deploy

```s
$ ./bin/cfn/cluster 
Uploading to cluster/d141671ec91ff17e23e5bc846cf40120.template  9158 / 9158.0  (100.00%)
Waiting for changeset to be created..
Changeset created successfully. Run the following command to review changes:
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:<aws-region>:<aws-id>:changeSet/awscli-cloudformation-package-deploy-1686830223/28623768-e600-420b-b43e-4e0759d54e67
```

> [Refer to the console](../../../journal/assets/week11/cfn-stack/crud-cluster-cfn.png)