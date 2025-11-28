-- ===============================================
-- REPORT: MONTHLY REVENUE
-- ===============================================
-- This query assumes SQLite datetime strings.
-- It sums payments by year-month.

SELECT
    strftime('%Y-%m', paid_at) AS year_month,
    SUM(amount) AS total_revenue
FROM billing_payment
GROUP BY strftime('%Y-%m', paid_at)
ORDER BY year_month;
