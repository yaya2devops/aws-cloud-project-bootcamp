
### On-Hold Commits

Check the status of your repository to see which files are committed and which files have uncommitted changes. 
```sh
git status
```


If you have any uncommitted changes that you want to leave for tomorrow, you can stash them.<br>
Stashing allows you to temporarily save your changes without committing them.
```sh
git stash save "Work in progress"
```

When you want to continue working on the stashed changes, you can retrieve them by running the following command:
```sh
git stash apply
```


Check commits before getting pushed:

```sh
git push --dry-run
```

