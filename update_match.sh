
#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

#Request user input for the match ID 
echo "Enter MatchID: " 
read editID

#Menu to display all plausible things to edit for that match
echo "================================================================="
echo "| SOCCERTEAM DBMS 
|"
echo "| Edit Match Information - Select Desired Information To Edit:
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-----------------------------------------------------------------"

echo " $IS_SELECTED2 1) TeamName"
echo " $IS_SELECTED3 2) MatchStatus"
echo " $IS_SELECTED4 3) MatchDate"
echo " $IS_SELECTED5 4) MatchTime"
echo " $IS_SELECTED6 5) FinalScore"
echo " $IS_SELECTED7 6) LeadRef"
echo " $IS_SELECTED7 7) VARRef"
echo " $IS_SELECTED7 8) JuniorRef"
echo " $IS_SELECTED7 9) WinLoss"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo "Choose: "
read CHOICE

#Edit teamname 
if [ "$CHOICE" == "1" ]
then
echo "Enter new Match Info: "
read newTeam 

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET TeamName = '$newTeam'
    WHERE MatchID = '$editID';
EOF

#Edit match status 
elif [ "$CHOICE" == "2" ]
then
echo "Enter new Match Info: "
read newStatus

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET MatchStatus = '$newStatus'
    WHERE MatchID = '$editID';
EOF

#Edit match date 
elif [ "$CHOICE" == "3" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET MatchDate = '$newData'
    WHERE MatchID = '$editID';
EOF

#Edit matchtime 
elif [ "$CHOICE" == "4" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET MatchTime = '$newData'
    WHERE MatchID = '$editID';

EOF

#Edit finalscore
elif [ "$CHOICE" == "5" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET FinalScore = '$newData'
    WHERE MatchID = '$editID';
   
EOF
#Edit leadref
elif [ "$CHOICE" == "6" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET LeadRef = '$newData'
    WHERE MatchID = '$editID';
EOF
#Edit varref
elif [ "$CHOICE" == "7" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET VARRef = '$newData'
    WHERE MatchID = '$editID';
  
EOF

#edit juniorref
elif [ "$CHOICE" == "8" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET JuniorRef = '$newData'
    WHERE MatchID = '$editID';
EOF

#edit winloss
elif [ "$CHOICE" == "9" ]
then
echo "Enter new Match Info: "
read newData

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    UPDATE MatchesT
    SET WinLoss = '$newData'
    WHERE MatchID = '$editID';

EOF

#quit to menu 
elif [ "$CHOICE" == "E" ]; then
    echo "Exiting..."
    exit;
 
else
    echo "Invalid choice. Exiting..."
fi
