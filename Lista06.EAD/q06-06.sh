#!/bin/bash

<<'DESC'
Usando o comando if, 
escreva um script que verifique a existência de arquivos com o mesmo número de linhas no diretório atual. 
Caso existam, imprima o nome dos arquivos duplicados. 
Quando listar, verifique (usando if) se os parâmetros são arquivos ou diretórios.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    targetDir=${PWD}/dados
else
    targetDir=${PWD}
fi
clear

#ponto de entrada(main)

#monta lista de arquivos com respectivas linhas
strList=""
for currFile in $targetDir/*; do
    if [ -f "${currFile}" ] && [ -r "${currFile}" ]; then
        #line="$(wc -l "${currFile}")\n"
        currLine="$(cat "${currFile}" | wc -l)"
        line="$(printf "%05d" ${currLine})\\${currFile}\n"
        #echo "${line}"
        #echo -e "${line}"
        strList+="${line}"
        #echo "${strList}"
    fi
done
echo -e "nativa= \n${strList}"
sortedStrList=$(echo -e "${strList}" | sort)
echo -e "ordenada= \n${sortedStrList}"
sortedStrList=$(echo -e "${sortedStrList}" | tr '\\' '\n')
echo -e "ordenada= \n${sortedStrList}"
echo "ordenada= ${sortedStrList}"

#read -r -a items <<<${sortedStrList} #!importar items com espacos nos nomes - tem tab
#declare -a arr="($(<<<${sortedStrList}))"

#IFS='\n ' read -r -a items <<<${sortedStrList} #!importar items com espacos nos nomes - tem tab
IFS=$'\n' read -d '' -r -a items <<< ${sortedStrList}

itemCount=${#items[@]}
echo "linhas = ${itemCount}"
echo "${items[@]}"
x=0
while [ $x -lt $(($itemCount - 2)) ]; do
    lines=${items[$x]}
    fname=${items[$x + 1]}
    nextLines=${items[$x + 2]}
    if [ ${nextLines} -eq ${lines} ]; then
        echo -e "Encontrado arquivo repetido ${fname} com ${items[$x + 4]} linhas = ${lines} para ambos"
        x=$((${x} + 3)) #Salta para testar o proximo
    fi
    x=$((${x} + 3))
done

echo 'FIM'
