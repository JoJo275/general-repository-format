-- Third migration: example of adding more indexes later.

CREATE INDEX idx_crm_account_name ON crm_account(name);
CREATE INDEX idx_billing_invoice_status ON billing_invoice(status);
