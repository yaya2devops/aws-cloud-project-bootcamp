## CFN  —  Policy As Code


- [Deploy Cluster](cluster-deploy)
- [Deploy Networking](networking-deploy)
- [Deploy Service](service-deploy)

**Rust is required**

```
gitpod /workspace/aws-cloud-project-bootcamp (main) $ rustc --version

rustc 1.68.1 (8460ca823 2023-03-20)
```


- Install cargo if not on [gitpod](../../.gitpod.yml#7)

```
cargo install cfn-guard
```

- Create task Definition Policy under `aws/cfn/task-definition.guard`

- Generate Cloudformation Template
```
cfn-guard rulegen --template <filepath>
```
e.g.
```
cfn-guard rulegen --template aws/cfn/template.yaml
``` 

> Output directed to [`ecs_cluster.guard`](../../aws/cfn/ecs_cluster.guard) 

```sh
-rwxr-xr-x 1 gitpod gitpod 677 May 12 20:52 cluster-deploy
-rwxr--r-- 1 gitpod gitpod 779 May 12 20:52 db-deploy
-rwxr--r-- 1 gitpod gitpod 743 May 12 20:55 ddb-deploy
-rwxr-xr-x 1 gitpod gitpod 594 May 12 20:52 networking-deploy
-rw-r--r-- 1 gitpod gitpod 667 May 12 20:52 README.md
-rwxr-xr-x 1 gitpod gitpod 765 May 12 20:52 service-deploy
```