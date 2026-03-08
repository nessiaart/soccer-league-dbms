

#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

#Get user input for name and username
echo "Enter your name: "
read -r VIEWERNAME

echo "Enter your username: "
read -r USERNAME

#check if username is inuse and store to variable, turn off headers so we only get count value  
result=$(sqlplus64 -S "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
SET HEADING OFF FEEDBACK OFF VERIFY OFF
SELECT COUNT(*) FROM AdminLogins WHERE Username='$USERNAME';
EOF
)

#If count doesnt find anything prompt for password
if [ "$result" -eq 0 ]; then
    echo "Enter your password: "
    read -r PASSKEY

    # Insert the new user account into the AdminLogins table
    sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    INSERT INTO AdminLogins VALUES ('$VIEWERNAME', '$USERNAME', '$PASSKEY');
EOF
#Success message
    echo "Account created successfully!"
#failure message 
else
    echo "Account with the username $USERNAME already exists. Please choose a different username."
fi
