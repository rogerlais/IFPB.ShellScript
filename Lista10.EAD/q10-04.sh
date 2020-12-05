#!/bin/bash

<< 'DESC'
Escreva um script que, dado uma lista de CPFs no formato xxxxxxxxxxx, coloque cada cpf no formato xxx.xxx.xxx-xx.
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
