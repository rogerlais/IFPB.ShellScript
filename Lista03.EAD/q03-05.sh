#!/bin/bash

<<'DESC'
Escreva um script que recebe o nome de um arquivo como argumento de linha de comando e imprime GOOD caso este arquivo exista e possua mais que 5 linhas.
DESC

clear
echo "Executando em: ${PWD}"

#Coleta dos dados
fname=$1

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    fname="${PWD}/Lista03.EAD/q03-03.sh"
fi

#operacao
echo "Testando ${fname}"

#Avalia saida
txt=$([[ $(wc -l <${fname}) -ge 5 ]] && echo "GOOD" || echo "BAD")

#Saida
echo ${txt}

echo 'FIM'
