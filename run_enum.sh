#!/bin/bash
dir_pwd="$PWD"
dir_output="${PWD}/output"
mkdir -p $dir_output 2>/dev/null

bkr() {
    script_name=$1
    output_file=${PWD}/output/$script_name.out.txt
    echo "[*] - [Running: $@] -[Output File: $output_file".
    (nohup "$@" &>"$output_file" &)
}

bkr ./LinEnum.sh -e "$dir_output" -t 
bkr ./lse.sh 
bkr ./lse1.sh -l 1
bkr ./lse2.sh -l 2
bkr ./linpeas.sh
