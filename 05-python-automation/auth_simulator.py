#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Laboratory simulating basic user authentication and dynamic age checking.
"""

# --- STEP 1: Collect authentication credentials ---
username = input("Enter username: ")
password = input("Enter password: ")

# --- STEP 2: Validate credentials using logical AND ---
if username == "admin" and password == "1234":
    print(f"Access granted. Welcome, {username}!")
    
    # --- STEP 3: Dynamic age calculation ---
    # Converts string inputs to integers to perform arithmetic operations
    birth_year = int(input("Enter your birth year: "))
    current_year = 2026
    
    age = current_year - birth_year
    print(f"Your approximate age is: {age} years old.")
    
else:
    print("Access Denied!")
