#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Laboratory exercise replicating list manipulation and file writing.
"""

import time

# --- STEP 1: Initialize shopping cart and display current items ---
shopping_cart = ["juice"]
size = len(shopping_cart)

print(f"\nYour list has {size} items\n")
for p in shopping_cart:
    print("Item: ", p)

# --- STEP 2: Receive and clean user input to update the list ---
entry = input("\nWhich items do you want to add? (separate with commas) \n\n")

# .split(",") divides the text by commas, and .strip() removes accidental spaces
new_items = [x.strip() for x in entry.split(",") if x.strip()]
shopping_cart.extend(new_items)

time.sleep(2)

# --- STEP 3: Display updated list and save permanently to file ---
size = len(shopping_cart)
print(f"\nYour list now has {size} items")

for p in shopping_cart:
    print("\nItem: ", p)

# Open file in append mode ('a') so it adds lines without erasing previous data
with open("shopping_list.txt", "a") as f:
    for p in shopping_cart:
        f.write(p + "\n")

print("List saved to shopping_list.txt")
