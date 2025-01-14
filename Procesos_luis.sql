CREATE OR REPLACE FUNCTION insertar_especie (
  id_recolector INT,
  scientificName VARCHAR(255),
  lifeStage VARCHAR(255),
  sexo VARCHAR(255),
  individualCount INT,
  descripcion_metodo VARCHAR(255),
  imagenes[],
  fecha_recoleccion DATE,
  nombres_contrubuidores TEXT[],
  apellidos_paternos_contribuidores TEXT[],
  apellido_maternos_contribuidores TEXT[],
  fechas_contribuidores DATE[],
  accion VARCHAR(255),
  detalles VARCHAR(255)
  decimalLatitude DECIMAL(10,8),
  decimalLongitude DECIMAL(11,8),
  locality VARCHAR(255),
  habitat VARCHAR(255),
  notas VARCHAR(500),
  pais VARCHAR(255),
  catalogNumber INT
)
RETURNS VOID AS $$
DECLARE 
  id_preparacion INT,
  especie_duplicada BOOLEAN;
  id_descripcion_recoleccion INT;
  id_ubicacion INT,
	id_evento_coleccion INT
BEGIN 

  --insertar imagenes
  insertar_imagen(imagenes, catalogNumber);
  -- insertar en la tabla ubicacioon
  SELECT insertar_ubicacion(decimalLatitude,decimalLongitude,locality,habitat,notas,pais) INTO id_ubicacion;
  -- insertamos en la tabla Evento_de__Coleccion
  INSERT INTO Evento_de_Coleccion(event_date, ID_Ubicacion, ID_RECOLECTOR) VALUES (fecha_recoleccion, id_ubicacion, id_recolector) RETURNING id INTO id_evento_coleccion;
  -- insertamos en la tabla descripcion_colecta
	INSERT INTO descripcion_colecta (id_evento, descripcion) VALUES (id_evento_coleccion, detalles) RETURNING id INTO id_descripcion_recoleccion;
  -- insertamos en la tabla de metodoDePrepracion
  SELECT insertar_metodo_recoleccion(descripcion_metodo) INTO id_metodo;
	
  -- insertar en la tabla de metodo de preparacion
  INSERT INTO metodoDePrepacion (descripcion_metodo) VALUES (descripcion_metodo) RETURNING id INTO id_preparacion;
  -- insertar en la tabla de datos de recoleccion
  INSERT INTO datosRecoleccion(catalogNumber,fecha_recoleccion) VALUES (catalogNumber, fecha_recoleccion) RETURNING id INTO id_datosRecoleccion;
  -- insertar en la tabla de contribuidores
  insertar_contribuidores(nombres_contrubuidores, apellidos_paternos_contribuidores, apellido_maternos_contribuidores, fechas_contribuidores, id_datosRecoleccion);
  

  -- insertar en la tabla de especimen
  especie_duplicada = validar_especie_duplicada(scientificName, catalogNumber);
  IF(especie_duplicada = FALSE) THEN
    INSERT INTO Especimen(
      ID_Evento_Recoleccion,
      ID_metodo,
      catalogNumber,
      scientificName,
      lifeStage,
      sex,
      individualCount,
      estado
    ) VALUES (
      (SELECT ID_Evento_Recoleccion FROM Evento_Recoleccion WHERE fecha_recoleccion = fecha_recoleccion AND nombre_trabajador = nombre_trabajador AND accion = accion AND detalles = detalles),
      id_preparacion,
      catalogNumber,
      scientificName,
      lifeStage,
      sexo,
      individualCount,,
      'recolectado')
    ;
END; $$ LANGUAGE plpgsql;

-- Proceso PARA LA INSERCION DE IMAGENES
CREATE OR RELACE FUNCTION insertar_imagen (
  urImagenes[],
  catalogNumber INT,
) RETURN VOID AS $$
DECLARE
  id_imagen INT;
BEGIN
  -- insertar imagenes
  FOR i IN 1..array_length(urlImagenes, 1) LOOP
    INSERT INTO imagenes (urlImagen, catalogNumber) VALUES (urlImagenes[i], catalogNumber) RETURNING id INTO id_imagen;
    INSERT INTO especimen_imagenes (id_imagen, catalogNumber) VALUES (id_imagen, catalogNumber);
  END LOOP;
END; $$ LANGUAGE plpgsql;

-- PROCESO PARA VALIDAR QUE EXISTAN ESPECIES DUPLICADAS

CREATE OR REPLACE FUNCTION validar_especie_duplicada(
  scientificName VARCHAR(255),
  catalogNumber INT,
)
RETURNS BOOLEAN AS $$
DECLARE
  especie_duplicada BOOLEAN;
BEGIN 
  SELECT EXISTS(SELECT 1 FROM especimen WHERE scientificName = scientificName AND catalogNumber = catalogNumber) INTO especie_duplicada;
  RETURN especie_duplicada;
END; $$ LANGUAGE plpgsql;

-- PROCESOS PARA INSERTAR CONTRIBUIDORES
CREATE OR REPALCE FUNCTION insertar_contribuidores(
    contribuidores TEXT[],accionContribuidores TEXT[], 
    detallesContribuidores TEXT[],
    fechas DATE[]
    apellido_maternos_contribuidores TEXT[],
    apellido_paternos_contribuidores TEXT[],
    id_datos
    
)
return BOOLEAN AS $$
DECLARE
  id INT;
BEGIN 
    FOR i IN 1..array_length(contribuidores, 1) LOOP
        SELECT id_persona FROM Persona 
        WHERE 
            nombre = contribuidores[i] AND  
            apellido_maternos = apellido_maternos_contribuidores[i] AND 
            apellido_paterno = apellido_paternos_contribuidores[i]
        INTO id;

        INSERT INTO contribuidores(id_datos_recoleccion,id,accion,detalles,fecha) VALUES (id_datos,id,accionContribuidores[i],detallesContribuidores[i],fechas[i]);
        
    END LOOP;

    RETURN TRUE;
END; $$ LANGUAGE plpgsql;

-- PROCESO PARA INSERTAR LA UBICACION DE LA RECOLECCION

CREATE OR REPLACE FUNCTION insertar_ubicacion(decimalLatitude DECIMAL(10,8),decimalLongitude DECIMAL(11,8),locality VARCHAR(255),habitat VARCHAR(255),notas VARCHAR(500),catalogNumber INT,pais VARCHAR(255))
RETURN INT AS $$
DECLARE
    id_ubicacion INT
BEGIN
    INSERT INTO ubicacion 
    (
      decimalLatitude,
      decimalLongitude,l
      ocality,habitat,
      notas,pais) 
    VALUES 
    (
      decimalLatitude,
			decimalLongitude,
      locality,habitat,
      notas,pais
    ) 
    RETURNING id INTO id_ubicacion;
    RETURN id_ubicacion;
END;

--- PROCESO PARA AGREGAR U OBTENER EL ID DEL METODO DE PREPARACION

CREATE OR REPLACE FUNCTION insertar_metodo_recoleccion(descripcion TEXT)
RETURNS INT AS $$
DECLARE
    id_metodo INT;
BEGIN
    -- Seleccionar el ID del método de preparación basado en la descripción
    SELECT ID_preparacion 
    INTO id_metodo 
    FROM metodoDePrepacion 
    WHERE descripcion_metodo = descripcion;

    -- Verificar si se encontró un ID válido
    IF id_metodo IS NOT NULL THEN
        RETURN id_metodo;
    ELSE
        -- Insertar un nuevo método de recolección si no se encontró uno existente
        INSERT INTO metodoRecoleccion (descripcion_metodo) 
        VALUES (descripcion) 
        RETURNING id INTO id_metodo;
        
        RETURN id_metodo;
    END IF;
END;
$$
 LANGUAGE plpgsql;



