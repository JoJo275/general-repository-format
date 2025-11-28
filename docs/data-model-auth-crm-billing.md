# Data Model: Auth, CRM, Billing (Simplified)

This document explains the **core tables** you will find in the schemas.

## Auth domain

- `auth_user`
  - Represents a person who can log in.
  - Contains email, password hash, and status flags.
- `auth_role`
  - Defines roles like `admin`, `support`, `customer`.
- `auth_user_role`
  - Join table that connects users to roles (many-to-many).

## CRM domain

- `crm_account`
  - A business entity or organization (e.g., "Acme Corp").
- `crm_contact`
  - A person at an account (e.g., "Jane Doe at Acme Corp").
- `crm_interaction`
  - Records calls, emails, or notes about contact with customers.

## Billing domain

- `billing_plan`
  - Defines pricing plans or subscriptions.
- `billing_invoice`
  - Represents an invoice sent to a customer.
- `billing_invoice_line`
  - Individual line item on an invoice.
- `billing_payment`
  - A payment applied to an invoice.

## Product catalog

- `catalog_product`
  - A product or service sold by the business.
- `catalog_price`
  - Price for a product, possibly varying over time or by plan.

## Logging / Analytics

- `log_event`
  - Generic log entry (level, message, context).
- `analytics_event`
  - Tracks user actions like "signed_up", "viewed_page", etc.
