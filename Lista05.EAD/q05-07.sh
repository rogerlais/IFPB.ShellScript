#!/bin/bash

<< 'DESC'
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

table=""
for currFile in $targetDir/*; do
    table+="$(md5sum ${currFile})\n"
done

echo -e ${table}

echo 'FIM'
