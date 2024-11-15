#!/bin/bash

LOG_FOLER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)  #print in format 2024-11-15-10-45-55
LOG_FILE="$LOG_FOLER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLER   #creates folder if not created

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root priveleges $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N" &>>$LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, installing it.." &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package" 
    else
        echo -e "$Y $package is already installed $N" &>>$LOG_FILE
    fi   
done