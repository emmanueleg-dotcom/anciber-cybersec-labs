#!/bin/bash
# Verification and configuration of permissions based on FEX011

mkdir -p SO/permissoes
touch SO/permissoes/ficheiro.txt

echo "[+] Setting Symbolic permissions..."
# Owner: read+execute (r-x), Group: read (r--), Others: no permission (---)
chmod u=rx,g=r,o= SO/permissoes/ficheiro.txt
chmod u=rx,g=r,o= SO/permissoes

echo "[+] Verifying current permissions:"
ls -ld SO/permissoes
ls -l SO/permissoes/ficheiro.txt

echo "[+] Resetting and setting Octal permissions (equivalent to 540):"
# 5 (read+execute) | 4 (read) | 0 (none)
chmod 540 SO/permissoes/ficheiro.txt
chmod 540 SO/permissoes
