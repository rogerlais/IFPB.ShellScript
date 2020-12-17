#!/bin/bash

echo '{
Escreva um script que exiba a data atual e uma mensagem motivacional aleatória. 
Faça que esse script seja executado todas as vezes que seu usuário faça login no sistema.
}' >/dev/null

#dados forcados
if [[ ${DBG^^} == "'YES'" ]]; then #depurador avalia '[[ 'YES' == YES ]]' como verdadeiro
    DBG_ENV=true                   #*Este é o conceito de verdadeiro em Bash. Nos testes usar a forma if $DBG_ENV; then e NUNCA if [[ $DBG_ENV ]]; then
    DBG_CMDLINE=$(tr -d '\0' </proc/$PPID/cmdline)
    DBG_MAIN_SCRIPT=$(grep -oP "(?<=-- )[^ ]+" <<<"$DBG_CMDLINE") #todo ainda precisa de teste para aprovação
    export DBG_CMDLINE DBG_MAIN_SCRIPT
else
    DBG_ENV=false
fi
export DBG_ENV

if $DBG_ENV; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
fi
clear

MOTIVATIONAL_LEROLERO='“Orgulhe-se da sua história, das suas conquistas, das tuas superações, sem isso, a vida não teria o transformado neste Ser de Luz Especial que você é.” José Roberto Marques
“A vida é melhor para aqueles que fazem o possível para ter o melhor”. John Wooden
“Ninguém pode fazer você se sentir inferior sem o seu consentimento” Eleanor Roosevelt
“Comece de onde você está. Use o que você tiver. Faça o que você puder”. Arthur Ashe
“Continue andando. Haverá a chance de você ser barrado por um obstáculo, talvez por algo que você nem espere. Mas siga, até porque eu nunca ouvi falar de ninguém que foi barrado enquanto estava parado”. Charles F. Kettering
“Coragem é a resistência e o domínio do medo, não a ausência dele”. Mark Twain
“O sucesso é a soma de pequenos esforços repetidos dia após dia”. Robert Collier
“A vida só pode ser compreendida olhando para trás, mas só pode ser vivida olhando para frente.” – Frase do filme O Curioso Caso de Benjamin Button
“Viver com medo é viver pela metade.” – Frase do filme Dirty Dancing
“Acima de tudo, nunca pare de acreditar.” – Frase do filme As Aventuras de Pi
“Todo homem morre, mas nem todo homem é lembrado.” – Frase do filme O Patriota
“Não importa a cor do cabelo, o estilo das roupas, muito menos a cor da pele. Nada disso define caráter.” – Frase do filme Histórias Cruzadas
“Cada história tem um final. Mas, na vida, cada final é um recomeço.” – Frase do filme Grande Menina, Pequena Mulher
“A felicidade só é verdadeira quando compartilhada.” – Frase do filme Na natureza Selvagem
“Carpe diem. Aproveitem o dia. Tornem suas vidas extraordinárias.” – Frase do filme A Sociedade dos Poetas Mortos
“Deixe a liberdade ecoar.” – Frase do filme Django
“Nunca deixe que alguém lhe diga que não pode fazer algo. Se você tem um sonho, tem que protegê-lo. As pessoas que não podem fazer por si mesmas, dirão que você não consegue. Se quer alguma coisa, vá e lute por ela. Ponto final.” – Frase do filme À Procura da Felicidade
“Ninguém vai bater mais forte do que a vida. Não importa como você bate e sim o quanto aguenta apanhar e continuar lutando; o quanto pode suportar e seguir em frente. Assim é a vida.” – Frase do filme Rocky Balboa
“É preciso saber tirar proveito de uma desgraça, e não deixar-se vencer por ela.” – Frase do filme Os Intocáveis.
“O que fazemos na vida, ecoa na eternidade” – Frase do filme Gladiador
“Saber esperar é uma virtude! Aceitar, sem questionar, que cada coisa tem um tempo certo para acontecer… é ter Fé!” – Frase do filme À espera de um milagre.
“A vida passa muito rápido. E se você não curtir de vez em quando, a vida passa e você nem vê.” – Frase do filme Curtindo a vida adoidado.
“Não são as nossas habilidades que mostram o que realmente somos… são nossas escolhas” – Frase do Filme Harry Potter.
“É o que você faz agora que faz a diferença.” – Frase do filme Falcão Negro em perigo.
“A única pessoa no seu caminho é você mesma.” – Frase do filme Cisne Negro
“Cuidado com seus pensamentos; eles podem se tornar palavras. Cuidado com suas palavras, elas podem se tornar ações. Cuidado com suas ações, elas podem se tornar hábitos. Cuidado com seus hábitos, eles podem se tornar seu caráter. Cuidado com seu caráter, ele pode se tornar seu destino.” Frase do filme A Dama de Ferro
“Se existe magia em lutar além dos limites da resistência, esta é a mágica de arriscar tudo por um sonho que ninguém enxerga, só você.” – Frase do filme Menina de Ouro.
'

#Insere ao final do arquivo ~/.bash_profile(apenas logon como foi meu entedimento dos requisitos).
#!Lembrando que poderia ser no arquivo  ~/.bashrc (todo shell interativo), isso já poderia ficar chato ou fazer o usuário perder o foco
function update_bashProfile() {
    targetFile=~/"bash_profile"
    if [ ! -w "$targetFile" ]; then
        if [ -f "$targetFile" ]; then
            echo "Sem acesso ao arquivo $targetFile para gravar as alterações necessárias"
            return 255
        else
            touch "$targetFile"
        fi
    fi
    extraLine=". ~/scripts/motivational.sh"
    if ! grep "$extraLine" <"$targetFile" >/dev/null ; then
        echo "$extraLine" >>$targetFile
    fi
    #permite a execução e posterior alteração do arquivo, afinal, é do usuário mesmo
    chmod u=+rwx "$targetFile"
}

#Grava todos os arquivos acessórios para a funcionalidade
function write_extraFiles() {
    targetDir=~/"scripts/"
    phrasesFile="${targetDir}motivational.txt"
    scriptFile="${targetDir}motivational.sh"
    if [ ! -d "$targetDir" ]; then
        mkdir "$targetDir"
    fi
    echo "$MOTIVATIONAL_LEROLERO" >"$phrasesFile"
    subScriptContent=$(type show_motivationalPhrase | sed '1,3d;$d') #Custou a achar isso..... até que bash não é tão ruim assim rsrssr
    echo '#!/bin/bash' >"$scriptFile"
    echo "$subScriptContent" >>"$scriptFile"
    chmod u=+rwx "$scriptFile"
}

function show_motivationalPhrase() {
    phraseFile="$HOME/scripts/motivational.txt"
    if [ -f "$phraseFile" ]; then
        lines=$(wc -l <"$phraseFile")
        idx=$((1 + $((RANDOM % "${lines}"))))
        printf -v cmd "sed -e '%qq;d' -r %s" "$idx" "$phraseFile"
        eval "$cmd"
    else
        echo -e "Uma pena!\nAinda não temos frases motivacionais em \"$phraseFile\" para lhe mostrar."
    fi
}

function main() {
    show_motivationalPhrase #Apenas como exemplo pra ficar bonito
    write_extraFiles
    update_bashProfile
}

#ponto de entrada(main)
if main; then
    echo "Script finalizado com sucesso!"
fi
