#!/bin/bash
# Check if a number provided as argument is even or odd (FEX012)

if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

if (( $1 % 2 == 0 )); then
    echo "The number $1 is EVEN."
else
    echo "The number $1 is ODD."
fi
