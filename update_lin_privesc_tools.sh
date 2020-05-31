#!/bin/bash
# This file will download a set of linux privesc tools to the current directory
echo "[*] - updating privesc tools"
curl -s -L -O https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
curl -s -L -O https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh
curl -s -L -O https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh
curl -s -L -O https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py
curl -s -L -O https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl
curl -s -L -O https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh
curl -s -L -O https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
curl -s -L -O https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
file_archive="$PWD"/linpriv.tar.gz
[ -f "$file_archive" ] && rm "$file_archive"
chmod +x "$PWD"/*
tar czvf /tmp/linpriv.tar.gz "$PWD" &>/dev/null
cp /tmp/linpriv.tar.gz "$PWD"
echo "[*] - Update complete, files at $PWD, archive at $file_archive"
