#!/bin/sh

# pgbench --version
pgbench -i 'postgres://postgres:postgres@pgbouncer:6543/postgres'
pgbench 'postgres://postgres:postgres@pgbouncer:6543/postgres' -Srn -T 60 -j 8 -c 10 -P 10 -M extended

while true; do sleep 1; done