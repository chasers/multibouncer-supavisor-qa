#!/bin/sh

CORES=$(nproc)

# for i in $(seq 1 $CORES); do
#    /usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini &
# done

for i in $(seq 1 4); do
   echo "Starting PgBouncer"
   /usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini &
done

# /usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini

while true; do sleep 1; done