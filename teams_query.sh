

#!/bin/sh

# Oracle Database connection information
USER="your_username"
PASSWORD="your_password"
CONNECTION_STRING="your_connection_string"

# Use SQL*Plus to run the SQL statements
# Display all teams with their information and formation (join query)
sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF


SELECT
    T.TeamName,
    T.WinsThisSeason,
    T.LossesThisSeason,
    T.TiesThisSeason,
    F.FormationLayout
FROM Formations F, Teams T
WHERE F.TeamName = T.TeamName;

exit;
EOF

