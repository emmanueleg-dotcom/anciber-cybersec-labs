#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Laboratory task demonstrating OS interactions, directory auditing, 
             time parsing, and pseudo-random number generation.
"""

import os
import time
import random

# --- STEP 1: Simulate program startup with a delay ---
print("Executing operation...")
time.sleep(2)

# --- STEP 2: Audit Current Directory Environment ---
# Uses the 'os' module to fetch the current path and list its content
print("Current Directory:", os.getcwd())
print("Directory Content:")
print(os.listdir())

print("Operation completed.")

# --- STEP 3: Fetch and format system time ---
current_time = time.strftime("%H:%M:%S", time.localtime())
print("Current Time:", current_time)

# --- STEP 4: Random number generation ---
# Simulates a dice roll or random selection between 1 and 6
number = random.randint(1, 6)
print("Generated Number:", number)
