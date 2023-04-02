
## VS Code Dependency Automation

Automate npm on vscode using task definitions for the product frontend dependency.

> In gitpod - we can do this using .gitpod
>
> 
This reference is for local dev.
Create a folder called 

```
.root
--└── .vscode 
-----└── tasks.json
```


**tasks.json:**

```JSON
{
    "version": "2.0.0",
    "tasks": [
        {
            "type": "npm",
            "script": "install",
            "path": "frontend-react-js",
            "group": "build",
            "problemMatcher": [],
            "label": "npm: install - frontend-react-js",
            "detail": "install dependencies from package",
            "presentation": {
                                "reveal": "always",
                                "group": "develop",
                                "panel": "new"
                         },
                "runOptions": {
                                "runOn": "folderOpen"
                        }
        }
        ]
}
```


**Run the task:**

from the command palette or CTRL+SHIFT+P -> Tasks: Run Task -> npm: install - frontend-react-js



> .devcontainer is used for container-specific settings