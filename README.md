# Migration Diff Generation

Note:
    - Password in the DBUI_URL_ENCODED needs to be URL encoded. the rest should NOT be.
```
atlas migrate diff WHAT_THE_NEW_CHANGE_IS \
              --dir "file://migrations" \
              --dev-url "docker://postgres/15" \
              --to $DBUI_URL_ENCODED --edit
```
