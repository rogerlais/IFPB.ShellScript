#!/bin/bash

<< 'DESC'
Considere o script loop.sh:

#!/bin/bash
while true; do
    a=$(( ${RANDOM} % 10 ))
    touch ${a} && echo “$(date +%H:%M) ${a}: criado!”
    sleep 1
b=$(( ${RANDOM} % 10 ))
    rm ${b} && echo “$(date +%H:%M) ${b}: removido!”
done

Execute o script acima de modo que todas as mensagens de sucesso sejam salvas no arquivo 1.log e que as mensagens de erro sejam salvas no arquivo 2.log.

Execute o script novamente de modo que todas as mensagens de sucesso e erro sejam salvas no arquivo 3.log.

DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
    echo 'debug mode!'
fi

a=/tmp/lixoA
b=/tmp/lixoB

outLog=/tmp/1.log
errorLog=/tmp/2.log
fullLog=/tmp/3.log

#! mode 1(separate stdout/stderr)
while true; do #!indefinida a saida do loop???
    a=$(( ${RANDOM} % 10 ))
    touch ${a} >> ${outLog} 2>> ${errorLog} && echo “$(date +%H:%M) ${a}: criado!”
    sleep 1
    b=$(( ${RANDOM} % 10 ))
    rm ${b} >> ${outLog} 2>> ${errorLog} && echo “$(date +%H:%M) ${b}: removido!”
done

#! mode 2(agreggate stdout/stderr)
while true; do
    a=$(( ${RANDOM} % 10 ))
    touch ${a} &>> ${outLog} && echo “$(date +%H:%M) ${a}: criado!”
    sleep 1
    b=$(( ${RANDOM} % 10 ))
    rm ${b} &>> ${outLog} && echo “$(date +%H:%M) ${b}: removido!”
done


echo 'FIM'
