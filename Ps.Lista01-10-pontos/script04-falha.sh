#! /bin/bash

<< 'DESC'
      falha.sh: Este script deve receber o nome de um arquivo como parâmetro deve adicionar este nome no arquivo lista_falha.txt.
DESC

echo "${1}" >> lista_falha.txt

