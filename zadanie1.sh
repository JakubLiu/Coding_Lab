#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

wget http://theta.edu.pl/wp-content/uploads/2018/10/Neomys_fodiens_A.txt
wget http://theta.edu.pl/wp-content/uploads/2018/10/Neomys_fodiens_B.txt


# ********************************************************************************************************************************************************


# ile SNP znajduje się w każdym z plików

x=$(wc -l Neomys_fodiens_A.txt)
echo $x

y=$(wc -l Neomys_fodiens_B.txt)
echo $y



# ***********************************************************************************************************************************************************



# ile razy nukleotyd A z genomu referencyjnego został wymieniony na inny nukleotyd

A=$(awk -F '\t' '{print $4, $5}' Neomys_fodiens_A.txt | grep 'A [G,C,T]' | wc -l)
echo  "Neomys_fodiens_A.txt" $A

B=$(awk -F '\t' '{print $4, $5}' Neomys_fodiens_B.txt | grep 'A [G,C,T]' | wc -l)
echo  "Neomys_fodiens_B.txt" $B



# przez awk wybierz kolumny REF i ALT
# poprzez grep wybierz to co ma w pierwszej kolumnie A i jakikolwiek nukleotyd w drugiej kolumnie
#		- separatorem kolumn jest spacja
#		- musi być [G,C,T] bo teoretycznie mogła by być delecja a tego nie chcemy
# wc -l liczy poprostu liczbe wierszy




# ***************************************************************************************************************

# wypisze do nowego pliku SNP, które są dokładnie takie same u obu zwierząt 


awk -F '\t' '{print $4, $5}' Neomys_fodiens_A.txt > snp_A.txt
awk -F '\t' '{print $4, $5}' Neomys_fodiens_B.txt > snp_B.txt

comm --nocheck-order snp_A.txt snp_B.txt | awk -F '\t' '{print $3}' > common_snps.txt

comm --nocheck-order -1 -2 snp_A.txt snp_B.txt > common_snps2.txt

# najpierw wypisujemy sobie SNPy obu zwierząt do odpowiednich plików
# potem używamy "comm" aby znaleźc część wspólną
# otput po "comm" ma 3 kolumny, pierwsza to unikalne dla pliku 1, druga to unikalne dla pliku 2, trzecia to wspólne dla obu plików
# wyłuskujemy trzecią kolumnę poprzez awk lub poprzez NIE printowanie 1 i 2 kolumny


# ***********************************************************************************************************************
rm Neomys_fodiens_A.txt
rm Neomys_fodiens_B.txt
rm snp_A.txt
rm snp_B.txt
