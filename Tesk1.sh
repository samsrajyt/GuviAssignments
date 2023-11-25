#!/bin/bash

touch file{1..20}.txt
for i in `ls |head -5`;do mv $i `echo $i | cut -f 1 -d '.'`.yml;done
echo "Hello World"
echo "Edited once again"
