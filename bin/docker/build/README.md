
## The absolute path - Didactic purpose
> the workload is migrated to `bin/frontend` and `bin/backend` directories

**Command:**

```sh
path=$(readlink -f $0)
echo $path
```

**Output:**
```sh
/home/user/test.sh
```

## Extract directory portion of path

**Command:**

```sh
path="/home/user/YAYA-WORK/id.ea"

dir=$(dirname $path)

parent_dir=$(dirname $dir)
```


**Output 1:**

```sh
echo $dir
```

```sh
/home/user/YAYA-WORK
```

**Output 2:**
```sh
echo $parent_dir
```

```sh
/home/user
```

## Experimental 

<img src="path-play.png">

## PoC Implementation:

- [`bin/docker/build/frontend-react-js`](../../frontend/build) 
- [`bin/docker/build/backend-flask-prod`](../../backend/build) 
- [`bin/db/schema-load`](../../db/schema-load) 
- [`bin/db/seed`](../../db/seed) 
- [`bin/db/setup`](../../db/setup) 
