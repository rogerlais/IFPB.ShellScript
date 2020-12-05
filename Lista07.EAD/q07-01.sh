#!/bin/bash

<<'DESC'
Escreva um script chamado help_test_2.sh. 
Este deve ter um laço, apresentando opções para o usuário. 
Se o usuário digitar sair, ele sai do script. 
Se digitar “logica”, o script deve imprimir uma ajuda sobre os parâmetros lógicos do comando test. 
Se digitar “aritmetica”, o script deve imprimir uma ajuda sobre os parâmetros aritméticos do comando test. 
Se digitar “strings”, o script deve imprimir uma ajuda sobre os parâmetros para strings do comando test. 
Se digitar “variáveis”, o script deve imprimir uma ajuda sobre os parâmetros para variáveis do comando test. 
Se digitar “arquivos”, o script deve imprimir uma ajuda sobre os parâmetros sobre arquivos do comando test. 
Se digitar "extended", o script deve imprimir uma ajuda sobre a notação estendida [[ ]].
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

function show-logic() {
    echo '
Operation	Effect
[ ! EXPR ]	True if EXPR is false.
[ ( EXPR ) ]	Returns the value of EXPR. This may be used to override the normal precedence of operators.
[ EXPR1 -a EXPR2 ]	True if both EXPR1 and EXPR2 are true.
[ EXPR1 -o EXPR2 ]	True if either EXPR1 or EXPR2 is true.    
    '
}
function show-arithmetic() {
    echo '
# The (( ... )) construct evaluates and tests numerical expressions.
# Exit status opposite from [ ... ] construct!

(( 0 ))
echo "Exit status of \"(( 0 ))\" is $?."         # 1
(( 1 ))
echo "Exit status of \"(( 1 ))\" is $?."         # 0
(( 5 > 4 ))                                      # true
echo "Exit status of \"(( 5 > 4 ))\" is $?."     # 0
(( 5 > 9 ))                                      # false
echo "Exit status of \"(( 5 > 9 ))\" is $?."     # 1
(( 5 == 5 ))                                     # true
echo "Exit status of \"(( 5 == 5 ))\" is $?."    # 0
# (( 5 = 5 ))  gives an error message.
(( 5 - 5 ))                                      # 0
echo "Exit status of \"(( 5 - 5 ))\" is $?."     # 1
(( 5 / 4 ))                                      # Division o.k.
echo "Exit status of \"(( 5 / 4 ))\" is $?."     # 0
(( 1 / 2 ))                                      # Division result < 1.
echo "Exit status of \"(( 1 / 2 ))\" is $?."     # Rounded off to 0.
                                                 # 1

(( 1 / 0 )) 2>/dev/null                          # Illegal division by 0.
#           ^^^^^^^^^^^    
    '
}
function show-strings() {
    echo '
[ -z STRING ]	True of the length if "STRING" is zero.
[ -n STRING ] or [ STRING ]	True if the length of "STRING" is non-zero.
[ STRING1 == STRING2 ] 	True if the strings are equal. "=" may be used instead of "==" for strict POSIX compliance.
[ STRING1 != STRING2 ] 	True if the strings are not equal.
[ STRING1 < STRING2 ] 	True if "STRING1" sorts before "STRING2" lexicographically in the current locale.
[ STRING1 > STRING2 ] 	True if "STRING1" sorts after "STRING2" lexicographically in the current locale.    
    '
}
function show-variables() {
    echo '
echo "Testing \"xyz\""
if [ xyz ]    # string
then
  echo "Random string is true."
else
  echo "Random string is false."
fi            # Random string is true.

echo

echo "Testing \"\$xyz\""
if [ $xyz ]   # Tests if $xyz is null, but...
              # it`s only an uninitialized variable.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # Uninitialized variable is false.

echo

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]            # More pedantically correct.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # Uninitialized variable is false.

echo


xyz=          # Initialized, but set to null value.

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then
  echo "Null variable is true."
else
  echo "Null variable is false."
fi            # Null variable is false.


echo


# When is "false" true?

echo "Testing \"false\""
if [ "false" ]              #  It seems that "false" is just a string ...
then
  echo "\"false\" is true." #+ and it tests true.
else
  echo "\"false\" is false."
fi            # "false" is true.

echo

echo "Testing \"\$false\""  # Again, uninitialized variable.
if [ "$false" ]
then
  echo "\"\$false\" is true."
else
  echo "\"\$false\" is false."
fi            # "$false" is false.
              # Now, we get the expected result.


[ -o OPTIONNAME ]	True if shell option "OPTIONNAME" is enabled.    
    '
}

function show-files() {
    echo '
[ -a FILE ]	True if FILE exists.
[ -b FILE ]	True if FILE exists and is a block-special file.
[ -c FILE ]	True if FILE exists and is a character-special file.
[ -d FILE ]	True if FILE exists and is a directory.
[ -e FILE ]	True if FILE exists.
[ -f FILE ]	True if FILE exists and is a regular file.
[ -g FILE ]	True if FILE exists and its SGID bit is set.
[ -h FILE ]	True if FILE exists and is a symbolic link.
[ -k FILE ]	True if FILE exists and its sticky bit is set.
[ -p FILE ]	True if FILE exists and is a named pipe (FIFO).
[ -r FILE ]	True if FILE exists and is readable.
[ -s FILE ]	True if FILE exists and has a size greater than zero.
[ -t FD ]	True if file descriptor FD is open and refers to a terminal.
[ -u FILE ]	True if FILE exists and its SUID (set user ID) bit is set.
[ -w FILE ]	True if FILE exists and is writable.
[ -x FILE ]	True if FILE exists and is executable.
[ -O FILE ]	True if FILE exists and is owned by the effective user ID.
[ -G FILE ]	True if FILE exists and is owned by the effective group ID.
[ -L FILE ]	True if FILE exists and is a symbolic link.
[ -N FILE ]	True if FILE exists and has been modified since it was last read.
[ -S FILE ]	True if FILE exists and is a socket.
[ FILE1 -nt FILE2 ]	True if FILE1 has been changed more recently than FILE2, or if FILE1 exists and FILE2 does not.
[ FILE1 -ot FILE2 ]	True if FILE1 is older than FILE2, or is FILE2 exists and FILE1 does not.    
    '
}

function show-extended() {
    echo '
The [[ ]] construct is the more versatile Bash version of [ ]. This is the extended test command, adopted from ksh88.
* * *
No filename expansion or word splitting takes place between [[ and ]], but there is parameter expansion and command substitution.
file=/etc/passwd
if [[ -e $file ]]
then
  echo "Password file exists."
fi
Using the [[ ... ]] test construct, rather than [ ... ] can prevent many logic errors in scripts. For example, the &&, ||, <, and > operators work within a [[ ]] test, despite giving an error within a [ ] construct.    
    '
}

function get-menuValue() {
    printf "\033c" #limpa a tela
    echo -e "Opções disponíveis: \n lógica \n aritmética \n strings \n variáveis \n arquivos \n extended \n SAIR"
    #echo -e $"\n"
    read -p "Digite uma das palavras acima:" inputval
    retval="${inputval}"
}

#ponto de entrada(main)
declare -a menuList=("LÓGICA" "show-logic" "LOGICA" "show-logic" "ARITMETICA" "show-arithmetic" "ARITMÉTICA" "show-arithmetic"
    "STRINGS" "show-strings" "VARIÁVEIS" "show-variables" "VARIAVEIS" "show-variables" "ARQUIVOS" "show-files" "EXTENDED" "show-extended" "SAIR" "exit 0")
optStr=''
menuSize=${#menuList[@]}
while [ -z ${optStr} ]; do  #Poderia ter ficado como loop infinito, mas mudei de ideia
    get-menuValue
    ret="${retval^^}"
    for ((x = 0; x < $menuSize; x+=2 )); do
        if [ ${ret} == ${menuList[$x]} ]; then
            echo -e "${menuList[$x + 1]}"
            eval "${menuList[$x + 1]}"
            read -p "Pressione <ENTER> para continuar..."
        fi
    done
done

echo 'FIM'
