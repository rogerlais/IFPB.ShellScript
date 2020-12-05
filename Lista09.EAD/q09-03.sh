#!/bin/bash

<<'DESC'
Escreva um script que valide um número qualquer em formato moeda do Brasil: R$ 1.000,00. 
Validar significa dizer se o número está no padrão ou não.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    strArray=("R$ 654.987.654.321,23" "R$ 654,987,654,321.23" "R$ 654.987.654.321-23" "654.987.654.321.01,23" 'R$654.987.654.321.01,23')
else
    strArray=("$@")
fi
clear

#ponto de entrada(main)
echo "Validando entradas passadas como valor monetário em Real brasileiro(BRL/R$)"
regex='^\R\$ ([0-9]{1,3})(\.[0-9]{3}){1,10}(\,[0-9]{2})'
for arg in "${strArray[@]}"; do
    testResult=$(echo "${arg}" | grep -E "${regex}")
    if [ -n "${testResult}" ]; then
        echo "Valor ${arg} - OK"
    else
        echo "Valor ${arg} - FALHOU"
    fi
done

echo 'FIM'
