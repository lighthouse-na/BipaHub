# Run: `docker-compose up -d`

# Make sure you have mysql-client install

### Run: `mysql -h 127.0.0.1 -P 3306 -u myuser -p`

1. password= mypassword
2. `USE mydb;`
3. paste sql queries found in sql_queries/create_tables.sql
4. paste sql queries found in sql_queries/create_stored_procedures.sql
5. `SHOW TABLES;`
6. `SHOW PROCEDURE STATUS WHERE DB = 'mydb';`
