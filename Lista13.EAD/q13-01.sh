#!/bin/bash

<< 'DESC'
Escreva um script com uma função que receba 2 números e retorne o maior entre eles. 
Escreva uma nova função, esta recebe 2 números e retorna o menor entre eles.
DESC


#dados forcados
function sum(){
    echo $(( $1 + $2 ))
}

function lower(){
    if [[ $1 -lt $2 ]]; then
        echo $1
    else
        echo $2
    fi
}

function higher(){
    if [[ $1 -gt $2 ]]; then
        echo $1
    else
        echo $2
    fi
}

#Ponto de entrada habilitado
if ((${DBG_ENV})); then  #!Lembrar que DBG_ENV é setado pelo chamador
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    echo "Módulo q13-01.sh carregado"
fi
