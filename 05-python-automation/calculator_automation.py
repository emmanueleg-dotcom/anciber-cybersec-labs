#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Development: Emmanuel Egbeama
Course: ANCiber Cybersecurity
Description: Laboratory exercise replicating a continuous calculator with loop controls.
"""

# --- STEP 1: Initialize the loop control variable ---
# Based on line 3 of your classroom code
keep_going = ""

# --- STEP 2: Start the continuous operation loop ---
# The loop runs repeatedly until the user types 's' (case-insensitive via .lower())
while keep_going.lower() != "s":
    
    # Receive the two numeric inputs from the user and convert them to integers
    num1 = int(input("Enter the first number: "))
    num2 = int(input("Enter the second number: "))
    
    # Prompt the user to select the mathematical operation
    operation = input("Choose an operation (+, -, *, /): ")
    
    # --- STEP 3: Process the selected operation ---
    if operation == "+":
        result = num1 + num2
        print(f"Result: {num1} + {num2} = {result}")
        
    elif operation == "-":
        result = num1 - num2
        print(f"Result: {num1} - {num2} = {result}")
        
    elif operation == "*":
        result = num1 * num2
        print(f"Result: {num1} * {num2} = {result}")
        
    elif operation == "/":
        # Critical security and logic check: prevent crash caused by division by zero
        if num2 != 0:
            result = num1 / num2
            print(f"Result: {num1} / {num2} = {result}")
        else:
            print("Error: Division by zero is not allowed!")
            
    else:
        print("Invalid operation!")
        
    # --- STEP 4: Check if the user wants to continue or exit ---
    # Based on line 28 of your classroom code
    keep_going = input("\nType 's' to exit or any other key to continue: ")

# Final message printed outside the loop when the execution ends
print("Calculator closed!")
