-- Simple "smoke tests" that a developer can run manually.
-- These are not full automated tests, but quick checks.

-- 1) Check that core tables exist
SELECT name
FROM sqlite_master
WHERE type = 'table'
  AND name IN (
    'auth_user',
    'crm_account',
    'billing_invoice',
    'catalog_product',
    'log_event'
  );

-- 2) Check that we can count users without error
SELECT COUNT(*) AS user_count FROM auth_user;
