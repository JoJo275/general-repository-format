-- MySQL AUTH schema (shortened)
CREATE TABLE auth_user (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email           VARCHAR(255) NOT NULL UNIQUE,
    password_hash   TEXT NOT NULL,
    is_active       TINYINT(1) NOT NULL DEFAULT 1,
    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB;

CREATE TABLE auth_role (
    id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(64) NOT NULL UNIQUE,
    description TEXT
) ENGINE=InnoDB;

CREATE TABLE auth_user_role (
    user_id     INT UNSIGNED NOT NULL,
    role_id     INT UNSIGNED NOT NULL,
    assigned_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES auth_user(id),
    FOREIGN KEY (role_id) REFERENCES auth_role(id)
) ENGINE=InnoDB;

CREATE INDEX idx_auth_user_email ON auth_user(email);
