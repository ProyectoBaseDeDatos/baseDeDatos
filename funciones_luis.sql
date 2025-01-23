-- FUNCIONES PARA INSERTAR IMAGENES
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

-- FUNCION PARA VALIDAR SI LA ESPECIE ESTA DUPLICADA
CREATE OR REPLACE FUNCTION validar_especie_duplicada(p_scientificName VARCHAR(255))
RETURNS BOOLEAN AS $$
DECLARE
  especie_duplicada BOOLEAN;
BEGIN 
  SELECT EXISTS(
    SELECT 1 
    FROM especimen 
    WHERE scientificName = p_scientificName
  ) INTO especie_duplicada;
  RETURN especie_duplicada;
END;
$$ LANGUAGE plpgsql;

-- FUNCION PARA INSERTAR LOS DATOS DE LOS CONTRIBUIDORES
CREATE OR REPLACE FUNCTION insertar_contribuidores(
  contribuidores TEXT[],
  acciones TEXT[],
  detalles TEXT[],
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
    VALUES (id_datos, contribuidores[i],acciones[i],detalles[i]);
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

-- FUNCION PARA INSERTAR UN METODO DE PREPACACION
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








-- FUNCIONES PARA VALIDAR ESPECIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

--FUNCIONES PARA INSERTAR EL REINO
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

-- FUNCION PARA INSERTAR ELL PHYLUM
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

-- FUNCION PARA INSERTAR LA CLASS
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

-- FUNCION PARA INSERTAR LA ORDER
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

-- FUNCION PARA INSERTAR LA FAMILY
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

-- FUNCION PARA INSERTAR LA GENUS
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

-- FUNCION PARA INSERTAR LA SPECIFIC EPITHECETE
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


CREATE OR REPLACE PROCEDURE sp_agregar_imagen_a_especimen(
    p_catalogNumber INTEGER,
    p_url TEXT,
    p_idTipo INTEGER
) 
RETURNS VOID AS
$$
BEGIN
    -- Verificar si el espécimen existe
    IF NOT EXISTS (SELECT 1 FROM Especimen WHERE catalogNumber = p_catalogNumber) THEN
        RAISE EXCEPTION 'Especimen con catalogNumber % no encontrado.', p_catalogNumber;
    END IF;

    -- Insertar la imagen en la tabla IMAGENES
    INSERT INTO IMAGENES (url, idTipo) 
    VALUES (p_url, p_idTipo);

    -- Asociar la imagen con el espécimen en la tabla especimen_imagenes
    INSERT INTO especimen_imagenes (id_especimen, id_foto) 
    VALUES (p_catalogNumber, CURRVAL('imagenes_id_foto_seq'));
    
END;
$$
LANGUAGE plpgsql;
call sp_agregar_imagen_a_especimen(12345, 'http://example.com/imagen.jpg', 1);


