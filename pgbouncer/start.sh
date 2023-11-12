#!/bin/bash

# Get the number of CPU cores
CORES=$(nproc)

# Set the auth_user password
# AUTH_USER_PASSWORD="postgres"

# Create the auth_file
# echo "\"postgres\" \"$AUTH_USER_PASSWORD\"" > /opt/pgbouncer/auth_file.txt

# Start the required number of PgBouncer processes
for ((i=1;i<=CORES;i++))
do
 echo "Starting pgbouncer...."
 pgbouncer /etc/pgbouncer/pgbouncer.ini &
done

# Keep the script running
wait