#!/bin/bash
#

dia=`date +%Y%m%d`
hora=`date +%H%M%S`
maquina=`uname -n`
usuario="daniel"
senha=""
bancos=`mysql -u $usuario -p$senha -Bse "SHOW DATABASES;" | egrep -v "information_schema|performance_schema|mysql"`

cd ~/

tar czvf ~/Backup/devel-$maquina-$dia-$hora.tgz public_html NetBeansProjects .netbeans /usr/local/netbeans-11.3/netbeans/etc/netbeans.conf

for db in $bancos; do
    mysqldump -u $usuario -p$senha --databases $db | gzip > ~/Backup/devel-$maquina-$dia-$hora.$db.sql.gz
done

find public_html/ -type f -exec md5sum '{}' \; > ~/Backup/devel-$maquina-$dia-$hora.md5

find NetBeansProjects/ -type f -exec md5sum '{}' \; >> ~/Backup/devel-$maquina-$dia-$hora.md5

cd -

echo
echo Becapeado!
