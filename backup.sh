#!/bin/bash
# ---------------------------------------------------------------------------------
set -x
#bd
user=usr_backup
pass=usr_backup
auth=admin
host=localhost
port=27017
#diretorios
local=/var/lib/backup
diario=backup_prod_$(date +%d-%m-%Y)
type=$1
arquivo=$local/$diario/backup_${type}_motus_prod_$(date +%d-%m-%Y_%H-%M-%S).gz
log=$local/$diario/backup_${type}_motus_prod_$(date +%d-%m-%Y_%H-%M-%S).log
mkdir -p $local/$diario
if [ -z "${type}"]; then
        echo >&2 "O Backup deve inc ou full"; exit 1
elif [ "$type" = "inc" ] || [ "$type" = "full" ]; then
        mongodump --host=$host --port=$port --authenticationDatabase=$auth -u$user -p$pass --gzip --archive=$arquivo
else
        echo >&2 "Opcoes invalidas!"; exit 1
fi
