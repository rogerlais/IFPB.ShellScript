#!/bin/bash

<<'DESC'
Escreva um script que exiba o nome e número de linhas de cada um dos arquivos do diretório atual. 
Melhore o script para que os arquivos sejam exibidos em ordem decrescente em relação ao número de linhas. 
Melhore ainda mais o script para que receba o nome do diretório (de onde serão listados os nomes dos arquivos) seja lido como parâmetro de linha de comando.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
    targetDir="${PWD}/Lista05.EAD"
else
    targetDir=${PWD}
fi
clear

#Apenas para o path atual
for currFile in ${targetDir}/*; do
    wc -l ${currFile}
done

#Melhoria: ordenar por linhas existentes
outStr=""
for currFile in ${targetDir}/*; do
    currLines=$(cat ${currFile} | wc -l)
    outStr+="$(printf "%05d\n" ${currLines})\t${currFile}\n"
done
echo -e "${outStr}" | sort

#Melhoria final, caminho de listagem recebido por cl
targetDir=$1
outStr=""
for currFile in ${targetDir}/*; do
    currLines=$(cat ${currFile} | wc -l)
    outStr+="$(printf "%05d\n" ${currLines})\t${currFile}\n"
done
echo -e "${outStr}" | sort

echo 'FIM'
