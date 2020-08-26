#!/usr/bin/env bash
#
# install.sh
#

# Cria o diretório do restic
mkdir -p ~/.restic/

# Copia dados para o diretório
cp -r .env ~/.restic/

# Dá permissão de execução aos scripts
chmod +x backup-scripts/*.sh

# Copia scripts para o diretório
sudo cp backup-scripts/backup.sh /usr/local/bin/do-backup
sudo cp backup-scripts/backup-check.sh /usr/local/bin/check-backup
sudo cp backup-scripts/slack-notification.sh /usr/local/bin/slack-notification

echo "Altere a permissão do arquivo .restic.env
Ex:
cd ~/.restic/.env
chmod 400 restic.env"

echo "Instalação realizada com sucesso.
siga as instruções de uso no repositório https://github.com/actiago/restic-local-backup"

