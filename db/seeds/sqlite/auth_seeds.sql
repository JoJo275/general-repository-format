-- Seed data for auth domain (SQLite).
-- Never use real passwords here; we pretend with dummy hashes.

INSERT INTO auth_role (name, description)
VALUES
    ('admin', 'Full access to the system'),
    ('support', 'Customer support staff'),
    ('customer', 'End customer user');

INSERT INTO auth_user (email, password_hash, is_active)
VALUES
    ('admin@example.com', 'hashed-password-admin', 1),
    ('support@example.com', 'hashed-password-support', 1);

INSERT INTO auth_user_role (user_id, role_id)
VALUES
    (1, 1), -- admin user -> admin role
    (2, 2); -- support user -> support role
