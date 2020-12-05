#!/bin/bash

<<'DESC'
Todas as soluções devem usar o comando grep com expressões regulares.

1 - Escreva um script que, baseado em opções de linha de comando:
a - Liste apenas os diretórios de uma pasta(d)
b - Liste apenas os executáveis(x)
c - Liste apenas os scripts shell(s)
DESC


#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    targetDir=/tmp/roger/
else
    targetDir=${PWD}/
fi
clear

#ponto de entrada(main)
#ver reference at:
#https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
OPTIND=1 # Reset in case getopts has been used previously in the shell.
while getopts ":p:dxs" opt; do
    case "$opt" in
    p)
        #Ajusta o caminho de exibição
        targetDir=$OPTARG
        ;;
    esac
done
OPTIND=1 # Reset in case getopts has been used previously in the shell.
while getopts ":p:dxs:" opt; do
    case "$opt" in
    d)
        #listar apenas diretorios
        echo "Listando diretórios em ${targetDir}:"
        ls -la "${targetDir}" | grep -E "^d"
        ;;
    x)
        #listar apenas executáveis
        echo "Listando executáveis em ${targetDir}:"
        ls -lsa "${targetDir}" | grep -E "[d\-](([rw\-]{2})x){1,3}"
        ;;
    s)
        #listar apenas scripts(chute.... extensão sh??? Embora, o teste mais real seria a primria linha e ser texto, juntamente com permissão de execução)
        echo "Listando scripts em ${targetDir}:"
        ls -lsa "${targetDir}"*.sh | grep -E "[d\-](([rw\-]{2})x){1,3}"
        ;;
    esac
done
OPTIND=1
shift $((OPTIND - 1))  #!Retorna ao status quo.... neste caso de agora.... pra que mesmo?

echo 'FIM'
