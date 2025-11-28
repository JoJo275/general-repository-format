-- ===============================================
-- BILLING DOMAIN (SQLite)
-- ===============================================
-- Basic billing tables: plans, invoices, invoice lines, payments.

PRAGMA foreign_keys = ON;

CREATE TABLE billing_plan (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    description     TEXT,
    monthly_price   REAL NOT NULL,
    is_active       INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE billing_invoice (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id      INTEGER NOT NULL,
    invoice_number  TEXT NOT NULL UNIQUE,
    issued_at       TEXT NOT NULL DEFAULT (datetime('now')),
    due_at          TEXT,
    status          TEXT NOT NULL DEFAULT 'open', -- open, paid, cancelled
    FOREIGN KEY (account_id) REFERENCES crm_account(id)
);

CREATE TABLE billing_invoice_line (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_id      INTEGER NOT NULL,
    description     TEXT NOT NULL,
    quantity        INTEGER NOT NULL DEFAULT 1,
    unit_price      REAL NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES billing_invoice(id)
);

CREATE TABLE billing_payment (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_id      INTEGER NOT NULL,
    amount          REAL NOT NULL,
    paid_at         TEXT NOT NULL DEFAULT (datetime('now')),
    method          TEXT, -- e.g. 'card', 'bank_transfer'
    FOREIGN KEY (invoice_id) REFERENCES billing_invoice(id)
);

CREATE INDEX idx_billing_invoice_account ON billing_invoice(account_id);
CREATE INDEX idx_billing_payment_invoice ON billing_payment(invoice_id);
