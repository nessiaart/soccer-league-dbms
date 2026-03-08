

#!/bin/sh

#Menu for user queries
UserMenu(){

while [ "$CHOICE" != "START" ]
do

echo "================================================================="
echo "| Oracle All Inclusive Tool
|"
echo "| User Menu - Select Desired Operation(s):
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-----------------------------------------------------------------"
echo " $IS_SELECTED1 1) MVP_Query: Display players with goals + assists"
echo " $IS_SELECTED2 2) Injury_Query: Display teams with no injuries"
echo " $IS_SELECTED3 3) Teams_Query: Display teams information"
echo " $IS_SELECTED4 4) Players_Query:  Display players information"
echo " $IS_SELECTED6 5) Scheduled_Matches_Query: Display scheduled matches"
echo " $IS_SELECTED7 6) Completed_Matches_Query:  Display completed matches"
echo " $IS_SELECTED7 7) Staff_Query: Display all management staff"
echo " $IS_SELECTED7 8) Refs_Query: Display all referees"
echo " $IS_SELECTED7 9) View Leaderboard: Display a leaderboard for the DB"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo "Choose: "
read -r CHOICE

#Code to trigger the queries from the menu depending on user input 
if [ "$CHOICE" == "1" ]
then 
	bash mvp_query.sh

elif [ "$CHOICE" == "2" ]
then
	bash injury_query.sh

elif [ "$CHOICE" == "3" ]
then
	bash teams_query.sh

elif [ "$CHOICE" == "4" ]
then
	bash players_query.sh

elif [ "$CHOICE" == "5" ]
then
	bash scheduled_query.sh

elif [ "$CHOICE" == "6" ]
then
	bash completed_query.sh

elif [ "$CHOICE" == "7" ]
then
	bash staff_query.sh

elif [ "$CHOICE" == "8" ]
then
	bash refs_query.sh

elif [ "$CHOICE" == "9" ]
then
	bash stats_users.sh

elif [ "$CHOICE" == "E" ]
then
	exit

else 
	echo "Invalid choice. Please try again."
fi
done
}

#Code for admin menu options 
AdminMenu(){

while [ "$CHOICE" != "START" ]
do

echo "================================================================="
echo "| Oracle All Inclusive Tool
|"
echo "| Admin Menu - Select Desired Operation(s):
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-----------------------------------------------------------------"
echo " $IS_SELECTED1 1) Drop Tables: Drop all tables"
echo " $IS_SELECTED2 2) Create Tables: Create all tables"
echo " $IS_SELECTED3 3) Populate Tables: Populate all tables"
echo " $IS_SELECTED5 4) Create Player: Create new player"
echo " $IS_SELECTED5 5) Delete Player: Delete a player "
echo " $IS_SELECTED5 6) Update Team Info: Update team information"
echo " $IS_SELECTED5 7) Update Match Info: Update match information"
echo " $IS_SELECTED5 8) Create Login: Create new admin login"
echo " "
echo " $IS_SELECTEDE E) End/Exit"
echo "Choose: "
read -r CHOICE

#Code to trigger the queries from the menu depending on user input 
if [ "$CHOICE" == "1" ]
then
	bash drop_tables.sh

elif [ "$CHOICE" == "2" ]
then
	bash create_tables.sh

elif [ "$CHOICE" == "3" ]
then
	bash populate_tables.sh

elif [ "$CHOICE" == "4" ]
then
	bash create_player.sh

elif [ "$CHOICE" == "5" ]
then
	bash delete_player.sh

elif [ "$CHOICE" == "6" ]
then
        bash team_update.sh

elif [ "$CHOICE" == "7" ]
then
	bash update_match.sh

elif [ "$CHOICE" == "8" ]
then
        bash admin_create.sh

elif [ "$CHOICE" == "E" ]
then
	exit

else
	echo "Invalid choice. Please try again."
fi
done

}


#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart() {
    while [ "$LEAVE" != "E" ]; do
		
		#Getting the user-type for login 
        echo "Are you an admin or a user? Enter E for Exit. (A/U/E): "
        read -r USERTYPE

        if [ "$USERTYPE" == "A" ]
		then
			echo "Enter admin username: "
			read adminName 

			echo "Enter admin password: "
			read adminPass

			# Oracle Database connection information
			USER="your_username"
			PASSWORD="your_password"
			CONNECTION_STRING="your_connection_string"
			result=$(sqlplus64 -S "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
			SET HEADING OFF FEEDBACK OFF VERIFY OFF
			SELECT COUNT(*) FROM AdminLogins WHERE Username='$adminName' AND Passkey='$adminPass';
EOF
)
	    	   
			# Check the result
			if [ "$result" -eq 1 ]
			then
				AdminMenu
			else
				echo "Incorrect username or password."
			fi

        elif [ "$USERTYPE" == "U" ]
		then
		  echo "Do you want to (L)ogin or (C)reate an account?"
		  read -r LOGIN_CHOICE
			
			if [ "$LOGIN_CHOICE" == "C" ]
			then 
				bash user_create.sh
			elif [ "$LOGIN_CHOICE" == "L" ]
			then
				echo "Enter Username: "
				read UserName 

				echo "Enter password: "
				read UserPass

				# Oracle Database connection information
				USER="your_username"
				PASSWORD="your_password"
				CONNECTION_STRING="your_connection_string"
				result=$(sqlplus64 -S "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
				SET HEADING OFF FEEDBACK OFF VERIFY OFF
				SELECT COUNT(*) FROM UserLogins WHERE Viewername='$UserName' AND Passkey='$UserPass';
EOF
)
				
				# Check the result

				if [ "$result" -eq 1 ]
				then
					UserMenu
				else
					echo "Incorrect username or password."
				fi

			else 
			
				echo "Invalid input."
			fi
        elif [ "$USERTYPE" == "E" ]
		then
            exit
        else
            echo "Invalid input. Please enter A, U, or E."
        fi
    done

}
ProgramStart
