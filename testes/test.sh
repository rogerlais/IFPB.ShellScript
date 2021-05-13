

function maior {
	if [ $1 -gt $2 ]; then
		echo "$1"
	else
		echo "$2"
	fi
}


function menor {
	if [ $1 -lt $2 ]; then
		echo "$1"
	else
		echo "$2"
	fi
}

max=0
min=0
list=( -1 -2 -3 -4 -5 -6 -7)

for number in "${list[@]}"; do
	max=$(maior $max $number)
	min=$(menor $min $number)
done



for number in $(cat numbers.txt | tr '\n' ' '); do
	max=$(maior $max $number)
	min=$(menor $min $number)
done

echo "O maior número da lista é $max"
echo "O menor número da lista é $min"