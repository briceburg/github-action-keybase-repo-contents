#!/usr/bin/env bash
#
# entrypoint.sh: unfortunately we have to customize the stock entrypoint
#                as github actions expects the action container to run as
#                root, and stock entrypoint switches to 'keybase' user
#
set -euo pipefail
export KEYBASE_ALLOW_ROOT=1
export KEYBASE_SERVICE="oneshot"
export KEYBASE_USERNAME="$INPUT_KEYBASE_USERNAME"
export KEYBASE_PAPERKEY="$INPUT_KEYBASE_PAPERKEY"

keybase --use-default-log-file service &
kbfsfuse -log-to-file -mount-type=none &
keybase ctl wait --include-kbfs
keybase --no-auto-fork --no-debug oneshot
exec "$@"
