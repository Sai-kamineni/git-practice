#!bin/bash

##Checking user is root or not

USERID=$(id -u)
#echo "User ID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root user"
    exit 1
fi


###Installing git

dnf list installed git   #checking wheter installed or not

if [ $? -ne 0 ]
then 
    echo "Git is not installed, installing the git"
    dnf install git -y  
    VALIDATE $? "Installing Git"
else 
    echo "Git is already installed"
fi

###Installing mysql

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, installing the mysql"
    dnf install mysql -y  
    VALIDATE $? "Installing Mysql"
else 
    echo "mysql is already installed"
fi
