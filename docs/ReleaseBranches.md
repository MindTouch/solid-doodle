## Release Branches

May branch off from:
```
the previous release branch
```
Must merge back into:
```
future branches
```
Branch naming convention:
```
`release_YYYYMMDD`
```

### Creating a release branch

- Bob will automatically create and protect release branches from the previous release branch branch

### Finishing a release branch

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

