CREATE VIEW vista_especimenes_familia AS
SELECT 
    e.catalogNumber AS id_especimen,
    e.scientificName,
    e.lifeStage,
    e.sex,
    e.individualCount,
    f.name_family AS familia
FROM 
    especimen e
JOIN 
    taxon_colecta tc ON e.catalogNumber = tc.especimen
JOIN 
    taxonomia t ON e.catalogNumber = t.id_especimen
JOIN 
    family f ON t.family = f.id_family;


-- SEGUNDA VISTA
CREATE OR REPLACE VIEW vista_por_reino AS
SELECT 
    k.NAME_KINGDOM AS Kingdom_Name,
    p.NAME_PHYLUM AS Phylum_Name,
    c.NAME_CLASS AS Class_Name,
    o.NAME_ORDER AS Order_Name,
    f.NAME_FAMILY AS Family_Name,
    g.GENUS AS Genus_Name,
    e.EPITHET AS Specific_Epithet,
    t.SCIENTIFICNAME AS Scientific_Name,
    t.TIPO AS Taxon_Type,
    s.LIFESTAGE AS Life_Stage,
    s.SEX AS Sex,
    s.INDIVIDUALCOUNT AS Individual_Count,
    u.LOCALITY AS Locality,
    u.HABITAT AS Habitat,
    u.LATITUD AS Latitude,
    u.LONGITUD AS Longitude,
    u.ALTITUD AS Altitude,
    edc.EVENT_DATE AS Collection_Date,
    per.NOMBRE AS Collector_Name,
    per.APELLIDO AS Collector_LastName,
    inst.NOMBRE AS Institution_Name
FROM 
    TAXONOMIA t
INNER JOIN KINGDOM k ON t.KINGDOM = k.ID_KINGDOM
INNER JOIN PHYLUM p ON t.PHYLUM = p.ID_PHYLUM
INNER JOIN CLASS c ON t.CLASS = c.ID_CLASS
INNER JOIN TAXONOMIAORDER o ON t.ORDER_TAXONOMIA = o.ID_ORDER
INNER JOIN FAMILY f ON t.FAMILY = f.ID_FAMILY
INNER JOIN GENUS g ON t.GENUS = g.ID_GENUS
INNER JOIN EPITELOESPECIFICO e ON t.SPECIFICEPITHET = e.ID_SPECIFICEPITHET
INNER JOIN ESPECIMEN s ON t.ID_ESPECIMEN = s.CATALOGNUMBER
INNER JOIN TAXON_COLECTA tc ON tc.ESPECIMEN = s.CATALOGNUMBER
INNER JOIN INFO_RECOLECCION ir ON tc.ID_RECOLECCION = ir.ID_RECOLECCION
INNER JOIN EVENTO_DE_COLECCION edc ON ir.EVENTO = edc.ID_EVENTO_RECOLECCION
INNER JOIN UBICACION u ON edc.ID_UBICACION = u.ID_UBICACION
INNER JOIN PARTICIPACION_RECOLECCION pr ON pr.ID_RECOLECCION = ir.ID_RECOLECCION
INNER JOIN TRABAJADOR t_worker ON pr.ID_TRABAJADOR = t_worker.ID_TRABAJADOR
INNER JOIN PERSONA per ON t_worker.ID_PERSONA = per.ID_PERSONA
INNER JOIN INSTITUTO_COLECTAS ic ON ic.ID_EVENTO_RECOLECCION = edc.ID_EVENTO_RECOLECCION
INNER JOIN INSTITUTO inst ON ic.ID_INSTITUCION = inst.ID_INSTITUTO;


SELECT * 
FROM vista_por_reino
WHERE Kingdom_Name = 'Animalia';

-- TERCERA VISTA

CREATE OR REPLACE VIEW vista_habitat AS
SELECT 
    u.HABITAT AS Habitat,
    t.SCIENTIFICNAME AS Scientific_Name,
    t.TIPO AS Taxon_Type,
    s.LIFESTAGE AS Life_Stage,
    s.SEX AS Sex,
    s.INDIVIDUALCOUNT AS Individual_Count,
    edc.EVENT_DATE AS Collection_Date,
    per.NOMBRE AS Collector_Name,
    per.APELLIDO AS Collector_LastName,
    inst.NOMBRE AS Institution_Name
FROM 
    TAXONOMIA t
INNER JOIN ESPECIMEN s ON t.ID_ESPECIMEN = s.CATALOGNUMBER
INNER JOIN TAXON_COLECTA tc ON tc.ESPECIMEN = s.CATALOGNUMBER
INNER JOIN INFO_RECOLECCION ir ON tc.ID_RECOLECCION = ir.ID_RECOLECCION
INNER JOIN EVENTO_DE_COLECCION edc ON ir.EVENTO = edc.ID_EVENTO_RECOLECCION
INNER JOIN UBICACION u ON edc.ID_UBICACION = u.ID_UBICACION
INNER JOIN PARTICIPACION_RECOLECCION pr ON pr.ID_RECOLECCION = ir.ID_RECOLECCION
INNER JOIN TRABAJADOR t_worker ON pr.ID_TRABAJADOR = t_worker.ID_TRABAJADOR
INNER JOIN PERSONA per ON t_worker.ID_PERSONA = per.ID_PERSONA
INNER JOIN INSTITUTO_COLECTAS ic ON ic.ID_EVENTO_RECOLECCION = edc.ID_EVENTO_RECOLECCION
INNER JOIN INSTITUTO inst ON ic.ID_INSTITUCION = inst.ID_INSTITUTO;

SELECT * 
FROM vista_habitat
WHERE Habitat = 'Bosque templado';

