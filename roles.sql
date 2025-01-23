CREATE ROLE COLECCIONISTA;
GRANT SELECT,INSERT ON ALL TABLES IN SCHEMA public TO COLECCIONISTA;
CREATE USER coleccionista_user_1 WITH PASSWORD '123456';

GRANT COLECCIONISTA TO coleccionista_user_1;

GRANT EXECUTE ON PROCEDURE insertar_especie(
  INT, VARCHAR, VARCHAR, VARCHAR, INT, VARCHAR, TEXT[], DATE, 
  TEXT[], TEXT[], TEXT[], DATE[], TEXT[], TEXT[], INT, VARCHAR, VARCHAR
) TO COLECCIONISTA;
GRANT EXECUTE ON PROCEDURE eliminar_imagen(catalogNumber INT) TO COLECCIONISTA;
GRANT EXECUTE ON FUNCTION sp_contar_muestras_por_coleccionista(p_id_coleccionista INTEGER) TO rol_muestras;
GRANT EXECUTE ON PROCEDURE sp_agregar_imagen_a_especimen(
    p_catalogNumber INTEGER,
    p_url TEXT,
    p_idTipo INTEGER
) TO COLECCIONISTA;

----------------- IDENTIFICADOR
CREATE ROLE IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON kingdom TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON phylum TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON class TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON "Order" TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON family TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Genus TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON EpiteloEspecifico TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON Especimen TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON TAXONOMIA TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE ON datosRecoleccion TO IDENTIFICADOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON contribuidores TO IDENTIFICADOR;
GRANT SELECT ON IMAGENES TO IDENTIFICADOR;
GRANT SELECT ON especimen_imagenes TO IDENTIFICADOR;
GRANT SELECT ON evento_colectores TO IDENTIFICADOR;
GRANT SELECT ON descripcion_colecta TO IDENTIFICADOR;
GRANT SELECT ON Persona TO IDENTIFICADOR;
GRANT SELECT ON especies_pendientes TO IDENTIFICADOR;


GRANT EXECUTE ON FUNCTION sp_recuperar_muestra_por_id(p_catalogNumber) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION sp_buscar_especimen_por_taxonomia(p_kingdom INTEGER ,
    p_phylum INTEGER ,
    p_class INTEGER ,
    p_order INTEGER ,
    p_family INTEGER ,
    p_genus INTEGER ,
    p_speficic_epithet INTEGER ) TO IDENTIFICADOR;
GRANT SELECT ON vista_resumen_muestras TO IDENTIFICADOR;
GRANT SELECT ON vista_detalle_muestra TO IDENTIFICADOR;

GRANT EXECUTE ON FUNCTION Obtener_especimens(INT) TO IDENTIFICADOR;
GRANT EXECUTE ON PROCEDURE identificar_especimen(
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
) TO IDENTIFICADOR;
GRANT EXECUTE ON PROCEDURE sp_agregar_imagen_a_especimen(
    p_catalogNumber INTEGER,
    p_url TEXT,
    p_idTipo INTEGER
) TO IDENTIFICADOR;

GRANT EXECUTE ON FUNCTION insertar_Epitelo(nameEpitelo TEXT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_genus(nameGenus TEXT, idFamily INT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_family(nameFamily TEXT, idOrder INT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_order(nameOrder TEXT, idClass INT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_class(nameClass TEXT, idPhylum INT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_phylum(namePhylum TEXT, idKingdom INT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_kingdom(nameKingdom TEXT) TO IDENTIFICADOR;
GRANT EXECUTE ON FUNCTION insertar_contribuidores(contribuidores TEXT,acciones TEXT,detalles TEXT,apellidos_paternos_contribuidores TEXT,apellidos_maternos_contribuidores TEXT,id_datos INT) TO IDENTIFICADOR;

CREATE USER identificador_user WITH PASSWORD 'IdentifCE12';
GRANT IDENTIFICADOR TO identificador_user;

----------------------------------- PROFESOR

CREATE ROLE PROFESOR;

ALTER ROLE PROFESOR WITH CREATEROLE;
GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO PROFESOR;
GRANT USAGE ON SCHEMA public TO PROFESOR;

CREATE USER profesor_user_1 WITH PASSWORD '123456';
GRANT PROFESOR TO profesor_user_1;
CREATE ROLE PROFESOR;
GRANT EXECUTE ON FUNCTION validar_usuarios(emailIngresado TEXT, contrasenaIngresada TEXT) TO rol_validacion_usuarios;


GRANT EXECUTE ON PROCEDURE crear_evento_de_coleccion(
  DECIMAL, DECIMAL, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TIMESTAMP, INT
) TO PROFESOR;

GRANT EXECUTE ON PROCEDURE Validar_Identificacion_especimen(catalog_number_ingresado INT,id_persona_ingresada INT) TO PROFESOR;


-- USUARIO PARA EL LOGIN
CREATE ROLE USUARIOTEMP;
GRANT SELECT ON Persona TO USUARIOTEMP;
GRANT SELECT ON usuario TO USUARIOTEMP;
GRANT SELECT ON rol TO USUARIOTEMP;
GRANT SELECT ON trabajador TO USUARIOTEMP;

CREATE USER usuario_temporal WITH PASSWORD '123456';
GRANT USUARIOTEMP TO usuario_temporal;




