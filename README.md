# github-action-keybase-repo-contents
Use keybase git repository contents in GitHub Actions.

This is a helper action for copying paths, such as secret file(s), from a private keybase git repository into the workspace. Multiple paths can be specified and globstar pattern matching is supported.

 If you need support for [KBFS](https://book.keybase.io/docs/files) or [kvstore](https://pkg.go.dev/github.com/keybase/client/go/kvstore), please ask!


## Example usage

```
- name: Fetch Keybase Secrets
  uses: briceburg/github-action-keybase-git-repo@v0
  with:
    keybase_username: ${{ secrets.KEYBASE_USERNAME }}
    keybase_paperkey: ${{ secrets.KEYBASE_PAPERKEY }}
    repo: keybase://team/acme/secrets_repo
    paths: "*.secret.yml:larry.xml:curly/moe.json"
```

The [integration workflow](./.github/workflows/integration.yml) shows real-world usage, including output consumption.

### Inputs

name | :ballot_box_with_check: | description
--- | --- | ---
keybase_username | **required** | Keybase Username, e.g. `pat-acme`
keybase_paperkey | **required** | Keybase Paper Key (for oneshot mode), e.g. `full moon sunday blurb`
repo | **required** | Repository name.`keybase://team/acme/secrets_repo` or `https://github.com/acme/secrets_repo.git`
paths | **required** | Colon separated list of paths to copy from the repository. Globstar pattern matching is supported. E.g. `*.secret.yml` or `larry.xml:curly.yml:moe.json:secrets/**/*.tfvars`. If a path is a directory, it will be recursively copied.
target | _optional_ | Target directory (relative to workspace) to copy to. If left blank, matching contents will be copied to the workspace root. :thought_balloon: It's recommended to copy into a [.gitignored](https://git-scm.com/docs/gitignore) target.

### Outputs

name | description
--- | ---
paths | Colon separated list of paths that successfully copied into the workspace. E.g. `larry.xml:curly.yml:moe.json:secrets/foo/alice.tfvars`
