#!/bin/bash

<<'DESC'
Escreva um script que valide as seguintes regras para criação de senha: 
pelo menos uma letra maiúscula, 
uma letra minúscula e um número. 
Validar significa receber uma senha e dizer se esta obedece ao padrão ou não.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    strArray=('OK123a8-ruim' 'okok123deuruim', 'P3feit@$1nt0n!A')
else
    strArray=("$@")
fi
clear

#ponto de entrada(main)
for arg in "${strArray[@]}"; do
    #if [[ "${arg}" == *[A-Z]* && "${arg}" == *[a-z]* && "${arg}" == *[0-9]* ]]; then
    upperChar='.[A-Z]'
    lowerChar='.[a-z]'
    numberChar='.[0-9]'
    #!Hey Thiago!!! Explica pq "" surround dá pau na comparação?
    if [[ "${arg}" =~ ${upperChar} && "${arg}" =~ ${lowerChar} && "${arg}" =~ ${numberChar} ]]; then
        echo "${arg} atende aos requisitos de senha"
    else
        echo "${arg} NÃO atende aos requisitos de senha"
    fi
done

echo 'FIM'
