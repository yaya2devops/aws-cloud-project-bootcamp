## CFN  —  Policy As Code


- Rust is required

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