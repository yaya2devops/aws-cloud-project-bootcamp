
```sh
git update-ref refs/heads/alpha-0.3.0 430d54c56ccb1d98f9e2b9f9237289663413ff97 d0f0150f0d8671497b191585ddc10588c9c2c98f

pick d0f0150 REMAKE V1 — WEEK 2 : 2/4 Products

git rebase --onto 430d54c56ccb1d98f9e2b9f9237289663413ff97^ 430d54c56ccb1d98f9e2b9f9237289663413ff97 -i --rebase-merges


git rebase --onto 430d54c56ccb1d98f9e2b9f9237289663413ff97^ 430d54c56ccb1d98f9e2b9f9237289663413ff97 -i --rebase-merges

git rebase --onto d0f0150f0d8671497b191585ddc10588c9c2c98f^ d0f0150f0d8671497b191585ddc10588c9c2c98f -i --rebase-merges

d0f0150f0d8671497b191585ddc10588c9c2c98f

git push -f origin main

git rebase --abort

git log -1 --oneline

git revert d0f0150f0d8671497b191585ddc10588c9c2c98f

git rebase --onto d0f0150f0d8671497b191585ddc10588c9c2c98f^ d0f0150f0d8671497b191585ddc10588c9c2c98f -i --rebase-merges
```

