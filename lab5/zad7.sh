#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 5 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w pracy z mechanizmem łącz
# nienazwanych, wykorzystując przy tym szereg podstawowych narzędzi
# do przetwarzania danych tekstowych.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#

#
# Zadanie 7.
# Odnaleźć w pliku `dodatkowe/ps-aux` proces, który zużywa najwięcej czasu
# procesora (trzecia kolumna). Jako wynik zwrócić numer procesu (druga kolumna)
# oraz po spacji pełną nazwę procesu (wszystko od 11 kolumny do końca wiersza).
#

tail -n+2 dodatkowe/ps-aux | awk '
    BEGIN {max=0}
    {if ($3>max){
        max=$3
        row=$0
    }} 
    END {
        $0 = row
        printf "%i ", $2
        for(i=11;i<=NF;i++){
            printf "%s", $i
            if (i!=NF) {
                printf " "
            }
        }
        printf "\n"

    }
' 

# if (i!=NF) { printf " " }
# zapobiega dodatkowej spacji na koniec stringa, która dawała fałszywy wynik
# po uruchomieniu ./testuj-rozwiazania.