

#!/bin/sh

# Oracle Database connection information
USER="your_username"
PASSWORD="your_password"
CONNECTION_STRING="your_connection_string"

# Use SQL*Plus to run the SQL statements
sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF

/*INJURY_Query: This Query shows the list of teams that do not have an injured player.*/

SELECT DISTINCT TEAMNAME
FROM PLAYERS p
WHERE NOT EXISTS (
SELECT 1
FROM PLAYERS
WHERE PLAYERS.TEAMNAME = P.TEAMNAME
AND PLAYERS.INJURYSTATUS = 'INJURED' );


EOF

