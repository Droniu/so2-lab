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
# Zadanie 9.
# Proszę wyświetlić komentarze z bieżącego pliku z zadaniami ($0), wstawiając
# znaki niełamliwej spacji języka HTML (&nbsp;) za wszystkimi pojedynczymi
# literami w tekście.
#

awk '
/^#/ {
    for (i=1;i<=NF;i++) {
        if (match($i, /[a-zA-Z]/) && length($i)==1) {
            $i = $i "&nbsp;"
        }
    }
    print $0
}
' $0 | sed 's/&nbsp; /\&nbsp;/g'