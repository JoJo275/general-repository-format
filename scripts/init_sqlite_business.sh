#!/usr/bin/env bash
# Beginner-friendly shell script to set up a SQLite database.

set -euo pipefail

DB_PATH=${1:-business.db}

echo "Initializing SQLite business database at: $DB_PATH"

sqlite3 "$DB_PATH" < ./db/migrations/sqlite/0001_initial_auth_crm.sql
sqlite3 "$DB_PATH" < ./db/migrations/sqlite/0002_billing_catalog_logging.sql
sqlite3 "$DB_PATH" < ./db/migrations/sqlite/0003_add_indexes.sql
sqlite3 "$DB_PATH" < ./db/seeds/sqlite/auth_seeds.sql
sqlite3 "$DB_PATH" < ./db/seeds/sqlite/crm_seeds.sql

echo "Done. You can now open $DB_PATH with sqlite3 or a GUI tool."
