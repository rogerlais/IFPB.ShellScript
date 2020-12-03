#!/bin/bash

<< 'DESC'
Escreva um script que exiba um arquivo parte por parte (digamos 10 linhas em cada parte), esperando por um enter, até o fim do arquivo.
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
