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
# Zadanie 7.
# Przeanalizować zawartość pliku `dodatkowe/kant.txt` i wyodrębnić z niego
# możliwe dane kontaktowe – obecne tam adresy e-mail oraz numery telefonów.
# Numery telefonów mogą być rozdzielone pomocniczymi separatorami, dodanymi
# dla czytelności, a także być poprzedzone kodami kraju – należy je wtedy
# także wyodrębnić.
#

grep -oP '(\+|00)?[0-9\ \-]{7,}' dodatkowe/kant.txt | sed 's/^[ \t]*//'
# sed do usuniecia leading spacji
grep -oE "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" dodatkowe/kant.txt

# Ten regex na nr telefonu jest raczej kiepski. Bez wyszczególnionego kraju
# to moze być trudne do napisania. Bez wyszczególnienia czy numery są lokalne,
# czy międzynarodowe, tym bardziej.

# W aplikacjach najczęściej kod kraju pobiera się oddzielnie, albo zabrania
# uzywania seperatorów w inpucie, co znacząco ułatwia sprawę.

# Tutaj regex jest trochę pazerny i moze zwrócić trochę więcej niz potrzeba.

# Mailowy regex za to jest całkiem spoko. 
# Zadziała raczej we wszystkich przypadkach.