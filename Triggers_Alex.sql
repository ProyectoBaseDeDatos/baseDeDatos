--1
--funcion
CREATE OR REPLACE FUNCTION insertar_en_instituto_colectas()
RETURNS TRIGGER AS $$
BEGIN
    -- Inserta en INSTITUTO_COLECTAS el ID del evento recién creado y un ID de institución predeterminado
    INSERT INTO INSTITUTO_COLECTAS (ID_INSTITUCION, ID_Evento_Recoleccion)
    VALUES (1, NEW.ID_Evento_Recoleccion); -- Cambia "1" según el ID de tu instituto.

    RETURN NEW; -- Devuelve el registro recién insertado en Evento_de_Coleccion
END;
$$ LANGUAGE plpgsql;

--crear el trigger
CREATE TRIGGER trigger_insertar_instituto_colectas
AFTER INSERT ON Evento_de_Coleccion
FOR EACH ROW
EXECUTE FUNCTION insertar_en_instituto_colectas();




--2 
--funcion
CREATE OR REPLACE FUNCTION actualizar_estado_especimen()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si se agregó un registro nuevo (Registro del espécimen)
    IF TG_OP = 'INSERT' THEN
        NEW.estado := 'recolectado';

    -- Verificar si se completó una identificación (cambio en scientificName)
    ELSIF TG_OP = 'UPDATE' AND NEW.scientificName IS NOT NULL AND OLD.scientificName IS DISTINCT FROM NEW.scientificName THEN
        NEW.estado := 'identificado';

    -- Verificar si se realizó una validación (cambio en estado a validado)
    ELSIF TG_OP = 'UPDATE' AND NEW.estado = 'validado' AND OLD.estado IS DISTINCT FROM NEW.estado THEN
        NEW.estado := 'validado';
    END IF;

    RETURN NEW; -- Retornar el registro modificado
END;
$$ LANGUAGE plpgsql;

--crear trigger 
CREATE TRIGGER trigger_actualizar_estado_especimen
BEFORE INSERT OR UPDATE ON Especimen
FOR EACH ROW
EXECUTE FUNCTION actualizar_estado_especimen();

--3
 --crear funcion
CREATE OR REPLACE FUNCTION actualizar_fecha_recoleccion()
RETURNS TRIGGER AS $$
BEGIN
    -- Actualizar la fecha de identificación si el estado cambia a 'identificado'
    IF NEW.estado = 'identificado' AND OLD.estado IS DISTINCT FROM 'identificado' THEN
        UPDATE datosRecoleccion
        SET fecha_identificacion = CURRENT_TIMESTAMP
        WHERE id_especimen = NEW.catalogNumber;
    END IF;

    -- Actualizar la fecha de validación si el estado cambia a 'validado'
    IF NEW.estado = 'validado' AND OLD.estado IS DISTINCT FROM 'validado' THEN
        UPDATE datosRecoleccion
        SET fecha_validacion = CURRENT_TIMESTAMP
        WHERE id_especimen = NEW.catalogNumber;
    END IF;

    RETURN NEW; -- Continuar con la operación de actualización
END;
$$ LANGUAGE plpgsql;


--Crear trigger
CREATE TRIGGER trigger_actualizar_fecha_recoleccion
AFTER UPDATE OF estado ON Especimen
FOR EACH ROW
EXECUTE FUNCTION actualizar_fecha_recoleccion();

/*--por si falla  LA FUNCION DEL 3
CREATE OR REPLACE FUNCTION actualizar_fecha_recoleccion()
RETURNS TRIGGER AS $$
BEGIN
    -- Actualizar la fecha de identificación si el estado cambia a 'identificado'
    IF NEW.estado = 'identificado' AND OLD.estado IS DISTINCT FROM 'identificado' THEN
        UPDATE datosRecoleccion
        SET fecha_identificacion = CURRENT_TIMESTAMP,
            fecha_validacion = NULL -- Asegurarse de que fecha_validacion sea nula
        WHERE id_especimen = NEW.catalogNumber;
    END IF;

    -- Actualizar la fecha de validación si el estado cambia a 'validado'
    IF NEW.estado = 'validado' AND OLD.estado IS DISTINCT FROM 'validado' THEN
        UPDATE datosRecoleccion
        SET fecha_validacion = CURRENT_TIMESTAMP
        WHERE id_especimen = NEW.catalogNumber;

        -- Validar que fecha_identificacion esté asignada
        IF (SELECT fecha_identificacion FROM datosRecoleccion WHERE id_especimen = NEW.catalogNumber) IS NULL THEN
            RAISE EXCEPTION 'No se puede validar un espécimen sin fecha de identificación previa';
        END IF;
    END IF;

    RETURN NEW; -- Continuar con la operación de actualización
END;
$$ LANGUAGE plpgsql;
//
*/


--4
--funcion
CREATE OR REPLACE FUNCTION registrar_contribuidor()
RETURNS TRIGGER AS $$
DECLARE
    v_accion TEXT; -- Almacena la acción realizada (INSERT o UPDATE)
BEGIN
    -- Determinar la acción que activó el trigger
    IF TG_OP = 'INSERT' THEN
        v_accion := 'INSERT';
    ELSIF TG_OP = 'UPDATE' THEN
        v_accion := 'UPDATE';
    END IF;

    -- Insertar el registro en la tabla contribuidores
    INSERT INTO contribuidores (
        id_datos_recoleccion,
        id_contribuidor,
        nombre_trabajador,
        accion,
        detalles
    )
    VALUES (
        NEW.id_datos,               -- ID del registro en datosRecoleccion
        1,                          -- ID del contribuidor (ajústalo según tu lógica)
        'Sistema Automático',       -- Nombre del contribuidor
        v_accion,                   -- Acción realizada (INSERT o UPDATE)
        'Cambio en datosRecoleccion' -- Detalles del cambio
    );

    RETURN NEW; -- Continuar con la operación
END;
$$ LANGUAGE plpgsql;

--crear trigger
CREATE TRIGGER trigger_registrar_contribuidor
AFTER INSERT OR UPDATE ON datosRecoleccion
FOR EACH ROW
EXECUTE FUNCTION registrar_contribuidor();





