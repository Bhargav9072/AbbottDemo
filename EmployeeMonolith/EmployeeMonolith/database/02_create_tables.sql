-- Run against the employee_db database:
--   psql -U postgres -d employee_db -f 02_create_tables.sql

CREATE TABLE IF NOT EXISTS employees (
    employee_id    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_code  VARCHAR(20)  NOT NULL UNIQUE,
    first_name     VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(150) NOT NULL UNIQUE,
    phone_number   VARCHAR(20),
    department     VARCHAR(100) NOT NULL,
    designation    VARCHAR(100) NOT NULL,
    hire_date      DATE         NOT NULL DEFAULT CURRENT_DATE,
    is_active      BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at     TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_employees_department ON employees (department);

-- Sample (fictional) data
INSERT INTO employees (employee_code, first_name, last_name, email, phone_number, department, designation, hire_date)
VALUES
 ('EMP001', 'Aarav',  'Shah',  'aarav.shah@example.com',  '+91-9000000001', 'Engineering', 'Software Engineer',   '2022-04-11'),
 ('EMP002', 'Diya',   'Patel', 'diya.patel@example.com',  '+91-9000000002', 'HR',          'HR Manager',          '2021-09-01'),
 ('EMP003', 'Rohan',  'Mehta', 'rohan.mehta@example.com', '+91-9000000003', 'Engineering', 'Senior Developer',    '2020-01-20'),
 ('EMP004', 'Isha',   'Verma', 'isha.verma@example.com',  '+91-9000000004', 'Sales',       'Sales Executive',     '2023-06-15')
ON CONFLICT (employee_code) DO NOTHING;



CFZRlsKvfuAMmikT7ORP8NLNtEiyzVR7wnXSH8N9HnD8tEEDLCqOJQQJ99CJACYeBjFEqg7NAAACAZCRGfQl
5B1bJTX6F0JKJehLc9D7prSc7G3lslqdkBmxRU6mElcclzDJInI5JQQJ99CJACYeBjFEqg7NAAACAZCRBTbO

Welcome@1234