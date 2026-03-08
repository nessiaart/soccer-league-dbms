#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

#Request user input for login information
echo "Enter your name: "
read -r VIEWERNAME

echo "Enter your username: "
read -r USERNAME

#Storing count into a variable to see if there is an existing username 
result=$(sqlplus64 -S "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
SET HEADING OFF FEEDBACK OFF VERIFY OFF
SELECT COUNT(*) FROM UserLogins WHERE Viewername='$USERNAME';
EOF
)

#If result = 0 username is unique, go ahead with creating login
if [ "$result" -eq 0 ]; then
    echo "Enter your password: "
    read -r PASSKEY

    # Insert the new user account into the UserLogins table
    sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    INSERT INTO UserLogins VALUES ('$VIEWERNAME', '$USERNAME', '$PASSKEY');
EOF
#Success message
    echo "Account created successfully!"
else
#Failure message 
    echo "Account with the username $USERNAME already exists. Please choose a different username."
fi
