#!/bin/bash

fname="./sc04-01.sh"

ft1=[ test -f ${fname} ] && BOOL=0 || BOOL=1
ft2="$(test -f "${2}")"
ft3="$(test -f "${3}")"
echo ${ft1}
echo "valor para ${1} = -${ft1}-"
#if[ ${ft1} -a $(-f ${2}) -a $(-f ${3}) ]
if[ ${ft1} ]
then
    echo "Somatorio de linhas"
else
    echo "Requisitos faltosos"
fi