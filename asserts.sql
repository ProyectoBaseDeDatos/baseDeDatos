-- %%%%%%%%%%%%%%%%%%%%%%%
-- Validar que las especies recolectadas no superen el limite permitido

CREATE OR REPLACE FUNCTION validar_numero_especies()
RETURNS TRIGGER AS $$
DECLARE
    total_species INTEGER;
    limite INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_species FROM especie WHERE ID_Evento_Recoleccion = NEW.ID_Evento_Recoleccion;
    SELECT limite INTO limite FROM evento_recoleccion WHERE ID = NEW.ID_Evento_Recoleccion;

    IF total_species > limite THEN
        RAISE EXCEPTION 'El número de especies recolectadas excede el límite permitido.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_numero_especies_trigger
BEFORE INSERT ON recoleccion
FOR EACH ROW
EXECUTE FUNCTION validar_numero_especies();