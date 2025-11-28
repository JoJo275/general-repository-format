<div align="center">

# 🗄️ SQL Business Repo Skeleton

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![SQLite](https://img.shields.io/badge/SQLite-003B57?logo=sqlite&logoColor=white)](https://sqlite.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)](https://postgresql.org/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)](https://mysql.com/)

**A teaching-friendly skeleton for organizing SQL-heavy business codebases**

*Intentionally verbose and heavily commented so beginners can understand how things fit together*

[Getting Started](#-quick-start) •
[Documentation](#-suggested-reading-order-for-beginners) •
[Repository Structure](#-repository-structure) •
[Contributing](CONTRIBUTING.md)

</div>

---

## ✨ Goals

- 📁 Show how to separate schemas, migrations, seed data, and queries.
- 🔄 Support multiple database engines (SQLite, PostgreSQL, MySQL).
- 🏢 Demonstrate common business domains:
  - 🔐 Authentication / Users
  - 👥 CRM (customers, contacts)
  - 💰 Billing (invoices, payments)
  - 📦 Product catalog
  - 📊 Logging & analytics
- 🛠️ Provide example scripts and client code to interact with the database.

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/JoJo275/general-repository-format.git
cd general-repository-format

# Initialize the SQLite database (Linux/macOS)
./scripts/init_sqlite_business.sh

# Or on Windows PowerShell
.\scripts\init_sqlite_business.ps1
```

---

## 📚 Suggested reading order for beginners

| Step | File | Description |
|:----:|------|-------------|
| 1️⃣ | `docs/overview-for-beginners.md` | Start here! Plain-language intro to databases |
| 2️⃣ | `docs/data-model-auth-crm-billing.md` | Understand the business domains |
| 3️⃣ | `db/schemas/sqlite/` | Begin with `auth.sql` |
| 4️⃣ | `db/queries/` | Start with `auth/basic_auth_queries.sql` |
| 5️⃣ | `clients/python/example_auth_login.py` | See it all come together |

> 💡 **Tip:** After you understand those, you can explore the rest of the folders.

---

## 🏗️ Repository Structure

**Out of sync with actual files. Will hopefully fix soon.**

```
📦 general-repository-format
├── 📄 README.md              # You are here!
├── 📄 CONTRIBUTING.md        # How to safely contribute
├── 📄 LICENSE                # MIT license
└── 📄 .gitignore             # Ignore DB files, virtualenvs, node_modules, etc.
```

### 📖 `docs/` — Documentation

| File | Description |
|------|-------------|
| `overview-for-beginners.md` | Plain-language explanation of what schemas, migrations, seeds, and queries are, and how they relate. |
| `data-model-auth-crm-billing.md` | Business-level explanation of the main domains (Auth, CRM, Billing, Catalog, Logging/Analytics). |
| `glossary.md` | Definitions of common database terms for beginners. |

### ⚙️ `config/` — Configuration Files

| File | Description |
|------|-------------|
| `sqlfluff.toml` | Example SQLFluff config (Postgres dialect, uppercase keywords, lowercase identifiers). |
| `.editorconfig` | Consistent indentation and line endings. |
| `.env.example` | Shows typical DB environment variables with inline comments. |

### 🗃️ `db/schemas/` — Database Schemas

<details>
<summary><b>SQLite</b> (Primary examples with full comments)</summary>

| File | Description |
|------|-------------|
| `auth.sql` | Auth tables (`auth_user`, `auth_role`, `auth_user_role`) with line-by-line beginner comments. |
| `crm.sql` | CRM tables (`crm_account`, `crm_contact`, `crm_interaction`) with comments. |
| `billing.sql` | Billing tables (plans, invoices, lines, payments) with comments. |
| `catalog.sql` | Product and pricing tables with comments. |
| `logging.sql` | Logging and analytics event tables with comments. |

</details>

<details>
<summary><b>PostgreSQL</b></summary>

| File | Description |
|------|-------------|
| `auth.sql` | Postgres version of auth tables (types like `SERIAL`, `BOOLEAN`, `TIMESTAMPTZ`). |

</details>

<details>
<summary><b>MySQL</b></summary>

| File | Description |
|------|-------------|
| `auth.sql` | MySQL version of auth tables (e.g., `INT UNSIGNED`, `TINYINT(1)`). |

</details>

### 🔄 `db/migrations/` — Database Migrations

> SQLite example migrations showing incremental schema evolution

| File | Description |
|------|-------------|
| `sqlite/0001_initial_auth_crm.sql` | Applies auth + CRM schemas. |
| `sqlite/0002_billing_catalog_logging.sql` | Adds billing, catalog, logging tables. |
| `sqlite/0003_add_indexes.sql` | Example of adding indexes later. |

### 🌱 `db/seeds/` — Sample Data

> Sample data with helpful comments for understanding the data model

| File | Description |
|------|-------------|
| `sqlite/auth_seeds.sql` | Inserts roles, users, and user-role mappings. |
| `sqlite/crm_seeds.sql` | Inserts example accounts and contacts. |

### 🔍 `db/queries/` — Common Queries

<details>
<summary><b>auth/basic_auth_queries.sql</b></summary>

- Find user by email (for login).
- List roles for a user.
- Simple count of active vs inactive users.
- All queries use named parameters and have explanatory comments.

</details>

<details>
<summary><b>crm/account_contact_queries.sql</b></summary>

- Accounts with contact counts.
- Contacts by account id.

</details>

<details>
<summary><b>billing/invoice_queries.sql</b></summary>

- Compute invoice total.
- Invoice summary with amount and payments.

</details>

### 📊 `analytics/reports/` — Reporting Queries

| File | Description |
|------|-------------|
| `monthly_revenue.sql` | Groups payments by year-month; comments explain `strftime`. |
| `active_customers.sql` | Identifies accounts with recent invoices. |

### 🔀 `etl/` — Extract, Transform, Load

| File | Description |
|------|-------------|
| `README.md` | Explains Extract/Transform/Load in beginner terms. |
| `python/import_crm_contacts_from_csv.py` | Heavily commented script that:<br>• Reads `data/csv/new_contacts.csv`<br>• Finds or creates CRM accounts<br>• Inserts contacts linked to accounts |

### 🧪 `tests/sql/` — SQL Tests

| File | Description |
|------|-------------|
| `smoke_tests.sql` | Simple "does this run?" checks (tables exist, basic query works) with comments. |

### 📜 `scripts/` — Initialization Scripts

| File | Description |
|------|-------------|
| `init_sqlite_business.sh` | Bash script to: Create `business.db`, Run all migrations, Run seed scripts. |
| `init_sqlite_business.ps1` | PowerShell equivalent. |

### 💻 `clients/` — Client Code Examples

| File | Description |
|------|-------------|
| `python/example_auth_login.py` | Very simple login-lookup flow using SQLite. Lots of comments explaining each step. |
| `node/README.md` | Placeholder explaining where Node/TS client code would live. |

### 📁 `data/csv/` — Sample Data Files

| File | Description |
|------|-------------|
| `new_contacts.csv` | Sample CSV used by the ETL script. |

---

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) to get started.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ for SQL beginners everywhere**

⭐ Star this repo if you find it helpful!

</div>