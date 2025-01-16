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
  decimalLatitude DECIMAL(10,8),
  decimalLongitude DECIMAL(11,8),
  locality VARCHAR(255),
  habitat VARCHAR(255),
  notas VARCHAR(500),
  pais VARCHAR(255)
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
  -- Insertar ubicación
  SELECT insertar_ubicacion(decimalLatitude, decimalLongitude, locality, habitat, notas, pais) INTO id_ubicacion;
  
  -- Insertar en la tabla Evento_de_Coleccion
  INSERT INTO Evento_de_Coleccion(event_date, ID_Ubicacion, ID_RECOLECTOR) 
  VALUES (fecha_recoleccion, id_ubicacion, id_recolector) 
  RETURNING ID_Evento_Recoleccion INTO id_evento_coleccion;
  
  -- Insertar en la tabla descripcion_colecta
  INSERT INTO descripcion_colecta (id_evento, descripcion) 
  VALUES (id_evento_coleccion, detalles) 
  RETURNING id_evento INTO id_descripcion_recoleccion;
  
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

CREATE OR REPLACE FUNCTION insertar_imagen(urlImagenes TEXT[], catalogNumber INT)
RETURNS VOID AS $$
DECLARE
  id_imagen INT;
BEGIN
  FOR i IN 1..array_length(urlImagenes, 1) LOOP
    INSERT INTO imagenes (url, idtipo) 
    VALUES (urlImagenes[i], i) 
    RETURNING id_foto INTO id_imagen;
    
    INSERT INTO especimen_imagenes (id_foto, id_especimen) 
    VALUES (id_imagen, catalogNumber);
  END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_especie_duplicada(p_scientificName VARCHAR(255), p_catalogNumber INT)
RETURNS BOOLEAN AS $$
DECLARE
  especie_duplicada BOOLEAN;
BEGIN 
  SELECT EXISTS(
    SELECT 1 
    FROM especimen 
    WHERE scientificName = p_scientificName AND catalogNumber = p_catalogNumber
  ) INTO especie_duplicada;
  RETURN especie_duplicada;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_contribuidores(
  contribuidores TEXT[],
  acciones TEXT,
  detalles TEXT,
  apellidos_paternos_contribuidores TEXT[],
  apellidos_maternos_contribuidores TEXT[],
  id_datos INT
)
RETURNS VOID AS $$
DECLARE
  idObtenida INT;
BEGIN 
  FOR i IN 1..array_length(contribuidores, 1) LOOP
    SELECT id_persona INTO idObtenida
    FROM Persona 
    WHERE 
      nombre = contribuidores[i] AND  
      apellido_maternos = apellidos_maternos_contribuidores[i] AND 
      apellido_paterno = apellidos_paternos_contribuidores[i];

    INSERT INTO contribuidores(id_datos_recoleccion,nombre_trabajador,accion,detalles) 
    VALUES (id_datos, contribuidores[i],acciones,detalles);
  END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_ubicacion(
  p_decimalLatitude DECIMAL(10,8),
  p_decimalLongitude DECIMAL(11,8),
  p_locality VARCHAR(255),
  p_habitat VARCHAR(255),
  p_notas VARCHAR(500),
  p_pais VARCHAR(255)
)
RETURNS INT AS $$
DECLARE
  ubicacion_obtenida INT;
BEGIN
  INSERT INTO ubicacion (
    decimalLatitude,
    decimalLongitude,
    locality,
    habitat,
    notas,
    pais
  ) VALUES (
    p_decimalLatitude,
    p_decimalLongitude,
    p_locality,
    p_habitat,
    p_notas,
    p_pais
  ) 
  RETURNING ID_Ubicacion INTO ubicacion_obtenida;
  RETURN ubicacion_obtenida;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_metodo_preparacion(descripcion TEXT)
RETURNS INT AS $$
DECLARE 
  id_metodo INT;
BEGIN
  SELECT ID_preparacion INTO id_metodo 
  FROM metodoDePrepacion 
  WHERE descripcion_metodo = descripcion;

  IF id_metodo IS NULL THEN
    INSERT INTO metodoDePrepacion (descripcion_metodo) 
    VALUES (descripcion) 
    RETURNING ID_preparacion INTO id_metodo;
  END IF;
  
  RETURN id_metodo;
END;
$$ LANGUAGE plpgsql;

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

-- Corregir funciones auxiliares

CREATE OR REPLACE FUNCTION insertar_kingdom(nameKingdom TEXT) RETURNS INT AS $$
DECLARE
  id_kingdom_obtenida INT;
BEGIN
  SELECT id_kingdom INTO id_kingdom_obtenida
  FROM kingdom
  WHERE name_kingdom = nameKingdom;

  IF id_kingdom_obtenida IS NULL THEN
    INSERT INTO kingdom (name_kingdom)
    VALUES (nameKingdom)
    RETURNING id_kingdom INTO id_kingdom_obtenida;
  END IF;

  RETURN id_kingdom_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_phylum(namePhylum TEXT, idKingdom INT) RETURNS INT AS $$
DECLARE
  id_phylum_obtenida INT;
BEGIN
  SELECT id_phylum INTO id_phylum_obtenida
  FROM phylum
  WHERE name_phylum = namePhylum;

  IF id_phylum_obtenida IS NULL THEN
    INSERT INTO phylum (name_phylum, id_kingdom)
    VALUES (namePhylum, idKingdom)
    RETURNING id_phylum INTO id_phylum_obtenida;
  END IF;

  RETURN id_phylum_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_class(nameClass TEXT, idPhylum INT) RETURNS INT AS $$
DECLARE
  id_class_obtenida INT;
BEGIN
  SELECT id_class INTO id_class_obtenida
  FROM class
  WHERE name_class = nameClass;

  IF id_class_obtenida IS NULL THEN
    INSERT INTO class (name_class, id_phylum)
    VALUES (nameClass, idPhylum)
    RETURNING id_class INTO id_class_obtenida;
  END IF;

  RETURN id_class_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_order(nameOrder TEXT, idClass INT) RETURNS INT AS $$
DECLARE
  id_order_obtenida INT;
BEGIN
  SELECT id_order INTO id_order_obtenida
  FROM "Order"
  WHERE name_order = nameOrder;

  IF id_order_obtenida IS NULL THEN
    INSERT INTO "Order" (name_order, id_class)
    VALUES (nameOrder, idClass)
    RETURNING id_order INTO id_order_obtenida;
  END IF;

  RETURN id_order_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_family(nameFamily TEXT, idOrder INT) RETURNS INT AS $$
DECLARE
  id_family_obtenida INT;
BEGIN
  SELECT id_family INTO id_family_obtenida
  FROM family
  WHERE name_family = nameFamily;

  IF id_family_obtenida IS NULL THEN
    INSERT INTO family (name_family, id_order)
    VALUES (nameFamily, idOrder)
    RETURNING id_family INTO id_family_obtenida;
  END IF;

  RETURN id_family_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_genus(nameGenus TEXT, idFamily INT) RETURNS INT AS $$
DECLARE
  id_genus_obtenida INT;
BEGIN
  SELECT id_genus INTO id_genus_obtenida
  FROM Genus
  WHERE genus = nameGenus;

  IF id_genus_obtenida IS NULL THEN
    INSERT INTO Genus (genus, id_family)
    VALUES (nameGenus, idFamily)
    RETURNING id_genus INTO id_genus_obtenida;
  END IF;

  RETURN id_genus_obtenida;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insertar_Epitelo(nameEpitelo TEXT) RETURNS INT AS $$
DECLARE
  id_epitelo_obtenida INT;
BEGIN
  SELECT id_specificEpithet INTO id_epitelo_obtenida
  FROM EpiteloEspecifico
  WHERE epithet = nameEpitelo;

  IF id_epitelo_obtenida IS NULL THEN
    INSERT INTO EpiteloEspecifico (epithet)
    VALUES (nameEpitelo)
    RETURNING id_specificEpithet INTO id_epitelo_obtenida;
  END IF;

  RETURN id_epitelo_obtenida;
END; $$ LANGUAGE plpgsql;


-- VALIDAR LA IDENTIFICACION DE UNA ESPECIE

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


CREATE OR REPLACE PROCEDURE eliminar_imagen(id_especie INT) AS $$
DECLARE 
  id_imagen INT;
BEGIN
  

END;
$$ LANGUAGE plpgsql;



