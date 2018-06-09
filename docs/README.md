## Main Branches
The repo contains two main branches with an infinite lifetime.

### master branch (production)
`master` is considered to be the main branch where the source code always reflects a production-ready state.

### develop branch (test)
`develop` is considered to be the main branch where the source code always reflects a working state with the latest development changes for the next release.

## Supporting Branches
Supporting branches always have a limited life time and should be removed when projects or tasks are completed and merged.

## Feature branches

Feature branches are used to develop new features for future release.

When starting work on a new feature, branch off from the `develop` branch.

The feature branch exists as long as the feature is in development, but will eventually be merged back into the `develop` branch or discarded.

TODO? (pattyr) Do we want this>>>>
```
Feature branches typically exist in developer repos only. When ready
```

* May branch off from: `develop`
* Must merge back into: `develop`
* Branch naming convention: anything except `master`, `develop`, `release_YYYYMMDD`, or `hotfix_*`

TODO? (pattyr) Do we want to do this>>>
```
The --no-ff flag causes the merge to always create a new commit object
http://nvie.com/img/merge-without-ff@2x.png
Reverting a whole feature (i.e. a group of commits), is a true headache in the latter situation, whereas it is easily done if the --no-ff flag was used.
It will create a few more (empty) commit objects, but the gain is much bigger than the cost.
```

## Release branches (stage/staging)

Release branches are in preparation of a new production release. It allows minor bug fixes and preparing meta-data for a release.

Release branches are created from the `develop` branch. Bug fixes are applied in the release branch then merged into `develop`.

* May branch off from: `develop`
* Must merge back into: `develop` and `master`
* Branch naming convention: `release_YYYYMMDD`

To finish the release, the release branch is merged into `master`.
That merge commit on `master` must be tagged
Changes made on the release branch need to be merged back into `develop` (if not done already and may lead to merge conflict)

## Hotfix branches

Like release branches, hotfix branches are also meant to prepare for a new production release.

Hotfix branches are created from the master branch.

* May branch off from: `master`
* Must merge back into: `develop` and `master`
* Branch naming convention: `hotfix-*`

When finished, the hotfix needs to be merged back into `master` and `develop`.
The only exception is when a release branch currently exists, the hotfix changes need to be merged into that release branch, instead of develop.

TODO (pattyr) i think this would fit our flow better, cause we'll always have a release branch>>>
```
When finished, the hotfix needs to be merged back into `master` as well as the next `release` branch. The next `release` branch will get merged into `develop`.
```


## Pull Requests
Once a feature is complete, push the feature branch to the upstream to run codeship tests.

Once the tests pass a pull request is made from the feature branch to the develop branch and merged.

From the develop branch the code is merged into a release branch.

## Merging conflicts
TODO

## Bug fixes
Bugs found in a `release` branch (stage) should be applied directly to the release branch then merged into `develop`.

Bugs found in `develop` should be fixed from a `feature` branch and merged back into `develop`.

## Feature (context) switching
TODO

## Working on same feature
TODO

## Code Reviews

Merging button will enable once the pull request passes the status checks. Current status checks include:

* Approval from a code reviewer
* Codeship tests pass

## QA

* QA will test against the release branch
