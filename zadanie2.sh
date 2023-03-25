#!/bin/bash


# grep '>' duplikacje.Btaurus.txt | awk -F ':' '{print $2}' | awk -F '-' '{print$2-$1}'


wget http://theta.edu.pl/wp-content/uploads/2019/12/duplikacje.Btaurus.txt

#*******************************************************************************************************************************************************

# nagłówków

grep '>' duplikacje.Btaurus.txt | awk -F ':' '{print $2}' | awk -F '-' '{print$2-$1}'


# grepujemy nagłówki
# awk definiujemy pola i odejmujemy je od siebie



# ***************************************************************************************************************************************************
# sekwencji

awk 'BEGIN{RS="\t"} {print $2}' duplikacje.Btaurus.txt | wc -c
awk 'BEGIN{RS="\t"} {print $4}' duplikacje.Btaurus.txt | wc -c
awk 'BEGIN{RS="\t"} {print $6}' duplikacje.Btaurus.txt | wc -c
awk 'BEGIN{RS="\t"} {print $8}' duplikacje.Btaurus.txt | wc -c


# RS to row/record separator
# wc -c ==> -c to character
