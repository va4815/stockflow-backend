CREATE SCHEMA IF NOT EXISTS schema_authentication;

--

CREATE TABLE schema_authentication.t_role
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code        VARCHAR(100) NOT NULL,
    name        VARCHAR(100),
    description VARCHAR(255),
    CONSTRAINT uk_role_code UNIQUE (code)
);

CREATE TABLE schema_authentication.t_permission
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(100) NOT NULL,
    CONSTRAINT uk_permission_code UNIQUE (code)
);

CREATE TABLE schema_authentication.t_locale
(
    id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code    VARCHAR(10) NOT NULL,
    name    VARCHAR(100),
    enabled BOOLEAN     NOT NULL DEFAULT TRUE,
    CONSTRAINT uk_locale_code UNIQUE (code)
);


-- t_user_account
CREATE TABLE schema_authentication.t_user_account
(
    id                INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kc_id             VARCHAR(100) NOT NULL,

    username          VARCHAR(100) NOT NULL,
    email             VARCHAR(255),

    first_name        VARCHAR(100),
    last_name         VARCHAR(100),
    is_enabled        BOOLEAN      NOT NULL DEFAULT TRUE,
    is_email_verified BOOLEAN      NOT NULL DEFAULT FALSE,

    last_login_at     TIMESTAMP,

    role_id           INT          NOT NULL,

    created_at        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by        INT,
    updated_by        INT,

    CONSTRAINT uk_user_account_username UNIQUE (username),
    CONSTRAINT uk_user_account_email UNIQUE (email),
    CONSTRAINT fk_user_account_role
        FOREIGN KEY (role_id) REFERENCES t_role (id)
);

CREATE INDEX idx_user_account_kc_id ON t_user_account (kc_id);
CREATE INDEX idx_user_account_role_id ON t_user_account (role_id);

-- t_user_setting

CREATE TABLE schema_authentication.t_user_setting
(
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_account_id INT NOT NULL,
    language_code   VARCHAR(10),

    CONSTRAINT uk_user_setting_user_account UNIQUE (user_account_id),
    CONSTRAINT fk_user_setting_user_account
        FOREIGN KEY (user_account_id) REFERENCES t_user_account (id) ON DELETE CASCADE,
    CONSTRAINT fk_user_setting_locale
        FOREIGN KEY (language_code) REFERENCES t_locale (code)
);

-- t_user_account_group

CREATE TABLE schema_authentication.t_user_account_group
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    name        VARCHAR(100) NOT NULL,
    description VARCHAR(255),

    status      VARCHAR(20),

    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by  INT,
    updated_by  INT,

    CONSTRAINT uk_user_account_group UNIQUE (name)
);

-- mapping tables

CREATE TABLE schema_authentication.t_user_account_group_mapping
(
    user_account_id       INT NOT NULL,
    user_account_group_id INT NOT NULL,

    PRIMARY KEY (user_account_id, user_account_group_id),
    CONSTRAINT fk_uagm_user_account
        FOREIGN KEY (user_account_id) REFERENCES t_user_account (id) ON DELETE CASCADE,
    CONSTRAINT fk_uagm_user_account_group
        FOREIGN KEY (user_account_group_id) REFERENCES t_user_account_group (id) ON DELETE CASCADE
);

CREATE INDEX idx_uagm_group_id ON t_user_account_group_mapping (user_account_group_id);



CREATE TABLE schema_authentication.t_user_account_permission_mapping
(
    user_account_id INT NOT NULL,
    permission_id   INT NOT NULL,

    PRIMARY KEY (user_account_id, permission_id),
    CONSTRAINT fk_uapm_user_account
        FOREIGN KEY (user_account_id) REFERENCES t_user_account (id) ON DELETE CASCADE,
    CONSTRAINT fk_uapm_permission
        FOREIGN KEY (permission_id) REFERENCES t_permission (id) ON DELETE CASCADE
);

CREATE INDEX idx_uapm_permission_id ON t_user_account_permission_mapping (permission_id);



CREATE TABLE schema_authentication.t_user_account_group_permission_mapping
(
    user_account_group_id INT NOT NULL,
    permission_id         INT NOT NULL,

    PRIMARY KEY (user_account_group_id, permission_id),
    CONSTRAINT fk_uagpm_user_account_group
        FOREIGN KEY (user_account_group_id) REFERENCES t_user_account_group (id) ON DELETE CASCADE,
    CONSTRAINT fk_uagpm_permission
        FOREIGN KEY (permission_id) REFERENCES t_permission (id) ON DELETE CASCADE
);

CREATE INDEX idx_uagpm_permission_id ON t_user_account_group_permission_mapping (permission_id);



CREATE TABLE schema_authentication.t_role_permission_mapping
(
    role_id       INT NOT NULL,
    permission_id INT NOT NULL,

    PRIMARY KEY (role_id, permission_id),
    CONSTRAINT fk_rpm_role
        FOREIGN KEY (role_id) REFERENCES t_role (id) ON DELETE CASCADE,
    CONSTRAINT fk_rpm_permission
        FOREIGN KEY (permission_id) REFERENCES t_permission (id) ON DELETE CASCADE
);

CREATE INDEX idx_rpm_permission_id ON t_role_permission_mapping (permission_id);


--

