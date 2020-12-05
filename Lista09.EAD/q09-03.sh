#!/bin/bash

<< 'DESC'
Escreva um script que valide um número qualquer em formato moeda do Brasil: R$ 1.000,00. Validar significa dizer se o número está no padrão ou não.
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
