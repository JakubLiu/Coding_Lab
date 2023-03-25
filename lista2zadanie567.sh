#!/bin/bash


# tutaj poprostu printujemy sobie opcje do wyboru

echo " 1. pokaż zalogowanych użytkowników"
echo " 2. wylistuj zawartość bieżącego katalogu"
echo " 3. pokaż ścieżkę do bieżącego katalogu"
echo " 4. wyświetl aktualną datę i godzinę"
echo " "




read -n 1 -t 15 -p "Podaj numer komendy, którą chcesz wykonać: " variable


# read czyta input od użytkownika
# -n ==> definiuje liczbę znaków, które mogą być inputem od użytkownika
# -t ==> ile sekund mamy na odpowiedź
# -p ==> wypisz prompt do użytkownika



# poprostu struktura case - esac

case $variable in 
	"1")
		whoami
		;;
	"2")
		ls -l
		;;
	"3")
		pwd
		;;
	"4")
		date
		;;
	*)
		echo " "
		echo "wybierz inną opcję"
		;;
esac


