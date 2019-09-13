#!/usr/bin/env bash
#
# install.sh
#

#################################
# Author: Tiago Amaral          #
# Github: github.com/actiago    #
# Email: tiagoamaralc@gmail.com #
#################################

# Cria o diretório do restic
mkdir -p ~/.restic/

# Copia dados para o diretório
cp -r .env ~/.restic/

# Dá permissão de execução aos scripts
chmod +x backup-scripts/*.sh

# Copia scripts para o diretório
sudo cp backup-scripts/backup.sh /usr/local/bin/do-backup
sudo cp backup-scripts/backup-check.sh /usr/local/bin/check-backup

# Altera a permissão do arquivo .restic.env
cd ~/.restic/.env
chmod 400 restic.env

echo "Instalação realizada com sucesso."
