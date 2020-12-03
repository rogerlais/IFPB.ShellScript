#!/bin/bash

<<'DESC'
Escreva um script que use o laço while para contar quantas linhas de um arquivo tem apenas números e quantas tem letras.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    targetFile=${PWD}/dados/datafile07-04.txt
else
    if [ -z "${1}" ]; then
        read -p "Informe o nome do arquivo: " targetFile
    else
        targetFile=$1
    fi
fi
clear

#ponto de entrada(main)
echo "Validando as linhas apenas numéricas do arquivo: ${targetFile}"
totalLines=0
mixedLines=0
numberLines=0
nullLines=0
while IFS="" read -r currLine || [ -n "$currLine" ]; do
    #printf '%s\n' "$currLine"
    ((totalLines++))
    if [ -z "${currLine}" ]; then #linha vazia
        ((nullLines++))
    else
        if [[ $currLine =~ ^[0-9]+$ ]]; then #Apenas numeros
            ((numberLines++))
        fi
        currLine=$(echo "${currLine}" | tr -d '\040\011\012\015') #remove brancos linhas etc
        if [[ $currLine =~ ^[0-9]+$ ]]; then
            ((mixedLines++))
        fi
    fi
done <"${targetFile}"

echo "Para o arquivo ${targetFile} tivemos os seguintes dados:"
echo "Linhas totais = ${totalLines}"
echo "Linhas não numéricas/mistas = ${mixedLines}"
echo "Linhas apenas numéricas = ${numberLines}"

echo 'FIM'
