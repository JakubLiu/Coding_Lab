#!/bin/bash


# Dla pliku R_norvegicus000020085003.vcf wyświetl na ekran wszystkie polimorfizmy zlokalizowane:


wget http://theta.edu.pl/wp-content/uploads/2020/01/R_norvegicus000020085003.vcf_.txt

#*********************************************************************************************************************************************


# na chromosomie 11

chr_11_poly=$(grep "Chr11" R_norvegicus000020085003.vcf_.txt)

echo "polimorfizmy zlokalizowane na chromosomie 11: " $chr_11_poly

# poprostu grepujemy sobie chromosom 11 i wypisujemy go na std out

# *************************************************************************************************************************************



# w pozycji „103508890”

pos=$(grep '103508890' R_norvegicus000020085003.vcf_.txt)

echo "polimorfizmy w pozycji 103508890: ", $pos

# też poprostu grepujemy sobie tą pozycje i printujemt na std out


# *****************************************************************************************************************************


# w pozycji, która zaczyna się od liczb „103”

pos_begin=$(awk -F '\t' '$2 ~ /^103/' R_norvegicus000020085003.vcf_.txt)

echo "pozycje rozpoczynające się od "103": ", $pos_begin


# robimy awk
# awk z regexem
# temu regexowi podlega tylko 2 pole a separatorem pól jest tabulator
# nie specyfikujemy, które pole mamy wyprintować, więc by defualt printuje nam całą linijke (czyli $0)



# ***************************************************************************************************************************************************


# w pozycji, która zaczyna się od liczb „103” na chromosomie 7

pos_begin_chrom=$(grep 'Chr7' R_norvegicus000020085003.vcf_.txt | awk -F '\t' '$2 ~ /^103/')

echo " pozycje rozpoczynające się od "103" zlokalizowane na chromosomie 7: ", $pos_begin_chrom

# poprostu najpierw robimy grepa na ten chromosom a potem to samo awk co w poprzednim podzadaniu







rm R_norvegicus000020085003.vcf_.txt
