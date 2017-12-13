
## Bugfix Branch

*Branches from:*

* `release_stage`

*Merges into:*

* `release_stage` and propagated to future branches

*Branch naming convention:*

`MTP-1234_release_prod`

![MindTouch GitFlow Bugfix Branches](assets/mindtouch-gitflow-bugfix-branches.001.png)

- Checkout new branch from `release_stage` branch
- Make changes, commit
- Create Pull Request from `MTSOPS-1234_release_stage` to `release_stage`
- Merge when PR is approved and Codeship status checks are complete
- After bugfix is merged, the `release_stage` branch should be merged back to the `release_test` and subsequent branches
- Deploys to the staging environment



## Hotfix Branch

*Branches from:*

* `release_prod`

*Merges into:*

* `release_prod` and propagated to `master` then future branches

*Branch naming convention:*

* `MTP-1234_release_prod`

![MindTouch GitFlow Hotfix Branches](assets/mindtouch-gitflow-hotfix-branches.001.png)

### Creating the hotfix branch

- Create a hotfix branch from `release_prod`
- Make code changes, add, commit

### Finishing a hotfix branch

- Create a PR from `MTP-1234_release_prod` to `release_prod`
- Merge hotfix from `release_prod` to `master`
- Merge hotfix from `master` to `release_stage`
