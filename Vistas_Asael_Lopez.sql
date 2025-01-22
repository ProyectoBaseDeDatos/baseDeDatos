-- vista especimenes imagenes
DROP VIEW IF EXISTS imagenes_especimen;
CREATE VIEW imagenes_especimen AS
SELECT
    DISTINCT i.url,
        e.catalogNumber,
        e.scientificName,
        e.lifeStage,
        e.sex,
        e.individualCount,
        e.estado
FROM
    Especimen,
	especimen_imagenes
JOIN
    IMAGENES i ON especimen_imagenes.id_foto = i.id_foto
JOIN
    Especimen e ON especimen_imagenes.ID_especimen = e.catalogNumber;

DROP VIEW IF EXISTS vista_muestras_con_imagenes;



--vista muestras imagenes
CREATE VIEW vista_muestras_con_imagenes AS
SELECT 
	DISTINCT
    e.catalogNumber,
    e.scientificName,
    d.descripcion,
    d.ubicacion_exacta_colecta,
    m.descripcion_metodo,
    i.url
FROM 
    Especimen e
JOIN 
    especimen_imagenes ON especimen_imagenes.ID_especimen = e.catalogNumber
JOIN 
    descripcion_colecta d ON e.catalogNumber = d.id_especie
JOIN 
    metodoDePrepacion m ON e.ID_metodo = m.ID_preparacion
JOIN
    IMAGENES i ON especimen_imagenes.id_foto = i.id_foto;

	

--vista recoleccion por coleccionista
DROP VIEW IF EXISTS recoleccion_coleccionista;
CREATE VIEW recoleccion_coleccionista AS   
SELECT 
    e.ID_Evento_Recoleccion, 
    e.fecha_final,
    u.locality,
    u.pais, 
    e.maximo_de_especies, 
    e.estado_del_evento,
    p.nombre,
    p.apellido_paterno,
    p.telefono,
    p.nacionalidad
FROM 
    Evento_de_Coleccion e
JOIN 
    evento_colectores ev ON e.ID_Evento_Recoleccion = ev.ID_Evento_Recoleccion
JOIN 
    Persona p ON ev.id_recolector = p.ID_Persona
JOIN 
    Ubicacion u ON e.ID_Ubicacion = u.ID_Ubicacion;

