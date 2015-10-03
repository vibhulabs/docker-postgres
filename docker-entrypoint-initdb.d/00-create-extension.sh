#!/bin/bash

# This command needs the database to be specified. If this command is run with db name
# then the extension is created in the default db, postgres, and is not accessible in
# our db. 
gosu postgres psql -p 5432 -d garuda -c "create extension if not exists \"uuid-ossp\";"
