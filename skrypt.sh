#!/bin/bash
flaga=$1
liczba=$2
skrypt=$0

if [ "$flaga" = "--date" ]; then
    date
elif [ "$flaga" = "--logs" ]; then
    # sprawdzamy czy podano liczbe na chlopski rozum (czy zmienna jest pusta)
    if [ -z "$liczba" ]; then
        ile=100
    else
        ile=$liczba
    fi

    # petla ktora kreci sie od 1 do naszej liczby docelowej
    for (( i=1; i<=ile; i++ ))
    do
        echo "plik: log${i}.txt, utworzony przez: $skrypt, data: $(date)" > "log${i}.txt"
    done
fi
