# Migration Diff Generation

Note:
    - Password in the DBUI_URL_ENCODED needs to be URL encoded. the rest should NOT be.
    - edit flag is there to change the generated sql
```
atlas migrate diff WHAT_THE_NEW_CHANGE_IS \
              --dir "file://migrations" \
              --dev-url "docker://postgres/15" \
              --to $DBUI_URL_ENCODED --edit
```

# Migration Application

Note:
    - Remove dry-run flag when you are ready to apply. Always do a diff check before running
```
atlas migrate apply --url $DBUI_URL_ENCODED --dir "file://migrations" --dry-run
```
