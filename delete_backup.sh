#!/bin/bash
# Script para controlar retenção dos backup
# ATENÇÃO: O script ira apagar os backups de acordo com os periodos de rentenção
#          Não execute o script se não tiver certeza do que está sendo executado!
# ---------------------------------------------------------------------------------
#Variaveis
local=/var/lib/backup
log=$local/log
retention_inc="1 day ago"
retention_full="31 day ago"
#exclui backups
find $local/backup_prod_$(date +%d-%m-%Y -d "$retention_inc")/backup_inc_motus_prod* -type f -print -delete > $log/backup_inc_to_remove.log
find $local/backup_prod_$(date +%d-%m-%Y -d "$retention_full") -print -type d -exec rm -rf {} + > $log/backup_full_to_remove.log
