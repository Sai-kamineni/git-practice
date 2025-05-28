#!bin/bash

#index starts from 0
FRUITS=("APPLE" "KIWI" "BANANA")  #Array

echo "First fruit is: ${FRUITS[0]}"
echo "Second fruit is: ${FRUITS[1]}"
echo "Third fruit is: ${FRUITS[2]}"

echo "First fruit is: ${FRUITS[@]}"