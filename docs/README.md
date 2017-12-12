MindTouch GitFlow
=================

![MindTouch GitFlow](https://s3.amazonaws.com/pattyr-test/gitflow/mindtouch-gitflow-model.001.png)

## The Main Branch

The central repo holds one main branch with an infinite lifetime:

`master`

origin/master is the main branch where the source code of HEAD always reflects a production-ready state.

Pull requests are not allowed directly to master

## Supporting Branches

these branches always have a limited life time, since they will be removed eventually.

- [Feature branches](FeatureBranch.md)
- [Release branches](ReleaseBranches.md)
- [Hotfix branch](BugBranches.md#hotfix-branch)
- [Bugfix branch](BugBranches.md#bugfix-branch)

## GitFlow Training

[MindTouch's GitFlow training guide](GitFlowTraining.md)