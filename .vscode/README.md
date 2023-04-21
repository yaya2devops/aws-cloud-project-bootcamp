
## Managing Dependencies Locally

Working on the product frontend and using VS Code, you can automate npm using this task definitions.



- Create a folder in the root of your project called `.vscode`.
- Inside the `.vscode` folder, create a file called `tasks.json`.
- Add the necessary code to tasks.json to define your tasks.

```
.root
--└── .vscode 
-----└── tasks.json
```


- Please note that the following reference is intended for local development. 
- If you're using Gitpod, you can achieve the same effect using `.gitpod`



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



> [.devcontainer](../.devcontainer/README.md) is used for container-specific settings



**Developer Reference:**
- [Tasks in Vscode](https://code.visualstudio.com/docs/editor/tasks#:~:text=Tasks%20in%20VS%20Code%20can,vscode%20folder%20for%20a%20workspace.)
- [Tasks Provider](https://code.visualstudio.com/api/extension-guides/task-provider)
- [Environment Variables](https://code.visualstudio.com/docs/editor/variables-reference)