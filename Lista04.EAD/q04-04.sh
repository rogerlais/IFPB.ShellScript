#!/bin/bash

<< 'DESC'
Considere o script:

#!/bin/bash
workdir=”/tmp/workdir”
mkdir $workdir
cd $workdir
ls $1 || echo “Por favor crie o arquivo ${workdir}/${1}”
ls $1 || exit 1
ls $2 || echo “Por favor crie o arquivo ${workdir}/${2}”
ls $2 || exit 1
ls $3 || echo “Por favor crie o arquivo ${workdir}/${3}”
ls $3 || exit 1
cat $1 $2 $3 | tr ‘ ‘ ‘\n’ | sort | grep -v “comentario”

Altere o script apresentado para que não exiba nenhuma mensagem de erro na tela. (Exceto pelo comando da linha 3, este deve ser permitido a exibir suas mensagens de erro).
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #Ajuste de depuracao
    echo 'debug mode!'
fi


echo "Args: $1 , $2 e $3"
#!seria o tipo das aspas uma pegadinha para gerar erros propositais??
workdir=”/tmp/workdir”
#* usando o modo incorreto alternativamente para poupar/gerar os erros
workdir=”/tmp/workdir”

mkdir $workdir 2> /dev/null
cd $workdir
ls $1 2> /dev/null || echo “Por favor crie o arquivo ${workdir}/${1}”
ls $1 2> /dev/null || exit 1
ls $2 2> /dev/null || echo “Por favor crie o arquivo ${workdir}/${2}”
ls $2 2> /dev/null || exit 1
ls $3 2> /dev/null || echo “Por favor crie o arquivo ${workdir}/${3}”
ls $3 2> /dev/null || exit 1
cat $1 $2 $3 2> /dev/null | tr ‘ ‘ ‘\n’ 2> /dev/null | sort 2> /dev/null | grep -v “comentario” 2> /dev/null


echo 'FIM'
