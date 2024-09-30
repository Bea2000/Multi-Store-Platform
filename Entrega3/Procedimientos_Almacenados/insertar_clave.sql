CREATE OR REPLACE FUNCTION

-- declaramos la función y sus argumentos
insertar_clave()

-- declaramos lo que retorna 
RETURNS void AS $$

-- declaramos las variables a utilizar si es que es necesario
DECLARE

uidmax int;
randomi int;

-- definimos nuestra función
BEGIN

    SELECT INTO uidmax
    MAX(id)
    FROM usuarios;

    IF 'contrasena' NOT IN (SELECT column_name FROM information_schema.columns WHERE table_name='usuarios') THEN
        ALTER TABLE usuarios ADD contrasena int;
        FOR id_1 in 0 .. uidmax LOOP
            SELECT INTO randomi
            FLOOR(random() * (9999 - 1000 + 1) + 1000)::int;
            UPDATE usuarios SET contrasena = randomi WHERE id = id_1;
        END LOOP;
    END IF;

END
$$ language plpgsql