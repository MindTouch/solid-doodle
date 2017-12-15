Feature Branches
================

*Branch from:*

* `release_dev` or future branches

*Merges into:*

* `release_dev` or future branches

*Feature development branch naming convention:*

* The ticket number or multiple ticket numbers (i.e. `MTP-1234` or `MTP-1234_MTP-5678`)

*Feature complete branch naming convention:*

* The ticket number followed by the release branch it will pull into
    * `MTP-1234_release_YYYYMMDD`
    * `MTP-1234-MTP-5678_release_YYYYMMDD`

> NOTE:
> To prevent CodeShip's build queue from backing up, it will not run on a feature development branch (i.e. `MTP-1234`).
>
> CodeShip will only run against:
>   * `master`
>   * release branches (`release_YYYYMMDD`)
>   * feature complete branch (`MTP-1234_release_YYYYMMDD` or `MTP-1234_MTP-4567_release_YYYYMMDD`)

![MindTouch GitFlow Feature Branches](assets/mindtouch-gitflow-feature-branches.001.png)

To demonstrate the workflow, in this documentation we'll refer to each release as:

* `release_prod_prev` = previous week released code
* `release_prod` = released and currently running
* `release_staging` = code currently testing by QA for release the next week
* `release_dev` = feature merging for QA testing next week and production release in 2 weeks
* `release_dev_next` = feature merging or incremental changes dependent on code from `release_dev` or earlier

> **NOTE:**
> Each release branch above corresponds to a release branch with a date formatted `release_YYYYMMDD` that changes automatically each week. (i.e. `release_20171207`)

### Creating a feature branch

* When starting work on a new feature, branch off from the `release_dev` branch or from the future release branch you are planning to target.
* Name your branch the ticket number(s). (i.e. `MTP-1234` or `MTP-1234_MTP-5678`)

### Working on a feature branch

* Commit and push changes to the feature branch (i.e. `MTP-1234`)
* Pull in changes from the release branch you are planning to target and fix any merge conflicts before creating a feature pull request
* Run CodeShip locally

### Incorporating a finished feature

Finished features may be merged into the `release_dev` branch to add them to the upcoming staging release or merged into the future release branch you are planning to target:

* Create a new branch with the ticket number and release (i.e. `MTP-1234_release_YYYYMMDD`)
* Make a pull request against a `release_dev` branch (or future branch planning to target)
	* complete the form with the ticket number and summary of changes
	* request a reviewer
	* submit
* CodeShip is run against the merge pull request and will not allow a merge until build is successful.

### After Feature Completed Merge

* After a commit is merged into `release_dev` it will automatically propagate to the future release branches.