
-- version modificada
CREATE OR REPLACE PROCEDURE crear_evento_de_coleccion(
  decimalLatitude DECIMAL(10,8),
  decimalLongitude DECIMAL(11,8),
  locality VARCHAR(255),
  habitat VARCHAR(255),
  notas VARCHAR(500),
  pais VARCHAR(255),
  fecha_limite TIMESTAMP,
  maximo_especies INT
) AS $$
DECLARE
  id_ubicacion INT;
BEGIN
  -- Intentar insertar la ubicación
  SELECT insertar_ubicacion(decimalLatitude, decimalLongitude, locality, habitat, notas, pais) INTO id_ubicacion;

  -- Intentar insertar el evento
  INSERT INTO Evento_de_Coleccion(fecha_final, maximo_de_especies, ID_Ubicacion) 
  VALUES (fecha_limite, maximo_especies, id_ubicacion);

  -- Confirmar éxito
  RAISE NOTICE 'Evento creado exitosamente con ID de ubicación: %', id_ubicacion;

EXCEPTION
  WHEN CHECK_VIOLATION THEN
    RAISE EXCEPTION 'Violación de restricción CHECK: revise los datos ingresados.';
  WHEN FOREIGN_KEY_VIOLATION THEN
    RAISE EXCEPTION 'Violación de clave foránea: la ubicación no existe.';
  WHEN OTHERS THEN
    RAISE EXCEPTION 'Error desconocido: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
-- PROCESOS PARA INSERTAR UNA ESPECIE
-- version modificada

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
  accion TEXT[],
  detalles TEXT[],
  id_evento_coleccion INT,
  descripcion TEXT,
  ubicacion_exacta TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE 
  especie_duplicada BOOLEAN DEFAULT FALSE;
  id_metodo INT;
  catalog_number INT;
  id_descripcion_recoleccion INT;
  id_datosRecoleccion INT;
BEGIN
  -- Verificar si la especie ya existe
  BEGIN
    SELECT validar_especie_duplicada(scientificName) INTO especie_duplicada;
    IF especie_duplicada THEN
      RAISE EXCEPTION 'La especie "%", ya existe. No se insertará un nuevo registro.', scientificName;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al verificar si la especie ya existe: %', SQLERRM;
  END;
  -- Insertar en la tabla de metodoDePreparacion
 BEGIN
    SELECT insertar_metodo_preparacion(descripcion_metodo) INTO id_metodo;
    RAISE NOTICE 'Método de preparación insertado con ID: %', id_metodo;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el método de preparación: %', SQLERRM;
  END;
  -- Insertar en la tabla de Especimen
  BEGIN
    INSERT INTO Especimen (
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
    RAISE NOTICE 'Especimen insertado con catalogNumber: %', catalog_number;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar en la tabla Especimen: %', SQLERRM;
  END;

  -- Insertar en la tabla descripcion_colecta
  BEGIN
    INSERT INTO descripcion_colecta (id_especie, descripcion, ubicacion_exacta_colecta)
    VALUES (catalog_number, descripcion, ubicacion_exacta)
    RETURNING id_especie INTO id_descripcion_recoleccion;
    RAISE NOTICE 'Descripción de colecta insertada con ID: %', id_descripcion_recoleccion;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar en la tabla descripcion_colecta: %', SQLERRM;
  END;

  -- Insertar en la tabla de datos de recoleccion
  BEGIN
    INSERT INTO datosRecoleccion (id_especimen, fecha_recoleccion)
    VALUES (catalog_number, fecha_recoleccion)
    RETURNING id_datos INTO id_datosRecoleccion;
    RAISE NOTICE 'Datos de recolección insertados con ID: %', id_datosRecoleccion;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar en la tabla datosRecoleccion: %', SQLERRM;
  END;

  -- Insertar en la tabla de contribuidores
  BEGIN
    PERFORM insertar_contribuidores(nombres_contribuidores, accion, detalles, apellidos_paternos_contribuidores, apellidos_maternos_contribuidores, id_datosRecoleccion);
    RAISE NOTICE 'Contribuidores insertados exitosamente.';
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar contribuidores: %', SQLERRM;
  END;

  -- Insertar imágenes
  BEGIN
    PERFORM insertar_imagen(imagenes, catalog_number);
    RAISE NOTICE 'Imágenes asociadas con el especimen insertadas exitosamente.';
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar imágenes: %', SQLERRM;
  END;
END;
$$;

-- PROCESO PARA IDENFICAR UNA ESPECIE #############################################################

-- version modificada
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
  apellidos_maternos_contribuidores TEXT[],
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
  id_datos_obtenida INT;
  num_contribuidores INT;
BEGIN
  -- Validar que el especimen existe
  SELECT id_datos INTO id_datos_obtenida 
  FROM datosRecoleccion 
  WHERE id_especimen = catalogNumber;

  IF id_datos_obtenida IS NULL THEN
    RAISE EXCEPTION 'El especimen con catalogNumber % no existe en la base de datos.', catalogNumber;
  END IF;

  -- Validar e insertar taxonomías si no existen
  BEGIN
    SELECT insertar_kingdom(nameKingdom) INTO id_kingdom;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el reino: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_phylum(namePhylum, id_kingdom) INTO id_phylum;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el phylum: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_class(nameClass, id_phylum) INTO id_class;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar la clase: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_order(nameOrder, id_class) INTO id_order;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el orden: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_family(nameFamily, id_order) INTO id_family;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar la familia: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_genus(genus, id_family) INTO id_genus;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el género: %', SQLERRM;
  END;

  BEGIN
    SELECT insertar_Epitelo(apithet) INTO id_apithet;
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar el epíteto específico: %', SQLERRM;
  END;

  -- Añadir a los contribuidores
  num_contribuidores := array_length(contribuidores_nombre, 1);  -- Obtener la longitud de los arreglos

  -- Validar si los arreglos están vacíos o tienen longitudes inconsistentes
  IF num_contribuidores IS NULL OR num_contribuidores = 0 THEN
    RAISE EXCEPTION 'No se han proporcionado contribuyentes.';
  END IF; 
  num_contribuidores := array_length(apellidos_paternos_contribuidores, 1);
  IF num_contribuidores IS NULL OR num_contribuidores = 0 OR THEN
     RAISE EXCEPTION 'El arreglo apellidos paternos esta vacio';
  END IF;
  num_contribuidores := array_length(apellidos_maternos_contribuidores, 1);
  IF num_contribuidores IS NULL OR num_contribuidores = 0 OR THEN
    RAISE EXCEPTION 'El arreglo apellidos maternos esta vacio';
  END IF;
  num_contribuidores := array_length(acciones, 1);
  IF num_contribuidores IS NULL OR num_contribuidores = 0 OR THEN
    RAISE EXCEPTION 'El arreglo de acciones esta vacio';
  END IF;
  num_contribuidores := array_length(detalles, 1);
  IF num_contribuidores IS NULL OR num_contribuidores = 0 OR THEN
    RAISE EXCEPTION 'El arreglo de detalles esta vacio';
  END IF;

  -- Insertar los contribuyentes si las validaciones pasan
  PERFORM insertar_contribuidores(
    contribuidores_nombre,
    acciones,
    detalles,
    apellidos_paternos_contribuidores,
    apellidos_maternos_contribuidores,
    id_datos_obtenida
  );
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar los contribuidores: %', SQLERRM;


  -- Insertar en TAXONOMIA
  BEGIN
    INSERT INTO TAXONOMIA (taxonID, ID_especimen, Tipo, scientificName, kingdom, phylum, class, "order", family, genus, specificEpithet)
    VALUES (uuid_generate_v4(), catalogNumber, tipo, scientificName, id_kingdom, id_phylum, id_class, id_order, id_family, id_genus, id_apithet);
  EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION 'Error al insertar en la tabla TAXONOMIA: %', SQLERRM;
  END;
  
END;
$$ LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CREATE OR REPLACE PROCEDURE Validar_Identificacion_especimen(
  catalog_number_ingresado INT, 
  id_persona_ingresada INT
) 
AS $$
DECLARE
  nombre_profesor TEXT;
  id_datos_obtenida INT;
BEGIN
  -- Actualizar estado del espécimen
  UPDATE Especimen 
  SET estado = 'identificado' 
  WHERE catalogNumber = catalog_number_ingresado;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Error: No se encontró ningún especimen con catalogNumber %', catalog_number_ingresado;
  END IF;
  RAISE NOTICE 'Estado del especimen con catalogNumber % actualizado a ''identificado''.', catalog_number_ingresado;

  -- Actualizar fecha de validación en datosRecoleccion
  UPDATE datosRecoleccion 
  SET fecha_validacion = NOW() 
  WHERE id_datos = catalog_number_ingresado;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Error: No se encontró registro en datosRecoleccion para catalogNumber %', catalog_number_ingresado;
  END IF;
  RAISE NOTICE 'Fecha de validación actualizada en datosRecoleccion para catalogNumber %.', catalog_number_ingresado;

  -- Obtener nombre del profesor
  SELECT nombre 
  INTO nombre_profesor 
  FROM Persona 
  WHERE ID_persona = id_persona_ingresada;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Error: No se encontró persona con ID_persona %', id_persona_ingresada;
  END IF;
  RAISE NOTICE 'Nombre del profesor obtenido: %', nombre_profesor;

  -- Obtener id_datos
  SELECT id_datos 
  INTO id_datos_obtenida 
  FROM datosRecoleccion 
  WHERE id_especimen = catalog_number_ingresado;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Error: No se encontró id_datos para catalogNumber %', catalog_number_ingresado;
  END IF;
  RAISE NOTICE 'id_datos obtenido: %', id_datos_obtenida;

  -- Insertar en la tabla contribuidores
  INSERT INTO contribuidores(
    id_datos_recoleccion,
    id_contribuidor,
    nombre_trabajador,
    accion,
    detalles
  ) 
  VALUES (
    id_datos_obtenida, 
    id_persona_ingresada, 
    nombre_profesor, 
    'validacion', 
    'Validacion de la especie'
  );
  RAISE NOTICE 'Registro insertado en la tabla contribuidores para catalogNumber % y id_persona %.', catalog_number_ingresado, id_persona_ingresada;

  RAISE NOTICE 'Validación completada exitosamente para catalogNumber %.', catalog_number_ingresado;

EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION 'Ocurrió un error: %', SQLERRM;
END; 
$$ LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- PROCESO PARA ELIMNAR UNA IMAGEN
CREATE OR REPLACE PROCEDURE eliminar_imagen(catalogNumber INT) AS $$
DECLARE
  IMAGENES INT;
BEGIN
  -- Verificar si existen imágenes asociadas al catalogNumber
  SELECT COUNT(*) INTO IMAGENES FROM especimen_imagenes WHERE id_especimen = catalogNumber;

  IF IMAGENES = 0 THEN
    RAISE NOTICE 'No se encontraron imágenes para el especimen con catalogNumber %.', catalogNumber;
  ELSE
    -- Eliminar las imágenes
    DELETE FROM especimen_imagenes WHERE id_especimen = catalogNumber;
    RAISE NOTICE 'Se han eliminado % imagen(es) del especimen con catalogNumber %.', IMAGENES, catalogNumber;
  END IF;
END;
$$ LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- VALIDAR USUARIO
CREATE OR REPLACE FUNCTION validar_usuarios(
  emailIngresado TEXT, 
  contrasenaIngresada TEXT
) 
RETURNS TABLE(
  mensaje TEXT, 
  id_persona INT, 
  nombre TEXT, 
  email TEXT, 
  rol TEXT
) AS $$
BEGIN
  -- Se intenta obtener la información del usuario
  RETURN QUERY
  SELECT 
    'Usuario válido' AS mensaje,
    p.id_persona,
    p.nombre,
    u.email,
    r.nombre AS rol
  FROM usuario u
  JOIN Persona p ON u.id_persona = p.id_persona
  JOIN TRABAJADOR T ON p.id_persona = T.id_persona
  JOIN Rol r ON T.id_role = r.id_rol
  WHERE u.email = emailIngresado AND u.contraseña = contrasenaIngresada AND r.nombre = 'identificador';

  -- Si no se encuentra el usuario, se asigna el mensaje de error
  IF NOT FOUND THEN
    RETURN QUERY SELECT 'Error: usuario no encontrado', NULL, NULL, NULL, NULL;
  END IF;
END; 
$$ LANGUAGE plpgsql;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CREATE OR REPLACE FUNCTION sp_contar_muestras_por_coleccionista(p_id_coleccionista INTEGER)
RETURNS INTEGER
AS $$
DECLARE
    v_numero_muestras INTEGER;
BEGIN
    -- Contar el número de muestras recolectadas por el coleccionista
    SELECT COUNT(DISTINCT E.catalogNumber)
    INTO v_numero_muestras
    FROM Especimen E
    JOIN evento_colectores EC ON E.ID_Evento_Recoleccion = EC.id_evento_recoleccion
    WHERE EC.id_recolector = p_id_coleccionista;

    -- Devolver el resultado
    RETURN v_numero_muestras;
END;
$$ LANGUAGE plpgsql;


-- funcion para que logre retornar el valor
CREATE OR REPLACE FUNCTION sp_recuperar_muestra_por_id(p_catalogNumber INTEGER)
RETURNS TABLE (
    ID_especimen INTEGER,
    nombre_cientifico TEXT,
    etapa_vida TEXT,
    sexo TEXT,
    cantidad_individuos INTEGER,
    estado_especimen TEXT,
    observaciones TEXT,
    ubicacion_exacta_colecta TEXT,
    taxonomia TEXT,
    coleccionista TEXT,
    imagen_url TEXT
) 
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        E.catalogNumber AS ID_especimen,
        E.scientificName AS nombre_cientifico,
        E.lifeStage AS etapa_vida,
        E.sex AS sexo,
        E.individualCount AS cantidad_individuos,
        E.estado AS estado_especimen,
        DC.descripcion AS observaciones,
        DC.ubicacion_exacta_colecta AS ubicacion_exacta_colecta,
        T.scientificName AS taxonomia,
        P.nombre || ' ' || P.apellido_paterno || ' ' || P.apellido_maternos AS coleccionista,
        I.url AS imagen_url
    FROM 
        Especimen E
    JOIN 
        descripcion_colecta DC ON E.catalogNumber = DC.id_especie
    JOIN 
        TAXONOMIA T ON E.catalogNumber = T.ID_especimen
    JOIN 
        evento_colectores EC ON E.ID_Evento_Recoleccion = EC.id_evento_recoleccion
    JOIN 
        Persona P ON EC.id_recolector = P.ID_Persona
    JOIN 
        especimen_imagenes EI ON E.catalogNumber = EI.id_especimen
    JOIN 
        IMAGENES I ON EI.id_foto = I.id_foto
    WHERE 
        E.catalogNumber = p_catalogNumber;
END;
$$ LANGUAGE plpgsql;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CREATE OR REPLACE FUNCTION sp_buscar_especimen_por_taxonomia(
    p_kingdom INTEGER = NULL,
    p_phylum INTEGER = NULL,
    p_class INTEGER = NULL,
    p_order INTEGER = NULL,
    p_family INTEGER = NULL,
    p_genus INTEGER = NULL,
    p_speficic_epithet INTEGER = NULL
)
RETURNS TABLE (
    catalogNumber INT,
    scientificName TEXT,
    kingdom TEXT,
    phylum TEXT,
    class TEXT,
    "order" TEXT,
    family TEXT,
    genus TEXT,
    specificEpithet TEXT
) 
AS $$
BEGIN
    RETURN QUERY
    SELECT E.catalogNumber,
           E.scientificName,
           K.name_kingdom AS kingdom,
           P.name_phylum AS phylum,
           C.name_class AS class,
           O.name_order AS "order",
           F.name_family AS family,
           G.genus AS genus,
           SE.epithet AS specificEpithet
    FROM Especimen E
    JOIN TAXONOMIA T ON E.catalogNumber = T.ID_especimen
    JOIN kingdom K ON T.kingdom = K.ID_kingdom
    JOIN phylum P ON T.phylum = P.id_phylum
    JOIN class C ON T.class = C.id_class
    JOIN "Order" O ON T."order" = O.id_order
    JOIN family F ON T.family = F.id_family
    JOIN Genus G ON T.genus = G.id_genus
    JOIN EpiteloEspecifico SE ON T.specificEpithet = SE.id_specificEpithet
    WHERE (p_kingdom IS NULL OR T.kingdom = p_kingdom)
      AND (p_phylum IS NULL OR T.phylum = p_phylum)
      AND (p_class IS NULL OR T.class = p_class)
      AND (p_order IS NULL OR T."order" = p_order)
      AND (p_family IS NULL OR T.family = p_family)
      AND (p_genus IS NULL OR T.genus = p_genus)
      AND (p_speficic_epithet IS NULL OR T.specificEpithet = p_speficic_epithet);
END;
$$ LANGUAGE plpgsql;

