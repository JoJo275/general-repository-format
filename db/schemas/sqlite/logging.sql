-- ===============================================
-- LOGGING & ANALYTICS (SQLite)
-- ===============================================

PRAGMA foreign_keys = ON;

CREATE TABLE log_event (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    level           TEXT NOT NULL, -- e.g. 'INFO', 'WARN', 'ERROR'
    message         TEXT NOT NULL,
    context_json    TEXT, -- JSON string with extra data
    created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE analytics_event (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id         INTEGER,
    event_name      TEXT NOT NULL, -- e.g. 'signed_up', 'viewed_page'
    event_json      TEXT,          -- arbitrary properties
    occurred_at     TEXT NOT NULL DEFAULT (datetime('now')),
    FOREIGN KEY (user_id) REFERENCES auth_user(id)
);

CREATE INDEX idx_analytics_event_user ON analytics_event(user_id);
CREATE INDEX idx_analytics_event_name ON analytics_event(event_name);
