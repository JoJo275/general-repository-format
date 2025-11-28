# Overview for Beginners

This repo pretends to be the database layer for a small business system.
Imagine a company that:

- Has customers and contacts (CRM).
- Lets users log in (authentication).
- Sells products (product catalog).
- Issues invoices and collects payments (billing).
- Stores logs and analytics events (logging / analytics).

## High-level structure

- `db/schemas/` — SQL files that create tables.
- `db/migrations/` — Step-by-step changes to the schema over time.
- `db/seeds/` — Sample data to quickly fill the database.
- `db/queries/` — Reusable queries grouped by domain.
- `analytics/` — Queries that answer business questions (reports).
- `scripts/` — Helper scripts to set up or reset databases.
- `clients/` — Example application code that talks to the database.

Think of `schemas` as the blueprint for your tables,
`seeds` as fake data for testing, and `queries` as common questions
you ask your data.
