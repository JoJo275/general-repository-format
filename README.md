# SQL Business Repo Skeleton

This repository is a **teaching-friendly** skeleton of how a business
might organize a SQL-heavy codebase. It is intentionally verbose and
heavily commented so that beginners can understand how things fit together.

## Goals

- Show how to separate schemas, migrations, seed data, and queries.
- Support multiple database engines (SQLite, PostgreSQL, MySQL).
- Demonstrate common business domains:
  - Authentication / Users
  - CRM (customers, contacts)
  - Billing (invoices, payments)
  - Product catalog
  - Logging & analytics
- Provide example scripts and client code to interact with the database.

## Suggested reading order for beginners

1. `docs/overview-for-beginners.md`
2. `docs/data-model-auth-crm-billing.md`
3. `db/schemas/sqlite/` (start with `auth.sql`)
4. `db/queries/` (start with `auth/basic_auth_queries.sql`)
5. `clients/python/example_auth_login.py`

After you understand those, you can explore the rest of the folders.
