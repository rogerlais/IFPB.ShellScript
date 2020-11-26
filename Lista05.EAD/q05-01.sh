#!/bin/bash

<<'DESC'
Escreva um script que imprima todos os números pares de 1 até 21. 
Melhore o script para que imprima todos os números pares entre a e b, sendo a o primeiro parâmetro de linha de comando, enquanto que b é o segundo.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
fi

for ((i = 2; i < 21; i += 2)); do
    echo "${i}"
done

echo 'FIM'
