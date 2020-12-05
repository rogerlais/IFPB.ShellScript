#!/bin/bash

<<'DESC'
Escreva um script que espera que um arquivo chamado key seja criado no diretório atual, verificando isso a cada 2 segundos, até que o arquivo seja criado.
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
targetFile="${targetDir}/key"
if [ -f ${targetFile} ]; then
    echo -e "Arquivo ${targetFile} encontrado.\nO mesmo será apagado neste momento."
    rm ${targetFile}
fi
while [ ! -f ${targetFile} ]; do
    echo -n '.'
    sleep 2
done
echo "Arquivo encontrado"

echo 'FIM'
