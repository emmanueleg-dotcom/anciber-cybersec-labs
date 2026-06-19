#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Implements a basic login authentication system with a maximum 
             of 3 attempts to prevent brute-force attacks.
"""

# Credenciais fixas do sistema
USER_DEFINED = "admin"
PASSWORD_DEFINED = "segredo123"

attempts = 3

print("=== ANCiber Security Authentication System ===")

while attempts > 0:
    username = input("Username: ")
    password = input("Password: ")
    
    # Validação das credenciais
    if username == USER_DEFINED and password == PASSWORD_DEFINED:
        print("\n[+] Access Granted. Welcome to the secure environment.")
        break
    else:
        attempts -= 1
        print(f"[!] Access Denied. Invalid credentials. Remaining attempts: {attempts}\n")
else:
    # Este bloco executa apenas se o ciclo while terminar sem o 'break'
    print("[CRITICAL] Security Alert: Maximum login attempts reached. Account locked.")
