#!/bin/bash

echo "Type ^C (ctrl + c) to exit"
while [ TRUE ]
do
	read -s -p "Type your pass: " pass
	echo
	read -s -p "Type your pass(again): " pass2
	echo
	if [[ $pass != $pass2 ]]
	then
			echo "passwords don't match" >&2
			echo "---------------------"
			continue
	fi
	read -p "Type rotation position: " rot

	if [[ -z $rot ]]
	then
			echo "please add rotational position (int)" >&2
			echo "---------------------"
			continue
	fi
	if (($rot >= 26))
	then
			echo "second argument can not be greater than 25" >&2
			echo "---------------------"
			continue
	elif (($rot < 1))
	then
			echo "first argument can not be lower than 1" >&2
			echo "---------------------"
			continue
	fi
	
	arr=()
	for i in {{a..z},{A..Z}}
	do
			arr+=($i)
	done

	echo $pass | tr a-zA-Z ${arr[$rot]}-za-${arr[$rot-1]}${arr[$rot+26]}-ZA-${arr[$rot+25]}
	echo "---------------------"
done
