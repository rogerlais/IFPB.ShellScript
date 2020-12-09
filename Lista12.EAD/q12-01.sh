#!/bin/bash

<<'DESC'
Escreva um script que peça para o usuário digitar um conjunto de números na mesma linha, 
separados por espaço (podem ser vários números, o usuário decide quantos) e exiba o menor deles.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
read -p "Digite vários números separados por espaços e ao final tecle <ENTER>: " fullData
read -r -a dataArr <<< "$fullData"
minValue=${dataArr[1]}
for x in "${dataArr[@]}"; do
    echo "atual ${x} anterior ${minValue}"
    if [[ $x -lt $minValue ]]; then
        minValue=$x
    fi
done
echo "O menor valor informado foi: ${minValue}"


echo 'FIM'
