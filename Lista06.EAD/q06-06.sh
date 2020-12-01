#!/bin/bash

<< 'DESC'
Usando o comando if, 
escreva um script que verifique a existência de arquivos com o mesmo número de linhas no diretório atual. 
Caso existam, imprima o nome dos arquivos duplicados. 
Quando listar, verifique (usando if) se os parâmetros são arquivos ou diretórios.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
fi
clear


#ponto de entrada(main)


echo 'FIM'
