-- creacion del role de recolectores
CREATE ROLE recolector;

CREATE USER Pepe WITH PASSWORD 'contraseña1';
GRANT recolector TO Pepe;

GRANT SELECT,INSERT,UPDATE ON especimen TO recolector;
GRANT SELECT,INSERT, UPDATE ON evento_de_coleccion TO recolector;
GRANT SELECT, INSERT, UPDATE ON ubicacion TO recolector;
GRANT SELECT,INSERT, UPDATE ON taxon_colecta TO recolector;
GRANT SELECT,INSERT,UPDATE ON participacion_recolecciones TO recolector;
GRANT SELECT,INSERT,UPDATE ON imagenes TO recolector;

GRANT SELECT ON jerarquia TO recolector;

REVOKE ALL ON SCHEMA public FROM recolector;

