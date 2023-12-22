bench.pgbouncer:
	docker compose -f docker-compose.yml -f docker-compose-pgbounce.yml up --build

bench.supavisor:
	docker compose -f docker-compose.yml -f docker-compose-supavisor.yml up --build