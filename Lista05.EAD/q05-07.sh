#!/bin/bash

<<'DESC'
Escreva um script que use a ferramenta md5 para verificar a existência de arquivos com o mesmo conteúdo no diretório atual. 
Caso existam, imprima o nome dos arquivos duplicados.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
    targetDir="${PWD}/dados"
else
    targetDir="${PWD}"
fi

#Monta tabela com lista de arquivos e MD5(chave)
table=""
for currFile in $targetDir/*; do
    table+="$(md5sum ${currFile})\n"
done
table=sort ${table}

#itera sobre as linhas da tabela
IFS='\n ' read -r -a items <<<"${table}"

itemCount=${#items[@]}
x=0
while [ $x -lt $(($itemCount - 2)) ]; do
    md5sum=${items[$x]}
    fname=${items[$x + 1]}
    nextMD5Sum=${items[$x + 3]}
    if [ ${nextMD5Sum} = ${md5sum} ]; then
        echo "Encontrado arquivo repetido ${fname} com ${items[$x + 4]} pelo MD5 = ${md5sum} para ambos"
        x=$((${x} + 3)) #Salta para testar o proximo
    fi
    x=$((${x} + 3))
done

echo 'FIM'
