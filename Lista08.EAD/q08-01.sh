#!/bin/bash

<< 'DESC'
Escreva um script que receba o nome de um arquivo e um número (x) como parâmetros de linha de comando. O script deve imprimir a linha número x do arquivo.
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
