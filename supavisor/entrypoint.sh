#!/bin/sh

export ECTO_IPV6=false
export ERL_AFLAGS=""
export SECRET_KEY_BASE="dev"
export DATABASE_URL="postgres://postgres:postgres@supavisor_db:5432/postgres"
export VAULT_ENC_KEY="aHD8DZRdk2emnkdktFZRh3E9RNg4aOY7"
export API_JWT_SECRET="dev"

./bin/migrate
./bin/supavisor start &

sleep 2

curl -i -X PUT \
  'http://localhost:4000/api/tenants/dev_tenant' \
  --header 'Accept: */*' \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.wLKpjVW9IRyDIg2Wsrg9_vQ1oo3fk1Hsdi7RmP33giY' \
  --header 'Content-Type: application/json' \
  --data-raw '{
  "tenant": {
    "db_host": "postgres",
    "db_port": 5432,
    "db_database": "postgres",
    "ip_version": "v4",
    "enforce_ssl": false,
    "require_user": true,
    "users": [
      {
        "db_user": "postgres",
        "db_password": "postgres",
        "pool_size": 20,
        "mode_type": "transaction",
        "is_manager": true
      }
    ]
  }
}'

while true; do
  sleep 1
done
