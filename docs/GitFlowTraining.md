Prerequisites
=============

## Remote Repo Configuration

If you haven't already, change the remote MindTouch repo to the name `upstream`
```
git remote add upstream git@github.com:MindTouch/solid-doodle.git
```


GitFlow Training
================

After the a feature is merged into the develop branch, we're ready for a release. In these examples we'll refer to each release as `prod`, `stage`, and `test`.

In the real environment, those will be replaced with dates and will change weekly automatically. (i.e. `release_20171207`)

* `prod` = what is currently released and running
* `stage` = what is currently being tested by QA
* `test` = what is currently being used by local developers

> QUESTION: Is `test` stated correctly??


## Working on a Feature Branch

### Committer

- Clone the repo, change into that directory and get the all the branches
    ```
    git clone git@github.com:MindTouch/solid-doodle.git
    cd solid-doodle
    ```

- Change remote to upstream
    ```
    git remote rm origin
    git remote add upstream git@github.com:MindTouch/solid-doodle.git
    ```

    > QUESTION: should we keep the default origin? http://nvie.com/posts/a-successful-git-branching-model/#decentralized-but-centralized

- Checkout the feature branch
    ```
    git fetch upstream
    git checkout -b feature-branch-<yourname> develop
    ```
    > NOTE: `<yourname>` is ONLY for this example)

    > TODO: change the default branch in GitHub to `develop`

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


## Code Reviews

### Reviewer

- receive a notification (currently: email)
- in the pull request, leave a comment to request a change

### Committer

- Make some code changes, commit, and push
- Wait for pre-merge build to complete successfully

### Reviewer

- In the pull request, review and approve the commit

### Committer or Reviewer

- Merge when PR is approved and Codeship status checks are complete


## After Feature Completed Merge

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

- Bob will automatically create and protect release branches from the `develop` branch

    > TODO: automatically create and protect release branches from the `develop` branch -- not `master` or any other release

    > NOTE: On release day, the `release_stage` branch becomes the new `release_prod` branch, we shouldn't have to do any merging to the next production branch because the stage branch should be good to go (QA) by release day.

> QUESTION:
```
    - What would work the best? We're supposed to create release branches from develop, but we need the release branches around and propigated for QA.
	    - `develop` is auto merged into `release_stage` & `release_test` branch (I like this one b/c it keeps the commit history the same across branches -pattyr)
	    - `develop` is auto merged into `release_stage` & `release_stage` is auto merged into `release_test` branch
        - http://nvie.com/posts/a-successful-git-branching-model/#creating-a-release-branch
	- One issue I see with this is a last min push to the develop branch
```

## Bugfixes (Pre-release)

Any bugfixes for a feature in `release_stage` should be merged back into the release_stage.

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









RANDOM NOTES
============

GitFlow Playbook
Demonstrate GitFlow on a dummy repository.
- request reviews
- premerge build (codeship)
- pass status checks (codeship)
- completed features go into the develop branch

bob protect branches to:
	- status checks

questions
	- how can we enforce checks on administrator groups (but still allowing mtBot to merge)

TODO: Bob merge propagation flow:
- After a PR is merged into the `develop` branch
	- merge `develop` into staging and future branches
- Create new release_YYYYMMDD branches from the develop branch


develop becomes the permanent staging branch --> it will always go into staging branch
protect all branches (non-feature, hotfix, or bugfix) -- even develop
maybe add more protection for master and release branches: `Restrict who can push to this branch`