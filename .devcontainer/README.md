## Developer Guide

Devcontainer and [`.gitpod.yml`](../.gitpod.yml) are both used to define the development environment.


### Comparison Features

| Feature               | Devcontainer                         | Gitpod                             |
|-----------------------|--------------------------------------|-----------------------------------------|
| Defines dev environment | Yes | Yes |
| Runs on local e.g. vscode | Yes | No  |
| Runs in the cloud via **URL** | No | Yes  |
|Extension configuration|Yes|Yes|	
|User management	|Yes|Yes|
### Decontainer Custom Settings

You have complete flexibility to adjust and customize the [`devcontainer.json`](devcontainer.json) file according to your preferences.


Here is mine:


```json
	"settings": {
	  "terminal.integrated.profiles.linux": {
		"bash": {
		  "path": "/usr/bin/bash",
		  "icon": "terminal-bash"
		}
	  },
	  "terminal.integrated.defaultProfile.linux": "bash",
	  "terminal.integrated.fontSize": 20,
	  "editor.fontSize": 20,
	  "workbench.colorTheme": "Default Dark+ Experimental"
	},
```


### Developer Reference

- [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
- [Development Containers](https://containers.dev/)
- [Dev Container CLI](https://code.visualstudio.com/docs/devcontainers/devcontainer-cli)
- [Environment variables](https://code.visualstudio.com/remote/advancedcontainers/environment-variables)
- [Devcontainers SSH keys](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials#_using-ssh-keys)
