MindTouch GitFlow Training
==========================

To demonstrate the workflow, in this documentation we'll refer to each release as:

* `release_prod_prev` = previous week released code
* `release_prod` = released and currently running
* `release_staging` = code currently testing by QA for release the next week
* `release_dev` = feature merging for QA testing next week and production release in 2 weeks
* `release_dev_next` = feature merging or incremental changes dependent on code from `release_dev` or earlier

> **NOTE:**
> Each release branch above corresponds to a release branch with a date formatted `release_YYYYMMDD` that changes automatically each week. (i.e. `release_20171207`)

## Working on a Feature Branch

* Clone the repo, change into that directory and get the all the branches
    ```
    git clone git@github.com:MindTouch/solid-doodle.git
    cd solid-doodle
    ```
* Change remote to upstream
    ```
    git remote rm origin
    git remote add upstream git@github.com:MindTouch/solid-doodle.git
    ```
* Checkout the feature branch
    ```
    git fetch upstream
    git checkout -b MTP-1234_release_dev upstream/release_dev
    ```
* Make some code changes, commit
    ```
    git add <files>
    git commit -m "gitflow commit feature"
    ```
* Pull `release_dev` branch into feature, fix any conflicts (if any), commit
    ```
    git merge upstream/release_dev
    git push upstream MTP-1234_release_dev
	```
* Run CodeShip locally
    ```
    TODO
    ```
* Make a pull request against a `release_dev` branch
	* complete the form with the ticket number and summary of changes
	* request a reviewer
	* submit

## Code Reviews

### Reviewer

* Receive a notification (currently: email)
* In the pull request, leave a comment to request a change

### Committer

* Make some code changes, commit, and push
* Wait for pre-merge build to complete successfully

### Reviewer

* In the pull request, review and approve the commit

### Committer or Reviewer

* Merge when PR is approved and Codeship status checks are complete

### Status Checks

* Codeship will automatically run against the pull request before allowing a merge.

## After Feature is Merged

* Bob will automatically propagate the pull request to `release_dev` into `release_dev_next` and all future releases
* Codeship will automatically run against the release branch the PR was merged into and publishes artifacts to an S3 bucket, then the automated deployment will begin.

## Bugfixes

Any bugfixes for a feature in `release_staging` should be merged back into the `release_staging` branch.

* Checkout new branch from `release_staging` branch
    ```
    git checkout -b MTSOPS-1234_release_staging upstream/release_staging
    ```
* Make changes, commit, push
    ```
    git add <files>
    git commit -m "MTSOPS-1234: bugfixes"
    git push upstream MTSOPS-1234_release_staging
    ```
* Create Pull Request from `MTSOPS-1234_release_staging` to `release_staging`
* Merge when PR is approved and Codeship status checks are complete
* After bugfix is merged
    * Codeship will automatically run against the `release_staging` branch the PR was merged into and publishes artifacts to an S3 bucket, then the automated deployment will begin and QA can test the bugfix.
    * The `MTSOPS-1234_release_staging` branch will auto propagate to future branches

## Hotfixes

Any hotfixes for a feature in `release_prod` should be merged back into the `release_prod` branch.

* Checkout new branch from `release_prod` branch
    ```
    git checkout -b MTSOPS-1234_release_prod upstream/release_prod
    ```
* Make changes, commit, push
    ```
    git add <files>
    git commit -m "MTSOPS-1234: hotfixes"
    git push upstream MTSOPS-1234_release_prod
    ```
* Create Pull Request from `MTSOPS-1234_release_prod` to `release_prod`
* When PR is approved and Codeship status checks are complete merge
* After hotfix is merged
    * Codeship will automatically run against the `release_prod` branch the PR was merged into and publishes artifacts to an S3 bucket, then the automated deployment will begin
    * The changes to `MTSOPS-1234_release_prod` will auto propagate to `master` and future branches
