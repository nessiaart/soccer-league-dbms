
#!/bin/sh

# Oracle Database connection information
USER="akward"
PASSWORD="05032458"
CONNECTION_STRING="(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"

echo "================================================================="
echo "| Oracle All Inclusive Tool
|"
echo "| Delete Players:
|"
echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>
|"
echo "-----------------------------------------------------------------"
#Request player id 
echo "Enter Player ID: "
read DeleteID

#Delete player based on ID 
sqlplus64 "$USER/$PASSWORD@$CONNECTION_STRING" <<EOF
    DELETE FROM Players
    WHERE PlayerID = $DeleteID;
EOF
