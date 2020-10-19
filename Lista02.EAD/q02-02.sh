#!/bin/bash

<< 'DESC'
Escreva um script que receba dois números inteiros como argumentos de linha de comando, digamos a e b, e imprima o primeiro elevado ao segundo, ou seja a elevado a b. 

Exemplo:
./pow.sh 4 2
16

DESC


ret=$(($1 ** $2 ))
echo "Resultado: ${ret}"