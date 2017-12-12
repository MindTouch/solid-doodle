Code Review Process
===================

## Committer

- Clone the repo and change into that directory
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
    git checkout -B feature-branch-<yourname> develop
    ```
    > NOTE: `<yourname>` is ONLY for this example)

- Make some code changes, commit, and push
    ```
    git add <files>
    git commit -m "gitflow commit"
    git push upstream/feature-branch-<yourname>
	```
	> QUESTION: (with the --no-ff) http://nvie.com/posts/a-successful-git-branching-model/#incorporating-a-finished-feature-on-develop

- Make a pull request against a `develop` branch
	- complete the form with the ticket number and summary of changes
	- request a reviewer
	- submit

	> TODO: bob will not like the PR branch names b/c it will look for `release_YYYYMMDD`

## Reviewer

- receive a notification (currently: email)
- in the pull request, leave a comment to request a change

## Committer

- Make some code changes, commit, and push

## Reviewer

- in the pull request, approve the commit

## Committer or Reviewer

- merge