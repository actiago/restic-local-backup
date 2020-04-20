#!/usr/bin/env bash
#
# slack-notification.sh
#

curl -X POST -H 'Content-type: application/json' --data '{"text":"Backup Restic Local realizado com sucesso"}' https://hooks.slack.com/services/<seu_serviço>
