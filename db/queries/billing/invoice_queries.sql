-- ===============================================
-- BILLING QUERIES: INVOICES AND PAYMENTS
-- ===============================================

-- Calculate invoice total (sum of line items)
SELECT
    il.invoice_id,
    SUM(il.quantity * il.unit_price) AS invoice_total
FROM billing_invoice_line AS il
WHERE il.invoice_id = :invoice_id
GROUP BY il.invoice_id;

-- Show basic invoice summary with payment total
SELECT
    i.id,
    i.invoice_number,
    i.status,
    i.issued_at,
    COALESCE(SUM(il.quantity * il.unit_price), 0) AS invoice_amount,
    COALESCE(SUM(p.amount), 0) AS amount_paid
FROM billing_invoice AS i
LEFT JOIN billing_invoice_line AS il
    ON il.invoice_id = i.id
LEFT JOIN billing_payment AS p
    ON p.invoice_id = i.id
WHERE i.id = :invoice_id
GROUP BY
    i.id,
    i.invoice_number,
    i.status,
    i.issued_at;
