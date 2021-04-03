#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
#
# Przygotowane rozwiązania nie muszą być całkowicie uniwersalne. Zakładamy,
# że ogólna struktura katalogów się nie zmienia (nie będzie już więcej/mniej
# poziomów podkatalogów), jednakże same nazwy i zawartości plików (o ile
# nie są podane wprost w treści zadań) mogą być dowolne i ulegać zmianie,
# a przygotowane rozwiązania nadal powinny działać.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 9.
# W katalogu `zasoby` w `ddd` utworzyć plik `tajne hasła`, który zawierać
# będzie połączoną treść wszystkich plików z katalogu `ccc` (oraz jego
# podkatalogów) – ale tylko takich, które potrafimy przeczytać. Niech każda
# nowa zawartość będzie poprzedzona jakimś wyróżniającym się nagłówkiem
# z nazwą pliku z którego ona pochodzi. Upewnić się także, że w trakcie
# procesu nie zgłoszą nam się problemy z dostępem do plików (to znaczy,
# że na pewno możemy je przeczytać).
#

rm -f "ddd/zasoby/tajne hasła"
touch "ddd/zasoby/tajne hasła"
touch zad9_tempfiles
touch zad9_tempcontents

find ccc/ -type f -perm +444 > ./zad9_tempfiles
find ccc/ -type f -perm +444 -exec cat {} \; > ./zad9_tempcontents

count=$(wc -l < ./zad9_tempfiles )

for i in $(seq 1 $count)
do
    tempLineFile=$(sed -n "$i p" zad9_tempfiles)
    tempLineContent=$(sed -n "$i p" zad9_tempcontents)
    
    echo '°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸' >> "ddd/zasoby/tajne hasła"
    echo "Zawartość pliku $tempLineFile" >> "ddd/zasoby/tajne hasła"
    echo '°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸' >> "ddd/zasoby/tajne hasła"
    echo "$tempLineContent" >> "ddd/zasoby/tajne hasła"
    echo "" >> "ddd/zasoby/tajne hasła"

done

rm zad9_tempfiles
rm zad9_tempcontents


# zapewne zrobiłem to totalnie naokoło i mozna to zrobić w 3 linijki,
# ale efekt chyba jest taki jaki powinien być xD