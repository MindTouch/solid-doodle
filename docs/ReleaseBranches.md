Release Branches
================

*Branches from:*

* the previous release branch

*Merges into:*

* future branches

*Branch naming convention:*

* `release_YYYYMMDD`

![MindTouch GitFlow Release Branches](https://s3.amazonaws.com/pattyr-test/gitflow/mindtouch-gitflow-release-branches.001.png)

#### Note

In these examples, the release branches will be referred as:

* `release_prev`
* `release_prod`
* `release_stage`
* `release_test`
* `release_next_test`

Each branch respectfully matches a dated release branch (`release_YYYYMMDD`) that changes weekly.

Check the engineering channel for current status.

## Creating a release branch

- Bob will automatically create and protect release branches from the previous release branch branch

## Finishing a release branch

- On release day:
    - Release from 2 weeks ago is archived
    - Keep the previous release
    - `release_stage` branch becomes the new `release_prod` branch
    - `release_next_test` is created from `release_test`


## Production Branch

May branch off from:
`release_stage`
Must merge back into:
`master`

- `release_prod` was created from the `release_stage` branch
- Merge `release_prod` to `master`

