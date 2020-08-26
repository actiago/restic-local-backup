# Restic Local Backup

Backup de dados em diretório local sincronizado com seu serviço de preferência.

Inspirado pelo repositório [restic-systemd-automatic-backup](https://github.com/erikw/restic-systemd-automatic-backup).

Cenário recomendado para uso em _desktops_.

## Requisitos

* [Restic backup](https://restic.net/)

## Instalação

* Baixe/Clone este repositório no dispositivo desejado

```bash
git clone git@github.com:actiago/restic-local-backup.git
```

Execute o arquivo ```install.sh```

```bash
./install.sh
```

## Uso

Após a instalação, inicie o repositório

```bash
restic init --repo <caminho_do_repositório>
```

> [Leia como iniciar um novo repositorio na documentação oficial](https://restic.readthedocs.io/en/latest/030_preparing_a_new_repo.html)

Crie a senha, copie no arquivo _password_ localizado no caminho ```~/.restic/.env/password```.

> Após copiar a senha, altere a permissão deste arquivo.

## O Arquivo restic.env

Edite o arquivo de acordo com sua necessidade: ```.env/.restic.env```

```bash
unset HISTFILE
export RESTIC_REPOSITORY=""
export RESTIC_PASSWORD_FILE=""
```

Item | Descrição
--- | ---
| RESTIC_REPOSITORY | Caminho do repositório
| RESTIC_PASSWORD_FILE | Senha criada na inicialização do repositório

## Utilização

- Para fazer o backup, utilize o comando ```do-backup```

- Para checar se há erros no repositório, utilize ```check-backup```

- Para listar snapshots, execute:

```bash
source ~/.restic/.env/restic.env
```

Em seguida:

```bash
restic snapshots
```

## Agendamento do backup com cron

Edite o cron de acordo com sua necessidade, você pode enviar a saída dos backups em um arquivo de log, por exemplo

```bash
05 12,18 * * 1-6 /usr/local/bin/do-backup >> /home/user/tmp/logs/backup.log
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

Explicando o comando acima

Item | Descrição
--- | ---
| ```restic restore``` | Comando do restic que chama a função de _restore_
| 7a3cf5f4 | ID do snapshot selecionado para restauração
| -t restored-data | Indica o caminho onde será direcionado o backup, onde -t cria o diretório restored-data

## License

[MIT](./LICENCE.md)
