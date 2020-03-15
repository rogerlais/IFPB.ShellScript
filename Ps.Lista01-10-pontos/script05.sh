#! /bin/bash

<< 'DESC'
      Melhore o script da questão anterior para que , criando um novo script sufalha.sh que tenha as funcionalidades dos scripts sucesso.sh e falha.sh nele mesmo.
DESC

ls ${1} &> /dev/null
[[ "${?}" = "0" ]] && cat "${1}" >> lista_sucesso.txt || echo "${1}" >> lista_falha.txt

echo 'fim'
