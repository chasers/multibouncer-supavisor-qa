# Supavisor vs multi-process PgBouncer

To properly test Supavisor vs multi-process PgBouncer we must setup both the same:

- PgBouncer must not run on the same host as Postgres
- PgBouncer must use all available cores
- PgBouncer and Supavisor must run in the same host / datacenter / region as Postgres
- pgbench must run on a different host in the same host / datacenter / region

## Bench PgBouncer:

`make bench.pgbouncer`

- Docker compose to spin up Postgres and PgBouncer on separate nodes
- One PgBouncer process per core, behind one port via SO_REUSEPORT
- Run pgbench automatically and write results somewhere

## Bench Supavisor:

`make bench.supavisor`

- Docker compose to spin up Supavisor, a Postgres metadata for Supavisor, tenant Postgres
- Elixir takes advantage of all cores automatically
- Run pgbench from another node and write results somewhere
