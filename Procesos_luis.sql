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



