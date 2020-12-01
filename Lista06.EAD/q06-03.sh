#!/bin/bash

<< 'DESC'
Escreva um script que receba uma lista de arquivos como parâmetros de linha de comando e exiba na tela os arquivos que são executáveis.
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
