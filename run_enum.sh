#!/bin/bash
dir_output="${PWD}/output"
mkdir -p "$dir_output" 2>/dev/null

bkr() {
    script_name=$1
    output_file=${PWD}/output/$script_name.out.txt
    echo "[*] - [Running: $@] -[Output File: $output_file]"
    (nohup "$@" &>"$output_file" &)
}

bkr ./bangenum.sh
bkr ./LinEnum.sh -e "$dir_output" -t 
bkr ./lse.sh 
bkr ./lse1.sh -l 1
bkr ./lse2.sh -l 2
bkr ./linpeas.sh
bkr ./linux-exploit-suggester.sh
if which python > /dev/null 2>&1;
then
    if [[ $(python --version 2>&1) == *2\.7\.11 ]]; then
       bkr python linuxprivchecker.py

    fi 
else
    echo "[*] - Python 2.7 not found, skipping linuxprivchecker.py"
fi
if which perl > /dev/null 2>&1;
then
    bkr perl linux-exploit-suggester-2.pl
else
    echo "[*] - perl not found, linux-exploit-suggester-2.pl"
fi
