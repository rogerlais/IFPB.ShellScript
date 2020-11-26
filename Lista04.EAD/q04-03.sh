#!/bin/bash

<< 'DESC'
O comando ping é usado frequentemente para verificar a conectividade entre dois hosts em uma rede. 
Adicionalmente, este também pode ser usado para gerar relatórios sobre a qualidade da rede. 
Escreva um script que execute o comando ping para o site www.google.com e que, ao mesmo tempo que exibe o resultado na tela, salve este resultado no arquivo /tmp/report.txt
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
    echo 'debug mode!'
fi

target='www.google.com'
resultFile='/tmp/report.txt'
pingCount=5

ping -c ${pingCount} $target | tee -a ${resultFile}

if [[ -v "${DBG_ENV}" ]]; then
    #exibe saida como debug
    cat ${resultFile}
fi

echo 'FIM'
