
#!/bin/sh

# Oracle Database connection information
USER="your_username"
PASSWORD="your_password"
CONNECTION_STRING="your_connection_string"

echo "================================================================="
echo "| SOCCERTEAM DBMS
|"
echo "| Players Menu - Select Desired Team To View:
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-------------------------------------------------------------
----"

#Display team options
echo " $IS_SELECTED1 1) View All"
echo " $IS_SELECTED2 2) View Bayern Munchen"
echo " $IS_SELECTED3 3) View Leverkusen"
echo " $IS_SELECTED4 4) View Borussia Dortmund"
echo " $IS_SELECTED5 5) View RB Leipzig"
echo " $IS_SELECTED6 6) View VfB Stuttgart"
echo " $IS_SELECTED7 7) View Hoffenheim"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo "Choose: "
read CHOICE

if [ "$CHOICE" == "1" ]
then
SQL_QUERY="SELECT * FROM Players;"

elif [ "$CHOICE" == "2" ]
then
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus 
  FROM Players WHERE TeamName = 'Bayern Munchen';"
elif [ "$CHOICE" == "3" ]
then
# View Leverkusen Players
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus
  FROM Players WHERE TeamName = 'Leverkusen';"
elif [ "$CHOICE" == "4" ]
then
# View Borussia Dortmund Players
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus
  FROM Players WHERE TeamName = 'Borussia Dortmund';"
elif [ "$CHOICE" == "5" ]
then
# View RB Leipzig Players
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus FROM Players WHERE TeamName = 'RB Leipzig';"
elif [ "$CHOICE" == "6" ]
then
 # View VfB Stuttgart Players
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus FROM Players WHERE TeamName = 'VfB Stuttgart';"
elif [ "$CHOICE" == "7" ]
then
# View Hoffenheim Players
SQL_QUERY="SELECT PlayerID,
  PlayerName,
  JerseyNo,
  Positions,
  Goals,
  Assists,
  CleanSheets,
  RedCard,
  YellowCard,
  InjuryStatus FROM Players WHERE TeamName = 'Hoffenheim';"
elif [ "$CHOICE" == "E" ]
then
  echo "Exiting.."
  exit;
fi

# Use SQL*Plus to run the SQL query
RESULT=$(
    sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    $SQL_QUERY
EOF
)

# Print the result
echo "$RESULT"
