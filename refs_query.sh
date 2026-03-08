
#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

# Use SQL*Plus to run the SQL statements
# Display all refs 
sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF\

SELECT * FROM REFEREES;

exit;
EOF
