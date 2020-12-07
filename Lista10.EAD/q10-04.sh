#!/bin/bash

<<'DESC'
Escreva um script que, 
dado uma lista de CPFs no formato xxxxxxxxxxx, 
coloque cada cpf no formato xxx.xxx.xxx-xx.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    cpfList=( '1232485784' '62528385005' '32923263030' '25661312016')
else
    cpfList=("$@")
fi
clear

#ponto de entrada(main)
echo -ne "CPFs informados:\n"
printf '%s\n' "${cpfList[@]}"
for cpf in "${cpfList[@]}"; do
    echo -n "CPF( ${cpf} ) = "
    echo "${cpf}" | sed -r -e '/^[0-9]{10}$/s/^/0/;s/^([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})/\1.\2.\3-\4/'
done
echo 'FIM'
