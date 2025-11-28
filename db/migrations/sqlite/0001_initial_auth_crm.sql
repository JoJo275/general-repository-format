-- First migration: create core domains in SQLite.
-- In a real system you might separate into many files,
-- but here we keep it simple.

.read ../../schemas/sqlite/auth.sql
.read ../../schemas/sqlite/crm.sql
