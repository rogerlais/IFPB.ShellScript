#!/bin/bash

read -p "Informe um valor inteiro: " value
ret=$((${value} %% 2 ))
if [ ret -eq 0 ]
then
    echo "O valor ${value} é par"
else
        echo "O valor ${value} é ímpar"
fi
