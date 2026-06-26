#!/bin/bash
flaga=$1
liczba=$2
skrypt=$0

if [ "$flaga" = "--date" ]; then
    date
elif [ "$flaga" = "--logs" ]; then
    if [ -z "$liczba" ]; then
        ile=100
    else
        ile=$liczba
    fi

    for (( i=1; i<=ile; i++ ))
    do
        echo "plik: log${i}.txt, utworzony przez: $skrypt, data: $(date)" > "log${i}.txt"
    done
elif [ "$flaga" = "--help" ]; then
    echo "dostepne opcje:"
    echo "--date : wyswietla dzisiejsza date"
    echo "--logs [liczba] : tworzy pliki log (domyslnie 100)"
    echo "--help : wyswietla to menu pomocy"
fi
