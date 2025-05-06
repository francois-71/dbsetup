docker compose -f 'docker-compose.yml' up -d --build

mssql: to connect to the db
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'YourStrong!Passw0rd' -Q "SELECT name FROM sys.databases" -C -N

/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'YourStrong!Passw0rd' -C -N -d master -Q "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'users'"# dbsetup
