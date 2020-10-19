#!/bin/bash

<< 'DESC'
1 - Escreva um script que peça para o usuário digitar um número inteiro. Armazene este número da variável a. Faça a variável a receber o valor a + 1. Imprima na tela o valor de a.
DESC

read -p "Informe um valor inteiro: " a
a=$(( 1 + $a ))
echo "O valor de retorno vale: ${a}"
