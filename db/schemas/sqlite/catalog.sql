-- ===============================================
-- PRODUCT CATALOG (SQLite)
-- ===============================================

PRAGMA foreign_keys = ON;

CREATE TABLE catalog_product (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    sku             TEXT NOT NULL UNIQUE, -- Stock Keeping Unit
    name            TEXT NOT NULL,
    description     TEXT,
    is_active       INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE catalog_price (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id      INTEGER NOT NULL,
    currency        TEXT NOT NULL DEFAULT 'USD',
    amount          REAL NOT NULL,
    valid_from      TEXT NOT NULL DEFAULT (datetime('now')),
    valid_to        TEXT,
    FOREIGN KEY (product_id) REFERENCES catalog_product(id)
);
