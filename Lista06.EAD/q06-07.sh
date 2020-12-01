#!/bin/bash

<< 'DESC'
Escreva um script que exiba o arquivo mais recente (cuja criação ou modificação foi realizada mais tarde) do diretório atual.
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
