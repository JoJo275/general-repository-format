-- ===============================================
-- REPORT: ACTIVE CUSTOMERS
-- ===============================================
-- Very simple example: list accounts that have at least
-- one invoice marked as 'open' or 'paid' in the last 12 months.

SELECT DISTINCT
    a.id,
    a.name
FROM crm_account AS a
JOIN billing_invoice AS i
    ON i.account_id = a.id
WHERE i.status IN ('open', 'paid')
  AND i.issued_at >= date('now', '-12 months')
ORDER BY a.name;
