-- Seed data for CRM domain (SQLite).

INSERT INTO crm_account (name, industry, website)
VALUES
    ('Acme Corp', 'Manufacturing', 'https://acme.example.com'),
    ('Globex Inc', 'Technology', 'https://globex.example.com');

INSERT INTO crm_contact (account_id, first_name, last_name, email)
VALUES
    (1, 'Alice', 'Anderson', 'alice@acme.example.com'),
    (2, 'Bob', 'Brown', 'bob@globex.example.com');
