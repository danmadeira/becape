#!/bin/bash
#
[ $# -eq 0 ] && {
  echo "Backup do diretório de um website e seu banco."
  echo "Uso: becape-website.sh caminho [banco]"
  echo
  echo "  caminho    diretório do website em /var/www/html/"
  echo "  banco      nome do banco de dados, se houver"
  echo
  echo "Exemplo: becape-website.sh loja bdloja"
  exit 1
}

dia=`date +%Y%m%d`
hora=`date +%H%M%S`
maquina=`uname -n`
usuario="daniel"
senha=""

cd /var/www/html/

tar czvf ~/Backup/$1-$dia-$hora-$maquina.tgz $1
find $1/ -type f -exec md5sum '{}' \; > ~/Backup/$1-$dia-$hora-$maquina.md5

[ $# -eq 2 ] && {
  mysqldump -u $usuario -p$senha -B --skip-extended-insert $2 > ~/Backup/$2-$dia-$hora-$maquina.sql
  sed ':a;N;$!ba;s/)\;\nINSERT INTO `[A-Za-z0-9$_]*` VALUES (/),\n(/g' ~/Backup/$2-$dia-$hora-$maquina.sql > ~/Backup/$2-$dia-$hora-$maquina-extended-insert.sql
}

cd -

echo
echo Becapeado!
