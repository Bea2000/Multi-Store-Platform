CREATE OR REPLACE FUNCTION

-- declaramos la función y sus argumentos
crear_tablas_db_2()

RETURNS void AS $$

DECLARE

-- declaramos el lenguaje de la función
BEGIN 

-- Create table for compras.csv
    CREATE TABLE IF NOT EXISTS compras (
        id INTEGER,
        id_usuario INTEGER,
        id_direccion INTEGER,
        id_tienda INTEGER
    );

    -- Create table for comunas.csv
    CREATE TABLE IF NOT EXISTS comunas (
        id INTEGER,
        nombre_comuna VARCHAR(100)
    );

    -- Create table for despacha_a.csv
    CREATE TABLE IF NOT EXISTS despacha_a (
        id_tienda INTEGER,
        id_comuna INTEGER
    );

    -- Create table for direcciones_usuarios.csv
    CREATE TABLE IF NOT EXISTS direcciones_usuarios (
        id_usuario INTEGER,
        id_direccion INTEGER
    );

    -- Create table for direcciones.csv
    CREATE TABLE IF NOT EXISTS direcciones (
        id INTEGER,
        direccion VARCHAR(255),
        id_comuna INTEGER
    );

    -- Create table for personal.csv
    CREATE TABLE IF NOT EXISTS personal (
        id INTEGER,
        id_tienda INTEGER,
        nombre VARCHAR(100),
        rut VARCHAR(20),
        edad INTEGER,
        sexo VARCHAR(10),
        es_jefe BOOLEAN
    );

    -- Create table for producto_comprado.csv
    CREATE TABLE IF NOT EXISTS producto_comprado (
        id_compra INTEGER,
        id_producto INTEGER,
        cantidad INTEGER
    );

    -- Create table for productos_comestibles.csv
    CREATE TABLE IF NOT EXISTS productos_comestibles (
        id INTEGER,
        fecha_expiracion DATE,
        subcategoria VARCHAR(50)
    );

    -- Create table for productos_frescos.csv
    CREATE TABLE IF NOT EXISTS productos_frescos (
        id INTEGER,
        duracion_sin_refrigerar INTEGER
    );

    -- Create table for productos_congelados.csv
    CREATE TABLE IF NOT EXISTS productos_congelados (
        id INTEGER,
        peso NUMERIC
    );

    -- Create table for productos_no_comestibles.csv
    CREATE TABLE IF NOT EXISTS productos_no_comestibles (
        id INTEGER,
        ancho INTEGER,
        largo INTEGER,
        alto INTEGER,
        peso NUMERIC
    );

    -- Create table for productos_conservas.csv
    CREATE TABLE IF NOT EXISTS productos_conservas (
        id INTEGER,
        metodo_conserva VARCHAR(50)
    );

    -- Create table for productos.csv
    CREATE TABLE IF NOT EXISTS productos (
        id INTEGER,
        nombre VARCHAR(255),
        precio INTEGER,
        descripcion TEXT,
        categoria VARCHAR(50)
    );

    -- Create table for tiendas.csv
    CREATE TABLE IF NOT EXISTS tiendas (
        id INTEGER,
        id_direccion INTEGER,
        nombre VARCHAR(100)
    );

    -- Create table for usuarios.csv
    CREATE TABLE IF NOT EXISTS usuarios (
        id INTEGER,
        nombre VARCHAR(200),
        rut VARCHAR(20),
        edad INTEGER,
        sexo VARCHAR(10)
    );

    -- Create table for vende.csv
    CREATE TABLE IF NOT EXISTS vende (
        id_tienda INTEGER,
        id_producto INTEGER
    );

    -- Import data
    IF (SELECT COUNT(*) FROM compras) = 0 THEN
        COPY compras FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/compras.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM comunas) = 0 THEN
        COPY comunas FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/comunas.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM despacha_a) = 0 THEN
        COPY despacha_a FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/despacha_a.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM direcciones_usuarios) = 0 THEN
        COPY direcciones_usuarios FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/direcciones_usuarios.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM direcciones) = 0 THEN
        COPY direcciones FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/direcciones.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM personal) = 0 THEN
        COPY personal FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/personal.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM producto_comprado) = 0 THEN
        COPY producto_comprado FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/producto_comprado.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos_comestibles) = 0 THEN
        COPY productos_comestibles FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos_comestibles.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos_frescos) = 0 THEN
        COPY productos_frescos FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos_frescos.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos_congelados) = 0 THEN
        COPY productos_congelados FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos_congelados.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos_no_comestibles) = 0 THEN
        COPY productos_no_comestibles FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos_no_comestibles.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos_conservas) = 0 THEN
        COPY productos_conservas FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos_conservas.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM productos) = 0 THEN
        COPY productos FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/productos.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM tiendas) = 0 THEN
        COPY tiendas FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/tiendas.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM usuarios) = 0 THEN
        COPY usuarios FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/usuarios.csv' DELIMITER ',' CSV HEADER;
    END IF;

    IF (SELECT COUNT(*) FROM vende) = 0 THEN
        COPY vende FROM '/var/www/html/bdd-proyect/Entrega3/Datos/G149/vende.csv' DELIMITER ',' CSV HEADER;
    END IF;
        
END
$$ language plpgsql
