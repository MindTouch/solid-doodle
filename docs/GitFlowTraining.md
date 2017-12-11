
Remote Repo Configuration
=========================

Change remote to upstream
```
git remote rm origin
git remote add upstream git@github.com:MindTouch/solid-doodle.git
```

> QUESTION: should we keep the default origin? http://nvie.com/posts/a-successful-git-branching-model/#decentralized-but-centralized


The Main Branches
=================

The central repo holds two main branches with an infinite lifetime:

master
develop

origin/master to be the main branch where the source code of HEAD always reflects a production-ready state.

origin/develop to be the main branch where the source code of HEAD always reflects a state with the latest delivered development changes for the next release.

changes merged back into master, is considered a new production release



Supporting Branches
===================

these branches always have a limited life time, since they will be removed eventually.

Feature branches
Release branches
Hotfix branches


## Feature branches

May branch off from:
develop
Must merge back into:
develop
Branch naming convention:
anything except master, develop, release-*, or hotfix-*


### Creating a feature branch
When starting work on a new feature, branch off from the develop branch.

```
git fetch upstream
git checkout -b feature-branch-<yourname> develop
```

> NOTE: `<yourname>` is ONLY for this example)

> TODO: change the default branch in GitHub to `develop`

### Incorporating a finished feature on develop
Finished features may be merged into the develop branch to definitely add them to the upcoming release:

- Make some code changes, commit
```
git add <files>
git commit -m "gitflow commit feature"
```

- Pull `develop` branch into feature, fix any conflicts (if any), commit
```
git merge upstream/develop
git push upstream feature-branch-<yourname>
```

- Make a pull request against a `develop` branch
	- complete the form with the ticket number and summary of changes
	- request a reviewer
	- submit

	> QUESTION: (with the --no-ff) http://nvie.com/posts/a-successful-git-branching-model/#incorporating-a-finished-feature-on-develop

	> TODO: bob will not like the PR branch names b/c it will look for `release_YYYYMMDD`


### After Feature Completed Merge

> QUESTION: After a commit is merged into `develop`, should the following automatically happen:

> 1) `develop` should be merged into *stage* release branch and all future releases
```
MANUAL STEPS:
git fetch upstream
git checkout release_stage
git reset --hard upstream/release_stage
git merge upstream/develop
git commit -m "updating release_stage from develop"
git push upstream release_stage
git checkout release_test
git reset --hard upstream/release_test
git merge upstream/develop
git commit -m "updating release_test from develop"
git push upstream release_test
```

> 2) Codeship is run against the merge commit done to the future releases and when successful it publishes artifacts to an S3 bucket - continue with deploy to staging



## Release Branches

May branch off from:
develop
Must merge back into:
develop and master
Branch naming convention:
release-*

### Creating a release branch

- Bob will automatically create and protect release branches from the `develop` branch

    > TODO: automatically create and protect release branches from the `develop` branch -- not `master` or any other release

### Finishing a release branch

- Release from 2 weeks ago is archived
- Keep the previous release in GitHub
- On release day, the `release_stage` branch becomes the new `release_prod` branch

> NOTE: We shouldn't have to do any merging from develop to the next production branch because the next production branch should be good to go (tested throughout the week) by release day.

> QUESTION:
```
    - What would work the best? We're supposed to create release branches from develop, but we need the release branches around and propigated for QA.
	    - `develop` is auto merged into `release_stage` & `release_test` branch (I like this one b/c it keeps the commit history the same across branches -pattyr)
	    - `develop` is auto merged into `release_stage` & `release_stage` is auto merged into `release_test` branch
        - http://nvie.com/posts/a-successful-git-branching-model/#creating-a-release-branch
	- One issue I see with this is a last min push to the develop branch
```

## Bugfixes Branches (Pre-release)

Any bugfixes for a feature in `release_stage` should be merged back into the `release_stage`.

- Checkout new branch from `release_stage` branch
```
git checkout -b bugfix_MTSOPS-1234_release_stage upstream/release_stage
```
- Make changes, commit
```
git add <files>
git commit -m "MTSOPS-1234: bugfixes"
git push upstream bugfix_MTSOPS-1234_release_stage
```
- Create Pull Request from `bugfix_MTSOPS-1234_release_stage` to `release_stage`
- Merge when PR is approved and Codeship status checks are complete
I STOPPED RIGHT HERE!!!
- After bugfixes are merged, the `bugfix_MTSOPS-1234_release_stage` branch should be merged back to the `develop` branch
```
MANUAL STEPS:
git checkout -b develop
git merge bugfix_MTSOPS-1234_release_20171207 --no-ff
git push upstream release_stage
```

> QUESTION:
> - After bugfixes are applied, the `release_stage` the `bugfix_MTSOPS-1234_release_stage` should also be merged to `release_test`
> OR
> - After bugfixes are applied, the `release_stage` branch should be merged into the `release_test` branch

- Deploys to the staging environment (Deploy process already exists for release_YYYYMMDD branches)

## Production Branch

May branch off from:
develop
Must merge back into:
master

- `release_prod` was created from the `develop` branch

- Merge `release_prod` to `master`
```
MANUAL STEPS:
git checkout -b master
git merge release_prod --no-ff
git push upstream master
```

> QUESTION: Keep the same flow for archiving (tag release)? I can't remember off the top of my head how it's done, in the release script i think.
..
> NOTE: With our current deploy process, we need to keep the `release_prod` around for hotfixes

## Hotfix

May branch off from:
master
Must merge back into:
develop and master
Branch naming convention:
hotfix-*

### Creating the hotfix branch

- Create a hotfix branch from master
```
git checkout -b hotfix_MTP-1234_release_prod release_prod
```
- Make code changes, add, commit
```
git add <files>
git commit -m "hotfix changes"
git push origin hotfix_MTP-1234_release_prod
```

### Finishing a hotfix branch

- Create a PR from `hotfix_MTP-1234_release_prod` to `release_prod`
```
git checkout -b release_prod
git merge hotfix_MTP-1234_release_prod --no-ff
git push origin release_prod
```
- Merge hotfix from `hotfix_MTP-1234_release_prod` to `master` (AUTO)
```
git checkout -b master
git merge hotfix_MTP-1234_release_prod --no-ff
git push origin master
```
- Merge hotfix from `hotfix_MTP-1234_release_prod` to `develop` (AUTO)
```
git checkout -b develop
git merge hotfix_MTP-1234_release_prod --no-ff
git push origin develop
```