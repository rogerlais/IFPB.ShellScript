#!/bin/bash

<< 'DESC'
1 - Escreva um script que, baseado em opções de linha de comando:
a - Remova todas as letras de um arquivo.
b - Remova todos os dígitos de um arquivo.
c - Remova todos os caracteres que não são letras nem dígitos de um arquivo.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
fi
clear


#ponto de entrada(main)

echo 'FIM'
