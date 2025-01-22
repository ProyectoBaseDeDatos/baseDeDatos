--procedimiento para crear un usuario
CREATE OR REPLACE PROCEDURE crear_usuario(
	--parametros necesarios
    p_id_persona INT,
    p_contraseña VARCHAR,
    p_email VARCHAR,
    p_id_rol INT
)
LANGUAGE plpgsql
AS $$
BEGIN
-- insertar en las tablas correspondientes
    INSERT INTO usuario (id_persona, id_usuario, contraseña, email)
    VALUES (p_id_persona, gen_random_uuid(), p_contraseña, p_email);
    
    INSERT INTO TRABAJADOR (ID_PERSONA, id_role) 
    VALUES (p_id_persona, p_id_rol);
END;
$$;

-- procedimiento para actualizar un usuario
CREATE OR REPLACE PROCEDURE actualizar_usuario(
    p_id_persona INT, 
    p_nombre VARCHAR,
    p_contraseña VARCHAR,
    p_email VARCHAR,
    p_id_rol INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Persona
    SET 
        nombre = p_nombre 
    WHERE ID_Persona = p_id_persona;  

    UPDATE usuario
    SET 
        contraseña = p_contraseña,
        email = p_email
    WHERE id_persona = p_id_persona;  
    -- Actualizar rol del trabajador
    UPDATE TRABAJADOR
    SET id_role = p_id_rol 
    WHERE ID_PERSONA = p_id_persona;
END;
$$;



--procedimiento para consultar un usuario
CREATE OR REPLACE PROCEDURE consultar_usuario(
    p_id_usuario UUID
)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;  
    cur CURSOR FOR 
        SELECT 
            u.id_usuario,
            p.nombre,
            u.id_persona,
            u.email,
            r.nombre AS rol_nombre
        FROM usuario u
        JOIN Persona p ON u.id_persona = p.ID_Persona 
        JOIN TRABAJADOR t ON p.ID_Persona = t.ID_PERSONA
        JOIN Rol r ON t.id_role = r.ID_Rol 
        WHERE u.id_usuario = p_id_usuario;
BEGIN
    OPEN cur;  
    LOOP
        FETCH cur INTO rec;  
        EXIT WHEN NOT FOUND;  
        RAISE NOTICE 'ID Usuario: %, Nombre: %, ID Persona: %, Email: %, Rol: %',
                     rec.id_usuario, rec.nombre, rec.id_persona, rec.email, rec.rol_nombre;
    END LOOP;
    CLOSE cur;  
END;
$$;

--consultar todos los usuarios
CREATE OR REPLACE PROCEDURE consultar_todos_usuarios()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;  
    cur CURSOR FOR 
        SELECT 
            usuario.id_usuario,
            Persona.nombre,
            Persona.ID_Persona,
            usuario.email,
            Rol.nombre AS nombre_rol,
            Rol.ID_Rol AS id_rol  
        FROM usuario
        JOIN Persona ON usuario.id_persona = Persona.ID_Persona 
        JOIN TRABAJADOR ON Persona.ID_Persona = TRABAJADOR.ID_PERSONA 
        JOIN Rol ON TRABAJADOR.id_role = Rol.ID_Rol;
BEGIN
    OPEN cur;  
    LOOP
        FETCH cur INTO rec;  
        EXIT WHEN NOT FOUND;  
        RAISE NOTICE 'ID Usuario: %, Nombre: %, ID Persona: %, Email: %, Rol: %, ID Rol: %',
                     rec.id_usuario, rec.nombre, rec.ID_Persona, rec.email, rec.nombre_rol, rec.id_rol;  
    END LOOP;
    CLOSE cur;  
END;
$$;

--procedimiento para eliminar usuario
CREATE OR REPLACE PROCEDURE eliminar_usuario(
    p_id_persona INTEGER  
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Eliminar de la tabla TRABAJADOR 
    DELETE FROM TRABAJADOR
    WHERE ID_PERSONA = p_id_persona;

    DELETE FROM usuario
    WHERE id_persona = p_id_persona;
	RAISE NOTICE 'Usuario con id persona: % eliminado',p_id_persona;
END;
$$;







