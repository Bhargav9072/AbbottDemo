-- Run with psql while connected to the default "postgres" database:
--   psql -U postgres -f 01_create_database.sql
-- Creates the database only if it does not already exist.
SELECT 'CREATE DATABASE employee_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'employee_db')\gexec
