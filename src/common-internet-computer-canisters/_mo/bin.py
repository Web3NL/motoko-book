#!/usr/bin/env python3

import sys

def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <filename>")
        sys.exit(1)

    filename = sys.argv[1]

    try:
        with open(filename, 'rb') as f:
            data = f.read()
    except FileNotFoundError:
        print(f"Error: File {filename} not found.")
        sys.exit(1)

    nat8_array = ';'.join([str(x) for x in data])
    print(nat8_array)

if __name__ == "__main__":
    main()
