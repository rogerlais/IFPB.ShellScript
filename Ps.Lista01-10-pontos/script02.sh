#! /bin/bash

<< 'DESC'
      Crie  um  script  que  peça  que  o  usuário  digite 5 extensões  e  crie  o  arquivo  lista.txt,  contendo todos os arquivos do diretório atual que possuem pelo menos uma destas extensões.
DESC


read -p "Informe extensão #1:" ext1
read -p "Informe extensão #2:" ext2
read -p "Informe extensão #3:" ext3
read -p "Informe extensão #4:" ext4
read -p "Informe extensão #5:" ext5

ls *.${ext1} >> list.txt 2> /dev/null
ls *.${ext2} >> list.txt 2> /dev/null
ls *.${ext3} >> list.txt 2> /dev/null
ls *.${ext4} >> list.txt 2> /dev/null
ls *.${ext5} >> list.txt 2> /dev/null


echo 'fim'
