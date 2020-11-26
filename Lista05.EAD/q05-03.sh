#!/bin/bash

<< 'DESC'
Escreva um script que calcule (e exiba na tela) a soma de todos os números de 1 até 20. 
Melhore este script para que peça para o usuário digitar dois números, a e b, e calcule a soma dos números de a até b.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
fi

echo 'FIM'
