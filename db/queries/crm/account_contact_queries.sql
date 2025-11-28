-- ===============================================
-- CRM QUERIES: ACCOUNTS AND CONTACTS
-- ===============================================

-- List all accounts with contact counts
SELECT
    a.id,
    a.name,
    COUNT(c.id) AS contact_count
FROM crm_account AS a
LEFT JOIN crm_contact AS c
    ON c.account_id = a.id
GROUP BY a.id, a.name
ORDER BY a.name;

-- Find all contacts for a specific account
SELECT
    c.id,
    c.first_name,
    c.last_name,
    c.email
FROM crm_contact AS c
WHERE c.account_id = :account_id
ORDER BY c.last_name, c.first_name;
