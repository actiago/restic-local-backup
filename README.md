# Restic Local Backup

Este cenário recomendado para uso em _desktops_.

Aqui, utilizo o [Mega](https://mega.nz) como exemplo, você pode usar o OneDrive, Gdrive, disco USB...

## Requisitos

* Testado no Ubuntu 18.04

* [Restic backup](https://restic.net/)


## Instalação do restic

Com **APT**

```bash
sudo apt install restic -y
```

com **Snap**

```bash
sudo snap install restic
```

## Instalação deste app

* Baixe/Clone este repositório para o dispositivo desejado

```bash
git clone git@github.com:actiago/restic-local-backup.git
```

Execute o arquivo ```install.sh```

```bash
./install.sh
```

Após a instalação, inicie o repositório

```bash
restic init --repo <caminho_do_repositório>
```

Crie a senha, copie e cole no arquivo _password_ em ```~/.restic/.env/password```.

### O Arquivo restic.env

Edite o arquivo de acordo com sua necessidade: ```.env/.restic.env```

```bash
unset HISTFILE
export RESTIC_REPOSITORY=""
export RESTIC_PASSWORD_FILE=""
```

Item | Descrição
--- | ---
| RESTIC_PASSWORD_FILE | Senha criada na inicialização do repositório
| RESTIC_REPOSITORY | Caminho do repositório

## Utilização

Para fazer o backup, utilize o comando ```do-backup```

Para checar se há erros no repositório, utilize ```check-backup```

Utilize o _cron_ para realização automática de backup, Ex:

```bash
05 12,18 * * 1-6 /usr/local/bin/do-backup
```

Para listar snapshots, siga:

```bash
source ~/.restic/.env/restic.env
```

Em seguida:

```bash
restic snapshots
```

## Processo de _restore_

Para restaurar um backup siga o exemplo

```bash
source ~/.restic/.env/restic.env
```

```bash
restic snapshots
```

```bash
restic restore 7a3cf5f4 -t restored-data
```

Explicando o comando restore

Item | Descrição
--- | ---
| ```restic restore``` | Comando do restic que chama a função de _restore_ 
| 7a3cf5f4 | ID do snapshot selecionado para restauração
| -t restored-data | Indica o caminho onde será direcionado o backup, onde -t cria o diretório restored-data

## License

[MIT](./LICENCE.md)
