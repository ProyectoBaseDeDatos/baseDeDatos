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

CALL recuperar_especimenes_pendientes();
