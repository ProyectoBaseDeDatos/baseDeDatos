-- recuperar informacion de especimenes con estado pendiente
CREATE OR REPLACE PROCEDURE recuperar_especimenes_pendientes()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
    cursorBuscar CURSOR FOR SELECT * FROM Especimen WHERE estado = 'pendiente_identificacion';
BEGIN    
    OPEN cursorBuscar;  

    LOOP
        FETCH cursorBuscar INTO rec;  
        EXIT WHEN NOT FOUND;  
        RAISE NOTICE 'ID_Evento_Recoleccion: %, ID_metodo: %, catalogNumber: %, scientificName: %, lifeStage: %, sex: %, individualCount: %, Estado: %', 
            rec.ID_Evento_Recoleccion, rec.ID_metodo, rec.catalogNumber, rec.scientificName, rec.lifeStage, rec.sex, rec.individualCount, rec.estado;  -- Mostrar el registro
    END LOOP;

    CLOSE cursorBuscar;  
END;
$$;


--Eliminar un especimen dado un estado del especimen
CREATE OR REPLACE PROCEDURE eliminar_especimen_por_estado(estado_especimen TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
    nombre_eliminado TEXT;
BEGIN
    ALTER TABLE TAXONOMIA
    DROP CONSTRAINT IF EXISTS taxonomia_id_especimen_fkey;

    ALTER TABLE TAXONOMIA
    ADD CONSTRAINT taxonomia_id_especimen_fkey
    FOREIGN KEY (ID_especimen) REFERENCES Especimen(catalogNumber)
    ON DELETE CASCADE;

    DELETE FROM Especimen
    WHERE estado = estado_especimen
    RETURNING scientificName INTO nombre_eliminado;
	RAISE NOTICE 'Especimen eliminado';

    IF nombre_eliminado IS NULL THEN
        RAISE NOTICE 'No se encontro especimen con el estado: %', estado_especimen;
    END IF;
END;
$$;

--obtener informacion de recoleccion dado un id del trabajador
CREATE OR REPLACE PROCEDURE infoRecolecciones(
    p_id_trabajador INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    recoleccion RECORD;
    recoleccion_cursor CURSOR FOR
        SELECT 
            e.ID_Evento_Recoleccion,
            e.fecha_final,
            ec.id_recolector,
            e.ID_Ubicacion
        FROM 
            Evento_de_Coleccion e
        JOIN 
            evento_colectores ec ON e.ID_Evento_Recoleccion = ec.id_evento_recoleccion
        WHERE 
            ec.id_recolector = p_id_trabajador;

    trabajador RECORD;
    rol RECORD;
    ubicacion RECORD;
    persona RECORD;
    especimen RECORD;

BEGIN
    OPEN recoleccion_cursor;
    LOOP
        FETCH recoleccion_cursor INTO recoleccion;
        EXIT WHEN NOT FOUND;

        SELECT t.ID_TRABAJADOR, t.ID_PERSONA, t.id_role INTO trabajador
        FROM TRABAJADOR t
        WHERE t.ID_TRABAJADOR = p_id_trabajador;

        SELECT r.ID_Rol, r.nombre INTO rol
        FROM Rol r
        WHERE r.ID_Rol = trabajador.id_role;

        SELECT u.ID_Ubicacion, decimalLatitude, decimalLongitude, locality, habitat, notas, pais INTO ubicacion
        FROM Ubicacion u
        WHERE u.ID_Ubicacion = recoleccion.ID_Ubicacion;

        SELECT p.ID_Persona, p.nombre INTO persona
        FROM Persona p
        WHERE p.ID_Persona = trabajador.ID_PERSONA;

        SELECT s.catalogNumber, s.scientificName, s.lifeStage, s.sex, s.individualCount, s.estado INTO especimen
        FROM Especimen s
        WHERE s.ID_Evento_Recoleccion = recoleccion.ID_Evento_Recoleccion;

        RAISE NOTICE 'Evento ID: %, Fecha: %, Ubicacion: %, Recolector: %, Rol: %, Persona: %, Especimen Catalog Number: %, Scientific Name: %, Life Stage: %, Sex: %, Individual Count: %, Estado: %',
            recoleccion.ID_Evento_Recoleccion,
            recoleccion.fecha_final,
            ubicacion.locality,
            persona.nombre,
            rol.nombre,
            persona.nombre,
            especimen.catalogNumber,
            especimen.scientificName,
            especimen.lifeStage,
            especimen.sex,
            especimen.individualCount,
            especimen.estado;
    END LOOP;
    CLOSE recoleccion_cursor;
END;
$$;

--buscar especimen especifico dado un nombre
--informacioni de especimen dado el nombre
CREATE OR REPLACE PROCEDURE infoEspecimen(
    p_nombreEspecimen TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    especimen RECORD;
    especimen_cursor CURSOR FOR
        SELECT 
            e.catalogNumber, 
            e.scientificName, 
            e.lifeStage, 
            e.sex, 
            e.individualCount,
            t.taxonID,  
            t.ID_especimen,  
            t.Tipo,  
            t.scientificName AS taxonomia_scientificName,  
            k.name_kingdom AS kingdom,  
            p.name_phylum AS phylum,     
            c.name_class AS class,      
            o.name_order AS order,       
            f.name_family AS family,     
            g.genus AS genus        
        FROM Especimen e
        JOIN TAXONOMIA t ON e.catalogNumber = t.ID_especimen 
        LEFT JOIN kingdom k ON t.kingdom = k.ID_kingdom  
        LEFT JOIN phylum p ON t.phylum = p.id_phylum     
        LEFT JOIN class c ON t.class = c.id_class         
        LEFT JOIN "Order" o ON t."order" = o.id_order     
        LEFT JOIN family f ON t.family = f.id_family       
        LEFT JOIN Genus g ON t.genus = g.id_genus         
        WHERE e.scientificName = p_nombreEspecimen;

BEGIN
    OPEN especimen_cursor;
    LOOP
        FETCH especimen_cursor INTO especimen;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Catalog Number: %, Scientific Name: %, Life Stage: %, Sex: %, Individual Count: %, Taxon ID: %, ID Especimen: %, Tipo: %, Scientific Name (Taxonomia): %, Kingdom: %, Phylum: %, Class: %, Order: %, Family: %, Genus: %',
            especimen.catalogNumber,
            especimen.scientificName,
            especimen.lifeStage,
            especimen.sex,
            especimen.individualCount,
            especimen.taxonID,
            especimen.ID_especimen,
            especimen.Tipo,
            especimen.taxonomia_scientificName,
            especimen.kingdom,
            especimen.phylum,
            especimen.class,
            especimen.order,
            especimen.family,
            especimen.genus;
    END LOOP;
    CLOSE especimen_cursor;
END;
$$
;

-- asignar trabajador a institucion dados los ids
CREATE OR REPLACE PROCEDURE asignar_trabajador_institucion(
    p_trabajador_id INT,
    p_instituto_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO TRABAJADOR_INSTITUCION (ID_TRABAJADOR, ID_INSTITUCION)
    VALUES (p_trabajador_id, p_instituto_id);

    
    RAISE NOTICE 'Trabajador: % asignado a institucion: %', p_trabajador_id, p_instituto_id;

END;
$$
;


