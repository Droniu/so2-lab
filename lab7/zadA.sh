#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 7 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z wyrażeniami regularnymi, wykorzystując
# przy tym narzędzia awk i grep oraz wszystkie inne, poznane na zajęciach.
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
# Zadanie 10.
# Proszę opracować uproszczony konwerter plików z formatu JSON do formatu XML
# i przetworzyć nim plik `dodatkowe/simple.json`. Zakładamy, że wejście stanowi
# zawsze pojedyncza linia, klucze i wartości to proste łańcuchy znaków, złożone
# z liter lub cyfr, pomiędzy cudzysłowami, które są rozdzielone jednym znakiem
# dwukropka i co najmniej jedną spacją, a całe pary klucz-wartość są oddzielone
# od siebie jednym przecinkiem i co najmniej jedną spacją.
#
# Przykład przetworzenia: {"klucz": "wartość"} -> <klucz>wartość</klucz>.
#
# Proszę obsłużyć tworzenie samodomykającego się znacznika (<klucz />), kiedy
# wartość stanowi pusty łańcuch "", a także proszę obsłużyć zagnieżdżenie
# kolejnego zbioru kluczy i wartości.
#



json_parser () {
    # Usuwamy trailing i leading {}, cudzysłowy i spacje
    echo $1 | \
    sed 's/^{//' | \
    sed 's/}$//' | \
    sed 's/[ "]//g' | \
    # Po wielu godzinach pracy stwierdzam ze potrzebuję w tym przypadku
    # PCRE i mozliwość look-ahead. To trochę oszukiwanie, bo jeśli mamy perla
    # to czemu by nie pythona uzyć, ale naprawdę nie mam innego pomysłu
    # Tak więc:
    perl -pe 's/,(?![^{]*})/\n/g' | \
    gawk -F':' '
    !/[{}]/{
        if ($2) {
            printf "<" $1 ">" $2 "</" $1 ">"
        } else {
            printf "<" $1 " />"
        }
    }
    /[{}]/{
        printf "<" $1 ">"
        # i tu jest prawdziwa zabawa bo funkcja jest odpalana rekursywnie
        system("./zadA.sh \x22" substr($0, index($0,$2)) "\x22")
        printf "</" $1 ">"
    }'
}
# Jeśli skrypt jest odpalony bez argumentów to odpala simple.json
if [ "$1" = "" ]
then
    json_parser "$(cat dodatkowe/simple.json)"
    printf "\n"
else
    # z argumentami przetwarza argument
    json_parser $1
fi
