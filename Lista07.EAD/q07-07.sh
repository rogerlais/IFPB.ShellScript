#!/bin/bash

<<'DESC'
Escreva um script que exiba e exemplifique as diferenças entre o laço while e o laço until.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
diffStr='
    The ´until loop´ commands execute until a non-zero status is returned.
    The ´while loop´ commands execute until a zero status is returned.
    The until loop contains property to be executed at least once.
'
multCriteria='
If there are multiple conditions in the expression, then the syntax will be as follows:

    until [[ expression ]];  
    do  
    command1  
    command2  
    . . .  
    . . . .   
    commandN  
    done  
'

echo "Sem entender bem...."

echo "${diffStr}"

echo "${multCriteria}"

echo 'FIM'
