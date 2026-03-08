

#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

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
