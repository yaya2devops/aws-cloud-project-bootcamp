
### Production


```sh
export ECR_PYTHON_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/cruddur-python"
export ECR_BACKEND_FLASK_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/backend-flask"
```


**Python:**

```sh
docker pull python:3.10-slim-buster
docker tag python:3.10-slim-buster $ECR_PYTHON_URL:3.10-slim-buster
docker push $ECR_PYTHON_URL:3.10-slim-buster
```

**Backend:**

```sh
cd backend
docker build -t backend-flask .
docker tag backend-flask:latest $ECR_BACKEND_FLASK_URL:latest
docker push $ECR_BACKEND_FLASK_URL:latest
```


### Local
**Install python version**
```sh
pyenv install 3.10.9
```

**Set your python version**
```sh
pyenv global 3.10.9
```

**Create virual environment**
```sh
python -m venv venv
```

**Activate environment**
```sh
source venv/bin/activate
```

***Install Flask**
```sh
pip install flask
```