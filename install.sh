#!bin/bash

##Checking user is root or not

USERID=$(id -u)
#echo "User ID is: $USERID"


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
    if [ $? -ne 0 ]
    then 
        echo "Git installation is not completed, please check"
        exist 1   #script exist here
    else    
        echo "Git installation completed"
    fi
else 
    echo "Git already installed"
fi

###Installing mysql

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed, installing the mysql"
    dnf install mysql -y  
    if [ $? -ne 0 ]
    then 
        echo "mysql installation is not completed, please check"
        exist 1   #script exist here
    else    
        echo "mysql installation completed"
    fi
else 
    echo "mysql already installed"
fi
