Feature Branches
================

*Branch from:*

* `release_test` or future branches

*Merges into:*

* `release_test` or future branches

*Branch naming convention:*

* anything except `master` or `release_YYYYMMDD`


![MindTouch GitFlow Feature Branches](assets/mindtouch-gitflow-feature-branches.001.png)

To demonstrate the workflow, in this documentation we'll refer to each release as:

* `release_prev` = previous week released code
* `release_prod` = released and currently running
* `release_stage` = code currently testing by QA for release the next week
* `release_test` = feature merging for QA testing next week and production release in 2 weeks
* `release_next_test` = feature merging or incremental changes dependent on code from `release_test` or earlier

> **NOTE:**
> Each release branch above corresponds to a release branch with a date formatted `release_YYYYMMDD` that changes automatically each week. (i.e. `release_20171207`)

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