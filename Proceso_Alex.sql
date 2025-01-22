--1
CREATE OR REPLACE FUNCTION actualizar_datos_recoleccion(
    p_id_evento INT,
    p_nueva_fecha TIMESTAMP WITH TIME ZONE,
    p_nuevo_maximo_especies INTEGER,
    p_nuevo_estado TEXT,
    p_nuevo_id_ubicacion INTEGER
)
RETURNS VOID AS $$
BEGIN
    -- Validar el nuevo estado
    IF p_nuevo_estado NOT IN ('finalizado', 'activo') THEN
        RAISE EXCEPTION 'El estado debe ser "finalizado" o "activo"';
    END IF;
    -- Validar la nueva fecha
    IF p_nueva_fecha < CURRENT_TIMESTAMP THEN
        RAISE EXCEPTION 'La nueva fecha no puede ser anterior a la fecha actual';
    END IF;
    -- Validar el nuevo máximo de especies
    IF p_nuevo_maximo_especies <= 0 THEN
        RAISE EXCEPTION 'El máximo de especies debe ser mayor que 0';
    END IF;
    -- Actualizar Evento_de_Coleccion
    UPDATE Evento_de_Coleccion
    SET 
        fecha_final = p_nueva_fecha,
        maximo_de_especies = p_nuevo_maximo_especies,
        estado_del_evento = p_nuevo_estado,
        ID_Ubicacion = p_nuevo_id_ubicacion
    WHERE ID_Evento_Recoleccion = p_id_evento;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se encontró el evento de recolección con ID %', p_id_evento;
    END IF;
    RAISE NOTICE 'Datos de recolección actualizados con éxito para el evento ID %', p_id_evento;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error al actualizar datos de recolección: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;

--2

CREATE OR REPLACE FUNCTION revision_taxonomica(
    p_id_especimen INT,
    p_kingdom TEXT,
    p_phylum TEXT,
    p_class TEXT,
    p_order TEXT,
    p_family TEXT,
    p_genus TEXT,
    p_species TEXT
)
RETURNS VOID AS $$
DECLARE
    -- IDs para jerarquías
    v_id_kingdom INT;
    v_id_phylum INT;
    v_id_class INT;
    v_id_order INT;
    v_id_family INT;
    v_id_genus INT;
    v_id_epithet INT;
    v_taxon_id UUID;
BEGIN
    -- Validar parámetros obligatorios
    IF p_species IS NULL OR p_kingdom IS NULL OR p_phylum IS NULL THEN
        RAISE EXCEPTION 'Species, kingdom, and phylum cannot be null';
    END IF;

    -- Verificar e insertar en Kingdom
    SELECT ID_kingdom INTO v_id_kingdom FROM kingdom WHERE name_kingdom = p_kingdom;
    IF v_id_kingdom IS NULL THEN
        INSERT INTO kingdom (name_kingdom) VALUES (p_kingdom) RETURNING ID_kingdom INTO v_id_kingdom;
    END IF;

    -- Verificar e insertar en Phylum
    SELECT id_phylum INTO v_id_phylum FROM phylum WHERE name_phylum = p_phylum AND id_reino = v_id_kingdom;
    IF v_id_phylum IS NULL THEN
        INSERT INTO phylum (name_phylum, id_reino) VALUES (p_phylum, v_id_kingdom) RETURNING id_phylum INTO v_id_phylum;
    END IF;

    -- Verificar e insertar en Class
    SELECT id_class INTO v_id_class FROM class WHERE name_class = p_class AND id_phylum = v_id_phylum;
    IF v_id_class IS NULL THEN
        INSERT INTO class (name_class, id_phylum) VALUES (p_class, v_id_phylum) RETURNING id_class INTO v_id_class;
    END IF;

    -- Verificar e insertar en Order
    SELECT id_order INTO v_id_order FROM "Order" WHERE name_order = p_order AND id_class = v_id_class;
    IF v_id_order IS NULL THEN
        INSERT INTO "Order" (name_order, id_class) VALUES (p_order, v_id_class) RETURNING id_order INTO v_id_order;
    END IF;

    -- Verificar e insertar en Family
    SELECT id_family INTO v_id_family FROM family WHERE name_family = p_family AND id_order = v_id_order;
    IF v_id_family IS NULL THEN
        INSERT INTO family (name_family, id_order) VALUES (p_family, v_id_order) RETURNING id_family INTO v_id_family;
    END IF;

    -- Verificar e insertar en Genus
    SELECT id_genus INTO v_id_genus FROM Genus WHERE genus = p_genus AND id_family = v_id_family;
    IF v_id_genus IS NULL THEN
        INSERT INTO Genus (genus, id_family) VALUES (p_genus, v_id_family) RETURNING id_genus INTO v_id_genus;
    END IF;

    -- Verificar e insertar en EpiteloEspecifico
    v_id_epithet := NULL; -- Por si no hay epiteto específico
    IF split_part(p_species, ' ', 2) IS NOT NULL THEN
        SELECT id_specificEpithet INTO v_id_epithet 
        FROM EpiteloEspecifico WHERE epithet = split_part(p_species, ' ', 2);
        IF v_id_epithet IS NULL THEN
            INSERT INTO EpiteloEspecifico (epithet) VALUES (split_part(p_species, ' ', 2))
            RETURNING id_specificEpithet INTO v_id_epithet;
        END IF;
    END IF;

    -- Actualizar tabla Especimen
    UPDATE Especimen
    SET 
        scientificName = p_species,
        estado = 'identificado'
    WHERE catalogNumber = p_id_especimen;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No specimen found with ID %', p_id_especimen;
    END IF;

    -- Actualizar o insertar en Taxonomia
    SELECT taxonID INTO v_taxon_id FROM TAXONOMIA WHERE ID_especimen = p_id_especimen;

    IF v_taxon_id IS NULL THEN
        INSERT INTO TAXONOMIA (taxonID, ID_especimen, Tipo, scientificName, kingdom, phylum, class, "order", family, genus, specificEpithet)
        VALUES (gen_random_uuid(), p_id_especimen, 'Species', p_species, v_id_kingdom, v_id_phylum, v_id_class, v_id_order, v_id_family, v_id_genus, v_id_epithet);
    ELSE
        UPDATE TAXONOMIA
        SET 
            Tipo = 'Species',
            scientificName = p_species,
            kingdom = v_id_kingdom,
            phylum = v_id_phylum,
            class = v_id_class,
            "order" = v_id_order,
            family = v_id_family,
            genus = v_id_genus,
            specificEpithet = v_id_epithet
        WHERE taxonID = v_taxon_id;
    END IF;

END;
$$ LANGUAGE plpgsql;

--3

CREATE OR REPLACE FUNCTION validar_especimen(p_id_especimen INT)
RETURNS VOID AS $$
DECLARE
    v_taxon_count INT;
    v_fecha_validacion TIMESTAMP := CURRENT_TIMESTAMP;
BEGIN
    -- Verificar que el espécimen tiene una identificación completa
    SELECT COUNT(*) INTO v_taxon_count
    FROM TAXONOMIA
    WHERE ID_especimen = p_id_especimen
      AND kingdom IS NOT NULL
      AND phylum IS NOT NULL
      AND class IS NOT NULL
      AND "order" IS NOT NULL
      AND family IS NOT NULL
      AND genus IS NOT NULL
      AND specificEpithet IS NOT NULL;

    -- Si no está completamente identificado, lanzar una excepción
    IF v_taxon_count = 0 THEN
        RAISE EXCEPTION 'El espécimen con ID % no tiene una identificación completa y no puede ser validado', p_id_especimen;
    END IF;

    -- Actualizar el estado del espécimen a "validado"
    UPDATE Especimen
    SET estado = 'validado'
    WHERE catalogNumber = p_id_especimen;

    -- Verificar si el espécimen existe en la tabla Especimen
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se encontró el espécimen con ID %', p_id_especimen;
    END IF;

    -- Registrar la fecha de validación en datosRecoleccion
    UPDATE datosRecoleccion
    SET fecha_validacion = v_fecha_validacion
    WHERE id_especimen = p_id_especimen;

    -- Si no existe un registro en datosRecoleccion, crear uno nuevo
    IF NOT FOUND THEN
        INSERT INTO datosRecoleccion (id_especimen, fecha_validacion)
        VALUES (p_id_especimen, v_fecha_validacion);
    END IF;

    RAISE NOTICE 'El espécimen con ID % ha sido validado exitosamente.', p_id_especimen;
END;
$$ LANGUAGE plpgsql;