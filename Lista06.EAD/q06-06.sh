#!/bin/bash

<<'DESC'
Usando o comando if, 
escreva um script que verifique a existência de arquivos com o mesmo número de linhas no diretório atual. 
Caso existam, imprima o nome dos arquivos duplicados. 
Quando listar, verifique (usando if) se os parâmetros são arquivos ou diretórios.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
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
        currLine="$(cat "${currFile}" | wc -l)"
        line="$(printf "%05d" ${currLine})\\${currFile}\n" #\\ como separador
        strList+="${line}"
    fi
done
sortedStrList=$(echo -e "${strList}" | sort)
sortedStrList=$(echo -e "${sortedStrList}" | tr '\\' '\n') #Troca separador anterior por \n
echo -e ${sortedStrList}
IFS=$'\n' read -d '' -r -a items <<<${sortedStrList}

itemCount=${#items[@]}
x=0
while [ $x -lt $(($itemCount - 1)) ]; do
    lines=${items[$x]}
    fname=${items[$x + 1]}
    if [ $x -lt $(($itemCount - 1)) -a ${lines} == ${items[$x + 2]} ]; then
        echo -e "Encontrada duplicidade para arquivo ${fname}. Todos com ${lines} linhas. São ele(s):"
        while [[ ($x -lt $(($itemCount - 1))) && (${lines} == ${items[$x + 2]}) ]]; do
            echo -e "${items[$x + 1]}"
            x=$((${x} + 2)) #Salta para testar o proximo
        done
    fi
    x=$((${x} + 2)) #Salta para testar o proximo
done

echo 'FIM'
