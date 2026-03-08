

#!/bin/sh

# Oracle Database connection information
USER="your_username"
PASSWORD="your_password"
CONNECTION_STRING="your_connection_string"

# Use SQL*Plus to run the SQL statements
# View scheduled matches: Uses list agg to group matches by their status, date and time (since only one match per day) and ordering them by the date and time

sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF

SELECT
    LISTAGG(TeamName, ', ') WITHIN GROUP (ORDER BY TeamName) AS TeamNames,
    MatchStatus,
    MatchDate,
    MAX(MatchTime) AS MatchTime
FROM MatchesT
WHERE MatchStatus = 'SCHEDULED'
GROUP BY MatchStatus, MatchDate, MatchTime
ORDER BY MatchDate, TeamNames;

exit;
EOF
