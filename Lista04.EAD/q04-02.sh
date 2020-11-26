#!/bin/bash

<< 'DESC'
Considere o seguinte arquivo a.txt:

obase=16
43^2 - (11^3 + 31/4)
10+10

Escreva um script que use o programa bc e redirecionadores de entrada para resolver estas contas.
Faça uma versão usando pipe e outra sem usar pipe.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
    basedir="${PWD}/Lista04.EAD/"
else
    basedir='./'
fi
clear

inputFile="${basedir}a.txt"
echo "Avaliando ${inputFile}"

echo 'Versão sem pipe: '
bc < ${inputFile} -q

echo 'Versão com pipe: '
cat ${inputFile} | bc -q


echo 'FIM'
