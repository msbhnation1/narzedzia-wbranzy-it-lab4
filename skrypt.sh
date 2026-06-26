#!/bin/bash
flaga=$1
liczba=$2
skrypt=$0

if [ "$flaga" = "--date" ] || [ "$flaga" = "-d" ]; then
    date
elif [ "$flaga" = "--logs" ] || [ "$flaga" = "-l" ]; then
    if [ -z "$liczba" ]; then
        ile=100
    else
        ile=$liczba
    fi

    for (( i=1; i<=ile; i++ ))
    do
        echo "plik: log${i}.txt, utworzony przez: $skrypt, data: $(date)" > "log${i}.txt"
    done
elif [ "$flaga" = "--help" ] || [ "$flaga" = "-h" ]; then
    echo "dostepne opcje:"
    echo "--date, -d : wyswietla dzisiejsza date"
    echo "--logs, -l [liczba] : tworzy pliki log (domyslnie 100)"
    echo "--error, -e [liczba] : tworzy pliki error (domyslnie 100)"
    echo "--init : klonuje repozytorium"
    echo "--help, -h : wyswietla to menu pomocy"
elif [ "$flaga" = "--init" ]; then
    git clone https://github.com/msbhnation1/narzedzia-wbranzy-it-lab4.git
    export PATH=$PATH:$(pwd)/narzedzia-wbranzy-it-lab4
    echo "repozytorium sklonowane i dodane do PATH"
elif [ "$flaga" = "--error" ] || [ "$flaga" = "-e" ]; then
    if [ -z "$liczba" ]; then
        ile=100
    else
        ile=$liczba
    fi

    for (( i=1; i<=ile; i++ ))
    do
        mkdir -p "error${i}"
        echo "plik: error${i}.txt, skrypt: $skrypt, data: $(date)" > "error${i}/error${i}.txt"
    done
fi
