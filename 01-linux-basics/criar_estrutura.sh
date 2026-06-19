#!/bin/bash
# Script developed based on ANCiber FEX010 - File System Structure

echo "[+] Creating directory tree structure..."
mkdir -p SO/documentos SO/fotos SO/musica SO/temporaria

# Create text files
touch SO/documentos/despesas.txt SO/documentos/facturas.txt SO/documentos/férias.txt
touch SO/musica/acdc.mp3 SO/musica/queen.mp3 SO/musica/u2.mp3
touch SO/temporaria/notas.txt
touch SO/passwords.txt

# Writing custom text to despesas.txt
echo "ANCiber Lab - Expense Log: EUR 0.00" > SO/documentos/despesas.txt

echo "[+] Structure created successfully! Verifying with 'tree' command:"
if command -v tree &> /dev/null; then
    tree SO/
else
    ls -R SO/
fi
