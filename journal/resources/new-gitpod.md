
## From Gitpod to Gitpod

This started as my attempt to assist a member of the community [here](../assets/week6-7/4-bin-refacor/Thread/1-discord-env-var-1.png) and [here.](../assets/week6-7/4-bin-refacor/Thread/2-discord-env-var.png)

I wrote this command on like 12 credit on gitpod to get all env var.
```bash
for var in $(printenv); do printf "%s\n" "$var"; done > env_variables.txt 
```

I then took what's required and applied in the new env as shown below.

```bash
export HONEYCOMB_API_KEY=""
gp env HONEYCOMB_API_KEY=""

export AWS_ACCESS_KEY_ID=""
gp env AWS_ACCESS_KEY_ID=""

export AWS_SECRET_ACCESS_KEY=""
gp env AWS_SECRET_ACCESS_KEY=""

export AWS_DEFAULT_REGION="ca-central-1"
gp env AWS_DEFAULT_REGION="ca-central-1"

export AWS_ACCOUNT_ID=""
gp env AWS_ACCOUNT_ID=""

export CONNECTION_URL="postgresql://postgres:password@localhost:5432/cruddur"
gp env CONNECTION_URL="postgresql://postgres:password@localhost:5432/cruddur"

export PRODUCTION_URL="postgresql://root:yayacomputation@cruddur-db-instance.cnhihd0duf8p.ca-central-1.rds.amazonaws.com:5432/cruddur"
gp env PRODUCTION_URL="postgresql://root:yayacomputation@cruddur-db-instance.cnhihd0duf8p.ca-central-1.rds.amazonaws.com:5432/cruddur"

export DB_SG_RULE_ID=""
gp env DB_SG_RULE_ID=""

export DB_SG_ID=""
gp env DB_SG_ID=""
```

I also enjoyed setting this too :

```bash
export AWS_COGNITO_USER_POOL_CLIENT_ID=""
gp env AWS_COGNITO_USER_POOL_CLIENT_ID=""
```

and this for the ip:

```bash
GITPOD_IP=$(curl ifconfig.me)
```

Hope this helps. :blush: