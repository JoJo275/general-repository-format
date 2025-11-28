-- ===============================================
-- AUTH DOMAIN (SQLite)
-- ===============================================
-- This file defines tables related to user login
-- and authorization.
--
-- NOTE for beginners:
-- - "INTEGER PRIMARY KEY" is a unique id for each row.
-- - "NOT NULL" means the value cannot be empty.
-- - "UNIQUE" means no two rows can have the same value
--   in that column.

PRAGMA foreign_keys = ON;

CREATE TABLE auth_user (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    email           TEXT NOT NULL UNIQUE,
    password_hash   TEXT NOT NULL, -- Store a HASH, never a plain password
    is_active       INTEGER NOT NULL DEFAULT 1,  -- 1 = true, 0 = false
    created_at      TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at      TEXT
);

CREATE TABLE auth_role (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL UNIQUE, -- e.g. 'admin', 'support'
    description TEXT
);

CREATE TABLE auth_user_role (
    user_id     INTEGER NOT NULL,
    role_id     INTEGER NOT NULL,
    assigned_at TEXT NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES auth_user(id),
    FOREIGN KEY (role_id) REFERENCES auth_role(id)
);

CREATE INDEX idx_auth_user_email ON auth_user(email);
