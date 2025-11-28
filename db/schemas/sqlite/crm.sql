-- ===============================================
-- CRM DOMAIN (SQLite)
-- ===============================================
-- CRM = Customer Relationship Management.
-- We track accounts (companies) and contacts (people).

PRAGMA foreign_keys = ON;

CREATE TABLE crm_account (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    industry        TEXT,
    website         TEXT,
    created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE crm_contact (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id      INTEGER NOT NULL,
    first_name      TEXT NOT NULL,
    last_name       TEXT NOT NULL,
    email           TEXT,
    phone           TEXT,
    created_at      TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (account_id) REFERENCES crm_account(id)
);

CREATE TABLE crm_interaction (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id      INTEGER NOT NULL,
    contact_id      INTEGER,
    interaction_type TEXT NOT NULL, -- e.g. 'call', 'email', 'demo'
    notes           TEXT,
    occurred_at     TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (account_id) REFERENCES crm_account(id),
    FOREIGN KEY (contact_id) REFERENCES crm_contact(id)
);

CREATE INDEX idx_crm_contact_account ON crm_contact(account_id);
CREATE INDEX idx_crm_interaction_account ON crm_interaction(account_id);
