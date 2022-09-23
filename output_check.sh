#!/bin/bash

ANS_DIR="ans/"

#引数の個数確認
if [ $# != 1 ]; then
    echo Error: Too many argument, [$*]
    exit 1
fi

#正答例の存在確認
if [ ! -e $ANS_DIR$1 ]; then
    echo "Error: File not exists."
    echo "You have to create example answer file as [ans/<filename>]"
    exit 1
fi

#ファイル出力・差分確認(vimdiff からは:qa で抜ける)
./$1 > $1_output
vimdiff $1_output $ANS_DIR$1
rm -f $1_output
