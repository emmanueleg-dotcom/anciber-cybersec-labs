#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Advanced file handling laboratory replicating line-by-line reading, 
             string parsing, and log generation.
"""

# --- STEP 1: Setup a dummy sample file for testing if needed ---
# This ensures the script has something to read during execution
with open("exercise_random.txt", "w") as setup_file:
    setup_file.write("First sample log line\nSecond sample log line\nThird sample log line\n")

# --- STEP 2: Read the entire file content at once ---
# Based on lines 1-3 of your 'ficheiro.py'
with open("exercise_random.txt", "r") as f:
    content = f.read()
    print("--- Full Content Read ---")
    print(content)

# --- STEP 3: Audit and print the file line by line using stripping ---
# Based on lines 5-7 of your 'ficheiro.py' (removes hidden \n formatting)
print("--- Line-by-Line Iteration ---")
with open("exercise_random.txt", "r") as f:
    for line in f:
        print("Line Data:", line.strip())

# --- STEP 4: Write output data into a separate text file (Append Mode) ---
# Based on lines 10-12 of your 'ficheiro.py'
with open("output_report.txt", "a") as f:
    f.write("First output log row\n")
    f.write("Second output log row\n")

print("\nExecution complete. Output saved to 'output_report.txt'.")
