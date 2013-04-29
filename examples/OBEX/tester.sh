#!/bin/bash

#        conenction test
./../../src/stress -a connection.bnf -d E8:E5:D6:FE:6C:F9 -p 7 --generator 1 -M -t 15000 -o output_connection.xml
