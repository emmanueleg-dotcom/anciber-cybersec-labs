#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Validates a list of network ports to ensure they reside 
             within the correct protocol range (0 - 65535).
"""

# Lista misturada de portas para teste (algumas válidas, outras inválidas)
raw_ports_list = [22, 80, 443, 8080, 70000, -5, 993, 100000]

valid_ports = []
invalid_ports = []

print("=== Analyzing Network Port Range ===")

# Ciclo for com condições compostas para validação
for port in raw_ports_list:
    if port >= 0 and port <= 65535:
        valid_ports.append(port)
    else:
        invalid_ports.append(port)

# Resultados formatados
print(f"[+] Valid network ports found: {valid_ports}")
print(f"[-] Invalid network ports rejected: {invalid_ports}")
