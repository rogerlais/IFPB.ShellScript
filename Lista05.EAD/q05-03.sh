#!/bin/bash

<<'DESC'
Escreva um script que calcule (e exiba na tela) a soma de todos os números de 1 até 20. 
Melhore este script para que peça para o usuário digitar dois números, a e b, e calcule a soma dos números de a até b.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo 'Debug mode !' &>/dev/null
fi

#Versão simples
sum=0
for ((i = 1; i <= 5; i++)); do
    ((sum += $i))
done
echo -e "Valor da soma = ${sum}\n"

#Versão melhorada
echo "Calculando a soma de ${1} até ${2}"
sum=0
for ((i = (($1)); i <= (($2)); i++)); do
    ((sum += $i))
done
echo -e "Valor da soma = ${sum}\n"

echo 'FIM'
