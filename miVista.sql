
-- vistas luis
CREATE VIEW vista_resumen_muestras AS
SELECT 
    E.catalogNumber AS ID_especimen,
    DR.fecha_recoleccion AS fecha_recoleccion,
    U.locality AS localizacion,
    T.scientificName AS taxonomia,
    P.nombre || ' ' || P.apellido_paterno || ' ' || P.apellido_maternos AS coleccionista
FROM 
    Especimen E
JOIN 
    datosRecoleccion DR ON E.catalogNumber = DR.id_especimen
JOIN 
    Ubicacion U ON E.ID_Evento_Recoleccion = U.ID_Ubicacion
JOIN 
    TAXONOMIA T ON E.catalogNumber = T.ID_especimen
JOIN 
    evento_colectores EC ON E.ID_Evento_Recoleccion = EC.id_evento_recoleccion
JOIN 
    Persona P ON EC.id_recolector = P.ID_Persona;


CREATE VIEW vista_detalle_muestra AS
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
    IMAGENES I ON EI.id_foto = I.id_foto;



