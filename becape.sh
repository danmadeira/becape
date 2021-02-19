#!/bin/bash
#
# Script para gerar cópia de segurança dos arquivos importantes.

dia=$(date +%Y%m%d)
hora=$(date +%H%M%S)
maquina=$(uname -n)
usuario=$(whoami)

tar cjvf ~/Backup/$usuario-$maquina-$dia-$hora.tar.bz2 --exclude=~/.config/Code --exclude=~/.config/composer --exclude=~/.config/google-chrome --exclude=~/.config/VSCodium --exclude=~/.mozilla/firefox/Crash\ Reports --exclude-caches-all --exclude-caches-under ~/.gnupg ~/.bashrc ~/.Xresources ~/.config ~/.kde ~/Backgrounds ~/.bash_history ~/.googleearth/myplaces.* ~/.mozilla ~/.thunderbird ~/.opera ~/.vmware ~/.Mathematica ~/.Skype ~/.gftp ~/Imagens ~/.stellarium ~/.ssh ~/.local ~/.fonts ~/becape.sh

printf '\n%s\n' "Becapeado!"
