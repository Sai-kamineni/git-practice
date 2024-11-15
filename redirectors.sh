#!/bin/bash

ls -ltr >output.txt   ##Wirite into file 

ls -ltr 1>output.txt   #wries only success messages

ls -tt 2>output.txt   #writes only error messages

ls -ltr &>output.txt  #Writes both succes and error messages

ls -ltr &>>output.txt ##append

echo $(date) | teaa -a output.text #print on screen and writes into txt file

echo -e "\e[31m Please run this script with root priveleges \e[0m" | tee -a output.txt