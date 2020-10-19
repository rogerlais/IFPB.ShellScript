#!/bin/bash


<< 'DESC'
Escreva um script que receba um nome de arquivo como parâmetro de linha de comando e, usando apenas uma linha de comando e operadores condicionais (&& e || ) imprima SIM caso o arquivo exista e NAO, caso contrário.
DESC

#1 - Escreva um script que receba um nome de arquivo como parâmetro de linha de comando e, usando apenas uma linha de
# comando e operadores condicionais (&& e || ) imprima SIM caso o arquivo exista e NAO, caso contrário.

[ -f ${1} ] && echo "SIM" || echo "NAO"