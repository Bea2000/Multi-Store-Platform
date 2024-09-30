CREATE OR REPLACE FUNCTION

-- declaramos la función y sus argumentos
crear_tablas_db_1()

RETURNS void AS $$

DECLARE

-- declaramos el lenguaje de la función
BEGIN
    CREATE TABLE IF NOT EXISTS Personal (
        pid INTEGER,
        nombre VARCHAR(255),
        rut VARCHAR(20),
        sexo VARCHAR(10),
        edad INTEGER
    );

    -- Create table for Despachos.csv
    CREATE TABLE IF NOT EXISTS Despachos (
        did INTEGER,
        fecha TIMESTAMP,
        origen INTEGER,
        destino INTEGER,
        id_compra INTEGER,
        vid INTEGER,
        pid INTEGER
    );

    -- Create table for Direcciones.csv
    CREATE TABLE IF NOT EXISTS Direcciones (
        direccion INTEGER,
        nombre_direccion VARCHAR(255),
        comuna VARCHAR(100)
    );

    -- Create table for PersonalAdmin.csv
    CREATE TABLE IF NOT EXISTS PersonalAdmin (
        pid INTEGER,
        clasificacion VARCHAR(50),
        uid INTEGER,
        jefe INTEGER
    );

    -- Create table for PersonalRepartidor.csv
    CREATE TABLE IF NOT EXISTS PersonalRepartidor (
        pid INTEGER,
        tipo_licencia VARCHAR(50),
        vid INTEGER
    );

    -- Create table for Unidades.csv
    CREATE TABLE IF NOT EXISTS Unidades (
        uid INTEGER,
        direccion INTEGER
    );

    -- Create table for UnidadesCobertura.csv
    CREATE TABLE IF NOT EXISTS UnidadesCobertura (
        uid INTEGER,
        comuna VARCHAR(100)
    );

    -- Create table for Vehiculos.csv
    CREATE TABLE IF NOT EXISTS Vehiculos (
        vid INTEGER,
        estado VARCHAR(20),
        uid INTEGER
    );

    -- Create table for VehiculosCarga.csv
    CREATE TABLE IF NOT EXISTS VehiculosCarga (
        vid INTEGER,
        volumen NUMERIC,
        cargamax NUMERIC
    );

    -- Create table for VehiculosFrescos.csv
    CREATE TABLE IF NOT EXISTS VehiculosFrescos (
        vid INTEGER,
        alcance NUMERIC
    );

    -- Create table for VehiculosFrios.csv
    CREATE TABLE IF NOT EXISTS VehiculosFrios (
        vid INTEGER,
        n_compartimientos NUMERIC,
        capacidad_compartimientos NUMERIC
    );

    -- Create table for VehiculosLicencia.csv
    CREATE TABLE IF NOT EXISTS VehiculosLicencia (
        vid INTEGER,
        licencia VARCHAR(50)
    );

    -- Create table for VehiculosPatente.csv
    CREATE TABLE IF NOT EXISTS VehiculosPatente (
        vid INTEGER,
        patente VARCHAR(20)
    );

    -- Import data
    IF (SELECT COUNT(*) FROM Personal) = 0 THEN
        COPY Personal FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/Personal.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM Despachos) = 0 THEN
        COPY Despachos FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/Despachos.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM Direcciones) = 0 THEN
        COPY Direcciones FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/Direcciones.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM PersonalAdmin) = 0 THEN
        COPY PersonalAdmin FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/PersonalAdmin.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM PersonalRepartidor) = 0 THEN
        COPY PersonalRepartidor FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/PersonalRepartidor.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM Unidades) = 0 THEN
        COPY Unidades FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/Unidades.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM UnidadesCobertura) = 0 THEN
        COPY UnidadesCobertura FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/UnidadesCobertura.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM Vehiculos) = 0 THEN
        COPY Vehiculos FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/Vehiculos.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM VehiculosCarga) = 0 THEN
        COPY VehiculosCarga FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/VehiculosCarga.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM VehiculosFrescos) = 0 THEN
        COPY VehiculosFrescos FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/VehiculosFrescos.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM VehiculosFrios) = 0 THEN
        COPY VehiculosFrios FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/VehiculosFrios.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM VehiculosLicencia) = 0 THEN
        COPY VehiculosLicencia FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/VehiculosLicencia.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM VehiculosPatente) = 0 THEN
        COPY VehiculosPatente FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G8/VehiculosPatente.csv' DELIMITER ',' CSV HEADER;
    END IF;

END
$$ language plpgsql
