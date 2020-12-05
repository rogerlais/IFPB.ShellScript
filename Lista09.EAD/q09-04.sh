#!/bin/bash

<< 'DESC'
Escreva um script que valide as seguintes regras para criação de senha: pelo menos uma letra maiúscula, uma letra minúscula e um número. Validar significa receber uma senha e dizer se esta obedece ao padrão ou não.
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
