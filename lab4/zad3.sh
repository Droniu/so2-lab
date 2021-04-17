#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 4 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w pracy z programem `find`,
# wykorzystując przy tym wiedzę na temat struktury systemu plików itd.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego
# wywołania programu `find` z odpowiednimi argumentami.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#
# Punkt startowy powinien stanowić katalog ze źródłami: linux-5.11.13/
#

#
# Zadanie 3.
# Policzyć ile plików zwykłych znajduje się w źródłach systemu Linux.
# Jako wynik zwrócić tylko i wyłącznie liczbę plików.
#

# ----------------------------------------------------------------
# odkomentować na linuksie
# alias gfind=find
# alias gwc=wc
# ----------------------------------------------------------------
gfind . -type f | gwc -l

# Zamiast oczekiwanego 71242 wychodzi mi 71229. Wydaje mi się, że
# jest to poprawna odpowiedź. Różnica może wynikać z tego, że
# niektóre pliki mają w nazwie newline, co zmienia zachowanie wc.

# Tutaj komenda drukująca kropkę przy znalezieniu pliku, a następnie
# zliczająca kropki. Powinna zwracać wszędzie 71229.
# gfind linux-5.11.13/ -type f -printf "." | wc -c

