#!/bin/bash

read -s -p 'Type your pass: ' pass
echo
read -p 'Type rotation position: ' rot

if [[ $rot == "" ]]
then
		echo add second argument
		exit 0
fi

if (($rot > 26))
then
		echo second argument can not be greater than 25
		exit 0
elif (($rot < 1))
then
		echo first argument can not be lower than 1
		exit 0
fi

arr=()
for i in {{a..z},{A..Z}}
do
		arr+=($i)
done

echo $pass | tr a-zA-Z ${arr[$rot]}-za-${arr[$rot-1]}${arr[$rot+26]}-ZA-${arr[$rot+25]}

