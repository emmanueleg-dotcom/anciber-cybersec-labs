#!/bin/bash
# Tar and Archive verification script based on FEX011

mkdir -p MinhaPasta/Pastal
touch MinhaPasta/Ficheirol MinhaPasta/Ficheiro.jpg MinhaPasta/Ficheiro.txt MinhaPasta/Ficheiro.mp3

cd MinhaPasta || exit

echo "[+] Archiving Pastal, Ficheirol, Ficheiro.jpg, Ficheiro.txt..."
tar -cvf arquivo.tar Pastal Ficheirol Ficheiro.jpg Ficheiro.txt

echo "[+] Appending Ficheiro.mp3 to the archive..."
tar -rvf arquivo.tar Ficheiro.mp3

echo "[+] Listing final archive content safely without extracting:"
tar -tvf arquivo.tar
