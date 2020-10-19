#!/bin/bash

<< 'DESC'
Escreva um script que peça para o usuário digitar um número e diga se este número é par ou ímpar.
DESC

read -p "Informe um valor inteiro: " value
ret=$((${value} %% 2 ))
if [ ret -eq 0 ]
then
    echo "O valor ${value} é par"
else
    echo "O valor ${value} é ímpar"
fi
