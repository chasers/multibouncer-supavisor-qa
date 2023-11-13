#!/bin/sh

CORES=$(nproc)

# for i in $(seq 1 $CORES); do
#    /usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini &
# done

/usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini

wait