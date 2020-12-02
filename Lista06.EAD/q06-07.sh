#!/bin/bash

<< 'DESC'
Escreva um script que exiba o arquivo mais recente (cuja criação ou modificação foi realizada mais tarde) do diretório atual.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
    targetDir=${PWD}/Lista06.EAD
else
    targetDir=${PWD}
fi
clear


#ponto de entrada(main)
strList=""
for currFile in $targetDir/*; do
    if [ -f "${currFile}" ] && [ -r "${currFile}" ]; then
        currTime="$(stat -c %Y "${currFile}")"
        #line="$(printf "%012d\t%s" ${currTime} ${currFile})\n" #\\ como separador
        line="$(printf "%05d" ${currTime})\\${currFile}\n" #\\ como separador
        echo -e "${line}"
        strList+="${line}"
    fi
done
echo -e ${strList}
sortedStrList=$(echo -e "${strList}" | sort -r)
sortedStrList=$(echo -e "${sortedStrList}" | tr '\\' '\n') #Troca separador anterior por \n
echo -e ${sortedStrList}
IFS=$'\n' read -d '' -r -a items <<<${sortedStrList}
#IFS=$'\n' read -a items <<<"${sortedStrList}"

echo -e "${items[@]}"

#echo -e "$(echo "${items[0]" | cut -f2 -d$'\t')"

echo 'FIM'
