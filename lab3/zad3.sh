#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3 – semestr letni 2020/2021
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
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
# Zadanie 3.
# Utworzyć w katalogu `ddd` dowiązania do wszystkich plików wykonywalnych
# z katalogu `aaa`. Nazwy tworzonych dowiązań mają pokrywać się z nazwami
# oryginalnych plików. Rodzaj dowiązania nie ma znaczenia, ale należy
# upewnić się, że nie zmienimy żadnych istniejących plików w `ddd`.
#

# --------------------------------

# patrząc na doświadczenie z poprzednich labów, zainstalowałem sobie
# GNU find, który ma więcej funkcji niż ten BSD (defaultowy na macu)

# komenda to gfind, więc takowej będę używać. Aby skrypt działał na linuksie
# należy odkomentować poniszą linijkę
# alias gfind=find

touch zad3_tempnames

gfind aaa/ -executable -type f -exec basename {} \; >> zad3_tempnames

# nie wiem czy traktujemy folder aaa/ jako plik wykonywalny
# (opcja -executable twierdzi, że tak). Jeśli tak, należy usunąć z find
# opcję -type f

count=$(wc -l < ./zad3_tempnames )
for i in $(seq 1 $count)
do
    tempLine=$(sed -n "$i p" zad3_tempnames)
    
    if [ -e "ddd/$tempLine" ]; then
        echo "Plik ddd/$tempLine już istnieje."
    else
        ln -v "aaa/$tempLine" "ddd/$tempLine"
    fi
done

rm -f zad3_tempnames