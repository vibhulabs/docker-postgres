#!/bin/bash

#gosu postgres psql -p 5432 -U postgres -c "CREATE USER gdb WITH PASSWORD 'MySecretPassw0rd'";
gosu postgres psql -p 5432 -U postgres -c "CREATE USER gdb WITH PASSWORD '$POSTGRES_PASSWORD'";
gosu postgres psql -p 5432 -U postgres -c "CREATE DATABASE $POSTGRES_DATABASE OWNER gdb";

# This command needs the database to be specified. If this command is run with db name
# then the extension is created in the default db, postgres, and is not accessible in
# our db. 
gosu postgres psql -p 5432 -d $POSTGRES_DATABASE -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";"
