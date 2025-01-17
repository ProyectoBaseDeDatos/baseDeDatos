-- PROCESO PARA LA CREACION DE UN EVENTO DE COLECCION
CREATE OR REPLACE PROCEDURE crear_evento_de_coleccion(
  decimalLatitude DECIMAL(10,8),
  decimalLongitude DECIMAL(11,8),
  locality VARCHAR(255),
  habitat VARCHAR(255),
  notas VARCHAR(500),
  pais VARCHAR(255),
  fecha_limite DATE,
  maximo_especies INT,
) AS $$
DECLARE
  id_ubicacion INT;
BEGIN
  -- Insertar en la tabla Evento_de_C
  SELECT insertar_ubicacion(decimalLatitude, decimalLongitude, locality, habitat, notas, pais) INTO id_ubicacion;
  
  -- Insertar en la tabla Evento_de_Coleccion
  INSERT INTO Evento_de_Coleccion(fecha_final,maximo_de_especies,ID_Ubicacion) 
  VALUES (fecha_final, maximo_especies, id_ubicacion)

END;
$$ LANGUAGE plpgsql;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
-- PROCESOS PARA INSERTAR UNA ESPECIE
CREATE OR REPLACE PROCEDURE insertar_especie (
  id_recolector INT,
  scientificName VARCHAR(255),
  lifeStage VARCHAR(255),
  sexo VARCHAR(255),
  individualCount INT,
  descripcion_metodo VARCHAR(255),
  imagenes TEXT[],
  fecha_recoleccion DATE,
  nombres_contribuidores TEXT[],
  apellidos_paternos_contribuidores TEXT[],
  apellidos_maternos_contribuidores TEXT[],
  fechas_contribuidores DATE[],
  accion VARCHAR(255),
  detalles VARCHAR(255),
  id_evento_coleccion INT,
  descripcion TEXT,
  ubicacion_exacta TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE 
  especie_duplicada BOOLEAN;
  id_descripcion_recoleccion INT;
  id_ubicacion INT;
  id_evento_coleccion INT;
  id_metodo INT;
  catalog_number INT;
  id_datosRecoleccion INT;
BEGIN 
 
  -- Insertar en la tabla de metodoDePreparacion
  SELECT insertar_metodo_preparacion(descripcion_metodo) INTO id_metodo; 
  
  -- Verificar si la especie ya existe
  SELECT validar_especie_duplicada(scientificName, catalog_number) INTO especie_duplicada;
  
  -- Insertar en la tabla de especimen
  IF NOT especie_duplicada THEN
    INSERT INTO Especimen(
      ID_Evento_Recoleccion,
      ID_metodo,
      scientificName,
      lifeStage,
      sex,
      individualCount,
      estado
    ) VALUES (
      id_evento_coleccion,
      id_metodo,
      scientificName,
      lifeStage,
      sexo,
      individualCount,
      'recolectado'
    ) RETURNING catalogNumber INTO catalog_number;
  END IF;

  -- Insertar en la tabla descripcion_colecta
  INSERT INTO descripcion_colecta (id_especie, descripcion,ubicacion_exacta_colecta)
  VALUES (catalog_number, descripcion,ubicacion_exacta)
  RETURNING id_evento INTO id_descripcion_recoleccion;

  -- Insertar en la tabla de datos de recoleccion
  INSERT INTO datosRecoleccion(id_especimen, fecha_recoleccion)
  VALUES (catalog_number, fecha_recoleccion)
  RETURNING id_datos INTO id_datosRecoleccion;
  
  -- Insertar en la tabla de contribuidores
  PERFORM insertar_contribuidores(nombres_contribuidores,accion,detalles, apellidos_paternos_contribuidores, apellidos_maternos_contribuidores, id_datosRecoleccion);
  
  -- Insertar imágenes
  PERFORM insertar_imagen(imagenes, catalog_number);
END;
$$;



-- PROCESO PARA IDENFICAR UNA ESPECIE #############################################################

CREATE OR REPLACE PROCEDURE identificar_especimen(
  catalogNumber INT,
  tipo VARCHAR(255),
  scientificName VARCHAR(255),
  nameKingdom VARCHAR(255),
  namePhylum VARCHAR(255),
  nameClass VARCHAR(255),
  genus VARCHAR(255),
  nameOrder VARCHAR(255),
  nameFamily VARCHAR(255),
  apithet VARCHAR(255),
  contribuidores_nombre TEXT[], 
  apellidos_paternos_contribuidores TEXT[],
  apellidos_maternos_contribuidores TEXT[]
  acciones TEXT[],
  detalles TEXT[]
)
AS $$
DECLARE
  id_kingdom INT;
  id_phylum INT;
  id_class INT;
  id_genus INT;
  id_order INT;
  id_family INT;
  id_apithet INT;
  id_datos_obtenida;
BEGIN
  -- Validar e insertar taxonomías si no existen
  SELECT id_datos INTO id_datos_obtenida FROM datosRecoleccion 
  WHERE id_especimen = catalog_number;

  SELECT insertar_kingdom(nameKingdom) INTO id_kingdom;
  SELECT insertar_phylum(namePhylum, id_kingdom) INTO id_phylum;
  SELECT insertar_class(nameClass, id_phylum) INTO id_class;
  SELECT insertar_order(nameOrder, id_class) INTO id_order;
  SELECT insertar_family(nameFamily, id_order) INTO id_family;
  SELECT insertar_genus(genus, id_family) INTO id_genus;
  SELECT insertar_Epitelo(apithet) INTO id_apithet;

  -- añadir a todos los contribuidores
  SELECT insertar_contribuidores(contribuidores TEXT[],
  acciones TEXT,
  detalles TEXT,
  apellidos_paternos_contribuidores TEXT[],
  apellidos_maternos_contribuidores TEXT[],
  id_datos_obtenida INT
  );

  -- Insertar en TAXONOMIA
  INSERT INTO TAXONOMIA (taxonID,ID_especimen, Tipo, scientificName, kingdom, phylum, class, "order", family, genus, specificEpithet)
  VALUES (uuid_generate_v4(),catalogNumber, tipo, scientificName, id_kingdom, id_phylum, id_class, id_order, id_family, id_genus, id_apithet);

END; 
$$ LANGUAGE plpgsql;

-- PROCESOS PARA VALIDAR UNA ESPECIE

CREATE OR REPLACE PROCEDURE Validar_Identificacion_especimen(catalog_number, id_persona) AS $$
DECLARE
  nombre_profesor TEXT;
  id_datos_obteneida TEXT;
BEGIN
  UPDATE Especimen SET estado = 'identificado' WHERE catalogNumber = catalog_number;
  UPDATE datosRecoleccion SET fecha_validacion = NOW() WHERE id_datos = catalog_number;
  
  SELECT nombre INTO nombre_profesor FROM Persona WHERE ID_persona = id_persona;
  SELECT id_datos INTO id_datos_obteneida FROM datosRecoleccion WHERE id_especimen = catalog_number;

  INSERT INTO contribuidores(id_datos_recoleccion,id_contribuidor,nombre_trabajador,accion,detalles)
  VALUES(id_datos_obteneida,id_persona,nombre_profesor,'validacion','Validacion de la especie','');
  
END; 
LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- PROCESO PARA ELIMNAR UNA IMAGEN
CREATE OR REPLACE PROCEDURE eliminar_imagen(catalogNumber INT) AS $$
DECLARE
  IMAGENES INT;
BEGIN
  DELETE FROM especimen_imagenes WHERE id_especimen = catalogNumber;
END; 
$$ LANGUAGE plpgsql;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- VALIDAR USUARIO
CREATE OR REPLACE PROCEDURE validar_usuario(emailIngresado TEXT, contrasenaIngresada TEXT) AS $$
DECLARE
  usuario_valido TEXT;
BEGIN
  SELECT p.nombre
  INTO usuario_valido
  FROM usuario u
  JOIN Persona p ON u.id_Persona = p.ID_Persona
  JOIN TRABAJADOR T ON p.id_Persona = T.ID_PERSONA
  JOIN Rol r ON T.role = r.ID_Rol
  WHERE u.email = emailIngresado AND u.contraseña = contrasenaIngresada;

  IF usuario_valido IS NULL THEN
    RAISE EXCEPTION 'Error: contraseña o email no validos';
  ELSE
    RAISE NOTICE 'Usuario válido';
  END IF;

END; $$ LANGUAGE plpgsql;

