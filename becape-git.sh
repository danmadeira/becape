#!/usr/bin/env bash
#

dia=$(date +%Y%m%d)
hora=$(date +%H%M%S)
maquina=$(uname -n)

cd ~/

tar cjvf ~/Backup/git-$maquina-$dia-$hora.tar.bz2 .gitconfig .git-credentials GitHub .config/git becape-git.sh

cd -

printf '\n%s\n' "Becapeado!"
