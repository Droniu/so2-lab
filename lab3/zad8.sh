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
# Zadanie 8.
# Odszukać w katalogu `ccc` wiszące dowiązania i podjąć próbę ich naprawy
# – zakładamy, że wskazywane przez nie nazwy plików są poprawne, ale doszło
# do jakiegoś zamieszania w strukturze katalogów. Należy odszukać pasujących
# plików w katalogach `aaa` i `bbb`, a jeśli odpowiednie pliki istnieją
# to wyświetlić nazwę dowiązania i po dwukropku proponowaną poprawną ścieżkę
# (na przykład: bravo:../aaa/bravo).
#

# odkomentować na linuksie
# alias gfind=find
# alias grealpath=realpath

touch temp_zad8
# dowiązania zepsute, czyli wiszące lub cykliczne (zad5)
gfind ccc/ -type l -exec test ! -e {} \; -print >> temp_zad8
# w sumie chyba najlepszy sposób do czytania pliku linia po linii
while read line; do
    evaluate=$(gfind aaa/ bbb/ -name $(basename $line) -print) #
    # jeśli zmienna nie jest pusta (czyli znalazło plik)
    if ! [ -z $evaluate ]; then
        printf "$(basename $line):$(grealpath -ms --relative-to=ccc/ $evaluate) \n"
    fi
done < temp_zad8
rm -f temp_zad8 

