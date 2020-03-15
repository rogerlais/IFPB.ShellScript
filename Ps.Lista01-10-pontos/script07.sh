#! /bin/bash

<< 'DESC'
      Escreva um script que receba o nome de 3diretórioscomo argumento de linha de comando. O script deve imprimir a seguinte frase:
      Os diretórios <<A>>, <<B>> e <<C>> possuem <x>, <y>, e <z> arquivos, respectivamente.
DESC

d1=${1}
d2=${2}
d3=${3}

f1=$(find ${d1} -maxdepth 1 -type f | wc -l )
f2=$(find ${d2} -maxdepth 1 -type f | wc -l )
f3=$(find ${d3} -maxdepth 1 -type f | wc -l )

echo "Os diretorios ${d1}, ${d2} e ${d3} possuem ${f1}, ${f2} e ${f3} arquivos respectivamente"

echo 'fim'
