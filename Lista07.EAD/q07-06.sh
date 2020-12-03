#!/bin/bash

<<'DESC'
Cada caso do comando case pode terminar com “;;”. 
Escreva um script que exiba as outras opções de terminadores para os casos do case, explicando cada uma delas.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

#ponto de entrada(main)
terminators='
    The double semi-colon ´;;´ will stop attempting to match patterns after the first match is found.
    The semi-colon ampersand ´;&´ will run the command associated with the next clause. This will happen whether there is a match on the following clause or not.
    The double semi-colon ampersand ´;;&´ will test the patterns in the rest of the clauses and only execute the command if there is a match.
'

echo "${terminators}"

echo 'FIM'
