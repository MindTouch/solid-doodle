GitFlow Training
================

After the a feature is merged into the develop branch, we're ready for a release.

(master) Production at release_20171130.
(feature) Today is 20171205.
(release_YYYYMMDD) Stage is release_20171207.
Test is release_20171214.




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
    git checkout -B feature-branch-<yourname> upstream/develop
    ```
    > NOTE: `<yourname>` is ONLY for this example)

    > TODO: change the default branch in GitHub to `develop`

- Make some code changes, commit, and push
    ```
    git add <files>
    git commit -m "gitflow commit"
    git push upstream feature-branch-<yourname>
	```
	> QUESTION: (with the --no-ff) http://nvie.com/posts/a-successful-git-branching-model/#incorporating-a-finished-feature-on-develop

- Make a pull request against a `develop` branch
	- complete the form with the ticket number and summary of changes
	- request a reviewer
	- submit

	> TODO: bob will not like the PR branch names b/c it will look for `release_YYYYMMDD`

### Reviewer

- receive a notification (currently: email)
- in the pull request, leave a comment to request a change

### Committer

- Make some code changes, commit, and push

### Reviewer

- in the pull request, approve the commit

### Committer or Reviewer

- merge

## Test Branch

The `develop` branch is always deployed to the test environment and should always be stable. (AUTO) In our example it's `release_20171214`.


## Staging Branch

- create a release_YYYYMMDD branch from the `develop` branch (AUTO)
```
git checkout -B release_20171207 upstream/develop
git push upstream release_20171207
```
- deploys to staging environment after creation/merge of `develop` into release_YYYYMMDD (AUTO)

> QUESTION:
```
	- OR `develop` is auto merged into release_YYYYMMDD branch
	- TODO: change bob to merge develop branch changes to the "staging" release_YYYYMMDD (and propagate to future)
		- OR should bob remove and recreate the release branch
		- OR should bob only create release branches on thursdays
		- OR should bob re-create release branches nightly?
		- OR other ideas? http://nvie.com/posts/a-successful-git-branching-model/#creating-a-release-branch
```

## Bugfixes (Pre-release)

Any bugfixes found in Staging should be merged into the release_YYYYMMDD

- Checkout new branch from release_YYYYMMDD branch
```
git checkout -B bugfix_MTSOPS-1234_release_20171207 upstream/release_20171207
```
- Make changes, commit
```
git push upstream bugfix_MTSOPS-1234_release_20171207
```
- Create Pull Request from `bugfix_MTSOPS-1234_release_20171207` to `release_20171207`
- After bugfixes are applied, the release_YYYYMMDD branch should be merged back to the `develop` branch
```
git checkout -B develop
git merge bugfix_MTSOPS-1234_release_20171207 --no-ff
git push origin develop
```
- Deploys to the staging environment (AUTO)

## Production Branch

- Merge release_YYYYMMDD to master (AUTO)
```
git checkout -B master
git merge release_20171130 --no-ff
git push origin master
```
> QUESTION: Keep the same flow for archiving (tag release)?
> NOTE: With our current deploy process, we need to keep the release branch around for hotfixes

## Hotfix

- Create a hotfix branch from master
```
git checkout -B hotfix_MTP-1234_release_20171130 release_20171130
```
- Make code changes, add, commit
```
git add <files>
git commit -m "hotfix changes"
git push origin hotfix_MTP-1234_release_20171130
```
- Create a PR from `hotfix_MTP-1234_release_20171130` to `release_20171130`
```
git checkout -B release_20171130
git merge hotfix_MTP-1234_release_20171130 --no-ff
git push origin release_20171130
```
- Merge hotfix from `hotfix_MTP-1234_release_20171130` to `master` (AUTO)
```
git checkout -B master
git merge hotfix_MTP-1234_release_20171130 --no-ff
git push origin master
```
- Merge hotfix from `hotfix_MTP-1234_release_20171130` to `develop` (AUTO)
```
git checkout -B develop
git merge hotfix_MTP-1234_release_20171130 --no-ff
git push origin develop
```







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
