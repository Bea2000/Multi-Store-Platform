CREATE OR REPLACE FUNCTION

crear_db()

RETURNS void AS $$

DECLARE

BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'db1') THEN
        PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE db1');
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'db2') THEN
        PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE db2');
    END IF;
END;
$$ LANGUAGE plpgsql;