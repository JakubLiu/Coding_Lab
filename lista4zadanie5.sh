#!/bin/bash


# ten program jest self explanatory


actual_capital="Canberra"

read -p "Jaka jest stolica Kanady:  " capital



while [ "$actual_capital" != "$capital" ]

do
	echo "Nie, " $capital " nie jest stolicą Kanady."
	echo " "
	echo " "
	read -p "Jaka jest stolica Kanady:  " capital
done

echo " "
echo " "
echo "Tak, Canberra jest stolicą Kanady."
