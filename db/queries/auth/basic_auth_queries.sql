-- ===============================================
-- BASIC AUTH QUERIES
-- ===============================================
-- These are simple queries a login system might use.

-- 1) Find a user by email (for login)
SELECT
    id,
    email,
    password_hash,
    is_active
FROM auth_user
WHERE email = :email;
-- NOTE: `:email` is a named parameter; your app will bind a value here.

-- 2) List roles for a given user
SELECT
    r.name AS role_name
FROM auth_role AS r
JOIN auth_user_role AS ur
    ON ur.role_id = r.id
WHERE ur.user_id = :user_id;

-- 3) Simple report: count of users by active flag
SELECT
    is_active,
    COUNT(*) AS user_count
FROM auth_user
GROUP BY is_active;
