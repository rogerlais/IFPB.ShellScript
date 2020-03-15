#!/bin/bash

argc=$# #Qtd de argumentos
argv=("$@") #Vetor de argumentos
SECONDS=0 #Reseta contador

echo "Linha de comando: ${PWD}/${0}"
echo "PID do processo: ${$}"
echo "PID do processo pai: ${PPID}"
echo "Foram passados ${#} argumentos ao script"
echo "Sendo eles:"
for (( j=0; j<argc; j++ )); do
    echo "\$$(($j + 1)) = ${argv[j]}"
done

#sleep 3 

echo "Tempo inicial: ${initTime}"
delta=${SECONDS} #Variação
echo "Tempo de execução: ${delta}"
