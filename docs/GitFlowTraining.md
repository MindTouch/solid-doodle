
Remote Repo Configuration
=========================

Change remote to upstream
```
git remote rm origin
git remote add upstream git@github.com:MindTouch/solid-doodle.git
```

> QUESTION: should we keep the default origin? http://nvie.com/posts/a-successful-git-branching-model/#decentralized-but-centralized


The Main Branch
===============

The central repo holds one main branch with an infinite lifetime:

`master`

origin/master to be the main branch where the source code of HEAD always reflects a production-ready state.


Supporting Branches
===================

these branches always have a limited life time, since they will be removed eventually.

- Feature branches
- Release branches
- Hotfix branches
- Bugfix branches

## Feature branches

May branch off from:
```
`release_test` or future branches
```
Must merge back into:
```
`release_test` or future branches
```
Branch naming convention:
```
anything except `master` or `release_YYYYMMDD`
```

### Creating a feature branch
When starting work on a new feature, branch off from the `release_test` branch.

```
git fetch upstream
git checkout -b MTP-1234_release_test release_test
```

### Incorporating a finished feature on `release_test`
Finished features may be merged into the `release_test` branch to definitely add them to the upcoming release:

- Make some code changes, commit
```
git add <files>
git commit -m "gitflow commit feature"
```

- Pull `release_test` branch into feature, fix any conflicts (if any), commit
```
git merge upstream/release_test
git push upstream MTP-1234_release_test
```

- Make a pull request against a `release_test` branch
	- complete the form with the ticket number and summary of changes
	- request a reviewer
	- submit

- Codeship is run against the merge pull request and will not allow a merge until build is successful.

### After Feature Completed Merge

- After a commit is merged into `release_test` it will automatically propagate to the future release branches.

## Release Branches

May branch off from:
```
the previous release branch
```
Must merge back into:
```
future branches
```
Branch naming convention:
```
`release_YYYYMMDD`
```

### Creating a release branch

- Bob will automatically create and protect release branches from the previous release branch branch

### Finishing a release branch

- On release day:
    - Release from 2 weeks ago is archived
    - Keep the previous release
    - `release_stage` branch becomes the new `release_prod` branch
    - `release_next_test` is created from `release_test`

## Bugfixes Branches (Pre-release)

Any bugfixes for a feature in `release_stage` should be merged back into the `release_stage`.

- Checkout new branch from `release_stage` branch
- Make changes, commit
- Create Pull Request from `MTSOPS-1234_release_stage` to `release_stage`
- Merge when PR is approved and Codeship status checks are complete
- After bugfix is merged, the `release_stage` branch should be merged back to the `release_test` and subsequent branches
- Deploys to the staging environment

## Production Branch

May branch off from:
`release_stage`
Must merge back into:
`master`

- `release_prod` was created from the `release_stage` branch
- Merge `release_prod` to `master`

## Hotfix

May branch off from:
```
`release_prod`
```
Must merge back into:
```
`master` and `release_stage`
```
Branch naming convention:
```
`MTP-1234_release_prod`
```

### Creating the hotfix branch

- Create a hotfix branch from `release_prod`
- Make code changes, add, commit

### Finishing a hotfix branch

- Create a PR from `MTP-1234_release_prod` to `release_prod`
- Merge hotfix from `release_prod` to `master`
- Merge hotfix from `master` to `release_stage`
