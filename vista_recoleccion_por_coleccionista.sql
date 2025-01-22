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

SELECT* FROM recoleccion_coleccionista;