Param(
    [string]$DbPath = "business.db"
)

Write-Host "Initializing SQLite business database at: $DbPath"

# 1) Create empty DB and apply migrations
sqlite3 $DbPath < ".\db\migrations\sqlite\0001_initial_auth_crm.sql"
sqlite3 $DbPath < ".\db\migrations\sqlite\0002_billing_catalog_logging.sql"
sqlite3 $DbPath < ".\db\migrations\sqlite\0003_add_indexes.sql"

# 2) Seed data
sqlite3 $DbPath < ".\db\seeds\sqlite\auth_seeds.sql"
sqlite3 $DbPath < ".\db\seeds\sqlite\crm_seeds.sql"

Write-Host "Done. You can now open $DbPath with sqlite3 or a GUI tool."
