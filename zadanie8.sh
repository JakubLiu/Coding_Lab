#!/bin/bash

# QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------

# krok 1, pobranie danych____________________________________________________________________________________________________________________________________
mkdir /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/files

awk -F ',' '{print $1}' rmdup_files.txt | xargs -n1 wget -P /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/files

# dowiedzieć się o składnie, zwłaszcza po 


cd /mnt/c/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/SEMESTR_V/PRACOWNIA_INFORMATYCZNA/files

pwd

ls -lrt > list.txt

wc -l list.txt

# teraz jak zrobić to samo dla wszystkich plików w files:/

