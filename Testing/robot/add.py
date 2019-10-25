#! /usr/bin/env python3
from sys import argv


if len(argv) <= 1:  raise ValueError("No args")
print("Result of ({}) is {}".format(
    '+'.join(argv[1:]), sum(map(int, argv[1:]))))
