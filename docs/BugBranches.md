
## Bugfix Branch

Any bugfixes for a feature in `release_stage` should be merged back into the `release_stage`.

- Checkout new branch from `release_stage` branch
- Make changes, commit
- Create Pull Request from `MTSOPS-1234_release_stage` to `release_stage`
- Merge when PR is approved and Codeship status checks are complete
- After bugfix is merged, the `release_stage` branch should be merged back to the `release_test` and subsequent branches
- Deploys to the staging environment




## Hotfix Branch

May branch off from:
```
`release_prod`
```
Must merge back into:
```
`master` and `release_stage`
```
Branch naming convention:
```
`MTP-1234_release_prod`
```

### Creating the hotfix branch

- Create a hotfix branch from `release_prod`
- Make code changes, add, commit

### Finishing a hotfix branch

- Create a PR from `MTP-1234_release_prod` to `release_prod`
- Merge hotfix from `release_prod` to `master`
- Merge hotfix from `master` to `release_stage`
