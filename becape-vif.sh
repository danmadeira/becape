#!/bin/bash
#
# Script para gerar cópia de segurança dos arquivos importantes.

dia=`date +%Y%m%d`
hora=`date +%H%M%S`
maquina=`uname -n`

tar czvf /home/daniel/Backup/vif-$maquina-$dia.$hora.tgz /etc /usr/local/bin /root/.bash_history /root/becape-vif.sh

chown daniel: /home/daniel/Backup/vif-$maquina-$dia.$hora.tgz

echo
echo Becapeado!
