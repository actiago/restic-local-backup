#!/usr/bin/env bash

set -e -o pipefail

exit_hook() {
	echo "In exit_hook(), being killed" >&2
	jobs -p | xargs kill
	restic unlock
}
trap exit_hook INT TERM

RETENTION_DAYS=14
RETENTION_WEEKS=16
RETENTION_MONTHS=18
RETENTION_YEARS=3

BackupDestination="/home/tiago/MEGAsync/bkp/"
BackupSource="/home/tiago/projetos /home/tiago/Pictures /home/tiago/Documents /home/tiago/Downloads /home/tiago/github /home/tiago/Desktop"
BackupExcludes="--exclude-file .backup_exclude .env/backup-exclude"
BackupTag=Local.Backup

source .env/env.sh

restic unlock &
wait $!

restic -r $BackupDestination backup $BackupSource \
	--one-file-system \
	--tag $BackupTag \
	$BACKUP_EXCLUDES &
wait $!

restic -r $BackupDestination forget \
  --tag $BackupTag \
  --keep-daily $RETENTION_DAYS \
  --keep-weekly $RETENTION_WEEKS \
  --keep-monthly $RETENTION_MONTHS \
  --keep-yearly $RETENTION_YEARS &
wait $!

echo "Backup & cleaning is done."
