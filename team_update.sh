
#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

#Request teamname for the id 
echo "Enter Team Name: "
read editID

#Menu for options to update 
echo "================================================================="
echo "| SOCCERTEAM DBMS 
|"
echo "| Update Team - Select Desired Team To Update:
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-----------------------------------------------------------------"
echo " $IS_SELECTED2 1) Update Wins"
echo " $IS_SELECTED3 2) Update Losses"
echo " $IS_SELECTED4 3) Update Ties"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo "Choose: "
read CHOICE

#Update wins 
if [ "$CHOICE" == "1" ]
then
echo "Enter new value: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE Teams
    SET WINSTHISSEASON = $newData
    WHERE TeamName = '$editID';
EOF

#Update losses
elif [ "$CHOICE" == "2" ]
then
echo "Enter new value: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE Teams
    SET LOSSESTHISSEASON = $newData
    WHERE TeamName = '$editID';
EOF

#Update ties 
elif [ "$CHOICE" == "3" ]
then
echo "Enter new value: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE Teams
    SET TIESTHISSEASON = $newData
    WHERE TeamName = '$editID';
EOF

#Exit to menu
elif [ "$CHOICE" == "E" ]; then
    echo "Exiting..."

else
    echo "Invalid choice. Exiting..."
fi
