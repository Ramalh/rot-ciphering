#!/bin/bash

if [[ $2 == "" ]]
then
		echo add second argument
		exit 0
fi

if (($2 > 26))
then
		echo second argument can not be greater than 25
		exit 0
elif (($2 < 1))
then
		echo first argument can not be lower than 1
		exit 0
fi

arr=()
for i in {{a..z},{A..Z}}
do
		arr+=($i)
done

echo $1 | tr a-zA-Z ${arr[$2]}-za-${arr[$2-1]}${arr[$2+26]}-ZA-${arr[$2+25]}

