#! /bin/bash

<< 'DESC'
      Melhore o script anterior para que este apresente mensagens de erro caso alguma das extensões passadas não corresponda a nenhum arquivo.
DESC


read -p "Informe extensão #1:" ext1
read -p "Informe extensão #2:" ext2
read -p "Informe extensão #3:" ext3
read -p "Informe extensão #4:" ext4
read -p "Informe extensão #5:" ext5

ls *.${ext1} >> list.txt 2> /dev/null || echo "Extensão ${ext1} não encontrada"
ls *.${ext2} >> list.txt 2> /dev/null || echo "Extensão ${ext2} não encontrada"
ls *.${ext3} >> list.txt 2> /dev/null || echo "Extensão ${ext3} não encontrada"
ls *.${ext4} >> list.txt 2> /dev/null || echo "Extensão ${ext4} não encontrada"
ls *.${ext5} >> list.txt 2> /dev/null || echo "Extensão ${ext5} não encontrada"


echo 'fim'
