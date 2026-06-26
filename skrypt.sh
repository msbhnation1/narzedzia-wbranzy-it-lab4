#!/bin/bash
flaga=$1
liczba=$2
skrypt=$0

if [ "$flaga" = "--date" ] || [ "$flaga" = "-d" ]; then
    date
elif [ "$flaga" = "--logs" ] || [ "$flaga" = "-l" ]; then
    # sprawdzamy czy podano liczbe
    if [ -z "$liczba" ]; then
        ile=100
    else
        ile=$liczba
    fi

    # petla do tworzenia plikow
    for (( i=1; i<=ile; i++ ))
    do
        echo "plik: log${i}.txt, utworzony przez: $skrypt, data: $(date)" > "log${i}.txt"
    done
elif [ "$flaga" = "--help" ] || [ "$flaga" = "-h" ]; then
    echo "dostepne opcje:"
    echo "--date, -d : wyswietla dzisiejsza date"
    echo "--logs, -l [liczba] : tworzy pliki log (domyslnie 100)"
    echo "--help, -h : wyswietla to menu pomocy"
fi
