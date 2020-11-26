#!/bin/bash

<< 'DESC'
Escreva um script que exiba o nome e número de linhas de cada um dos arquivos do diretório atual. 
Melhore o script para que os arquivos sejam exibidos em ordem decrescente em relação ao número de linhas. 
Melhore ainda mais o script para que receba o nome do diretório (de onde serão listados os nomes dos arquivos) seja lido como parâmetro de linha de comando.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
fi

echo 'FIM'
