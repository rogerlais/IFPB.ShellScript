#!/bin/bash

read -p "Informe um valor inteiro: " a
a=$(( 1 + $a ))
echo "O valor de retorno vale: ${a}"
