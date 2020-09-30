#!/bin/bash

# 2 - Escreva um script que peça para o usuário digitar 3 nomes de arquivo e imprima o nome daquele que possui o maior número de linhas.

max_file=""

read -p "digite nome arquivo(1) : " if1
read -p "digite nome arquivo(1) : " if2
read -p "digite nome arquivo(1) : " if3


for filename in { ${if1}, ${if2}}; do
    echo ${filename}
done