#!/usr/bin/env bash

BackupDestination="/home/tiago/MEGAsync/bkp/"

set -e -o pipefail

exit_hook() {
	echo "In exit_hook(), being killed" >&2
	jobs -p | xargs kill
	restic unlock
}
trap exit_hook INT TERM

source .env/env.sh

restic -r $BackupDestination check \
  --read-data &
wait $!
