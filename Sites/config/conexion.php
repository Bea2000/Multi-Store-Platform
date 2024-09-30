<?php
  try {
    #Pide las variables para conectarse a la base de datos.
    require('data.php'); 
    # Se crea la instancia de PDO
    $pdo = new PDO("pgsql:host=$host;port=$port", $superuser, $superuser_password);
    $pdo ->exec(file_get_contents('/var/www/html/bdd-proyect/Sites/db/create_db.sql'));
    $pdo->query('SELECT crear_db()');
    $db = new PDO("pgsql:dbname=$databaseName;host=localhost;port=5432;user=$superuser;password=$superuser_password");
    $db->exec(file_get_contents('/var/www/html/bdd-proyect/Sites/db/create_tables_db_1.sql'));
    $db->query('SELECT crear_tablas_db_1()');
    $db2 = new PDO("pgsql:dbname=$databaseName2;host=localhost;port=5432;user=$superuser;password=$superuser_password");
    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Sites/db/create_tables_db_2.sql'));
    $db2->query('SELECT crear_tablas_db_2()');

    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Entrega3/Procedimientos_Almacenados/insertar_es_jefe.sql'));
    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Entrega3/Procedimientos_Almacenados/insertar_usuario.sql'));
    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Entrega3/Procedimientos_Almacenados/insertar_clave.sql'));
    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Entrega3/Procedimientos_Almacenados/procedimiento_compra.sql'));
    $db2->exec(file_get_contents('/var/www/html/bdd-proyect/Entrega3/Procedimientos_Almacenados/verificar_ingreso.sql'));
  } catch (Exception $e) {
    echo "No se pudo conectar a la base de datos: $e";
  }

?>
