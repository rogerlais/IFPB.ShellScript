#!/bin/bash

<< 'DESC'
Escreva um script que receba uma lista de arquivos como parâmetros de linha de comando e exiba na tela os arquivos que são executáveis.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" > /dev/null
fi
clear


#ponto de entrada(main)
for fname in $@; do
    [ -x ${fname} ] && echo "${fname} é executável."
done


echo 'FIM'
