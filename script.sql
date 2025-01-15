DROP TABLE IF EXISTS kingdom CASCADE;
DROP TABLE IF EXISTS phylum CASCADE;
DROP TABLE IF EXISTS class CASCADE;
DROP TABLE IF EXISTS "Order" CASCADE;
DROP TABLE IF EXISTS family CASCADE;
DROP TABLE IF EXISTS Genus CASCADE;
DROP TABLE IF EXISTS EpiteloEspecifico CASCADE;
DROP TABLE IF EXISTS IMAGENES CASCADE;
DROP TABLE IF EXISTS Ubicacion CASCADE;
DROP TABLE IF EXISTS Persona CASCADE;
DROP TABLE IF EXISTS Rol CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS Instituto CASCADE;
DROP TABLE IF EXISTS TRABAJADOR CASCADE;
DROP TABLE IF EXISTS Evento_de_Coleccion CASCADE;
DROP TABLE IF EXISTS descripcion_colecta CASCADE;
DROP TABLE IF EXISTS metodoDePrepacion CASCADE;
DROP TABLE IF EXISTS Especimen CASCADE;
DROP TABLE IF EXISTS TAXONOMIA CASCADE;
DROP TABLE IF EXISTS datosRecoleccion CASCADE;
DROP TABLE IF EXISTS contribuidores CASCADE;
DROP TABLE IF EXISTS especimen_imagenes CASCADE;
DROP TABLE IF EXISTS TRABAJADOR_INSTITUCION CASCADE;
DROP TABLE IF EXISTS INSTITUTO_COLECTAS CASCADE;

-- Create kingdom table
CREATE TABLE kingdom (
    ID_kingdom SERIAL PRIMARY KEY,
    name_kingdom TEXT
);

-- Create phylum table
CREATE TABLE phylum (
    id_phylum SERIAL PRIMARY KEY,
    name_phylum TEXT,
    id_reino INTEGER REFERENCES kingdom(ID_kingdom)
);

-- Create class table
CREATE TABLE class (
    id_class SERIAL PRIMARY KEY,
    name_class TEXT,
    id_phylum INTEGER REFERENCES phylum(id_phylum)
);

-- Create Order table
CREATE TABLE "Order" (
    id_order SERIAL PRIMARY KEY,
    name_order TEXT,
    id_class INTEGER REFERENCES class(id_class)
);

-- Create family table
CREATE TABLE family (
    id_family SERIAL PRIMARY KEY,
    name_family TEXT,
    id_order INTEGER REFERENCES "Order"(id_order)
);

-- Create Genus table
CREATE TABLE Genus (
    id_genus SERIAL PRIMARY KEY,
    genus TEXT,
    id_family INTEGER REFERENCES family(id_family)
);

-- Create EpiteloEspecifico table
CREATE TABLE EpiteloEspecifico (
    id_specificEpithet SERIAL PRIMARY KEY,
    epithet TEXT
);

-- Create IMAGENES table
CREATE TABLE IMAGENES (
    id_foto SERIAL PRIMARY KEY,
    url TEXT,
    idTipo INTEGER
);

-- Create Ubicacion table
CREATE TABLE Ubicacion (
    ID_Ubicacion SERIAL PRIMARY KEY,
    decimalLatitude NUMERIC,
    decimalLongitude NUMERIC,
    locality TEXT,
    habitat TEXT,
    notas TEXT,
    pais TEXT
);

-- Create Persona table
CREATE TABLE Persona (
    ID_Persona SERIAL PRIMARY KEY,
    nombre TEXT,
    apellido_paterno TEXT,
    apellido_maternos TEXT,
    edad INTEGER,
    telefono TEXT,
    nacionalidad TEXT
);

-- Create Rol table
CREATE TABLE Rol (
    ID_Rol SERIAL PRIMARY KEY,
    nombre TEXT
);

-- Create usuario table
CREATE TABLE usuario (
    id_Persona INTEGER REFERENCES Persona(ID_Persona),
    id_usuario UUID PRIMARY KEY,
    contraseña TEXT,
    email TEXT
);

-- Create Instituto table
CREATE TABLE Instituto (
    ID_instituto SERIAL PRIMARY KEY,
    nombre TEXT,
    direccion TEXT
);

-- Create TRABAJADOR table
CREATE TABLE TRABAJADOR (
    ID_TRABAJADOR SERIAL PRIMARY KEY,
    ID_PERSONA INTEGER REFERENCES Persona(ID_Persona),
    role INTEGER REFERENCES Rol(ID_Rol)
);

-- Create Evento_de_Coleccion table
CREATE TABLE Evento_de_Coleccion (
    ID_Evento_Recoleccion SERIAL PRIMARY KEY,
    event_date TIMESTAMP,
    ID_Ubicacion INTEGER REFERENCES Ubicacion(ID_Ubicacion),
    ID_RECOLECTOR INTEGER REFERENCES TRABAJADOR(ID_TRABAJADOR)
);

-- Create descripcion_colecta table
CREATE TABLE descripcion_colecta (
    id_evento INTEGER REFERENCES Evento_de_Coleccion(ID_Evento_Recoleccion),
    descripcion TEXT
);

-- Create metodoDePrepacion table
CREATE TABLE metodoDePrepacion (
    ID_preparacion SERIAL PRIMARY KEY,
    descripcion_metodo TEXT
);

-- Create Especimen table
CREATE TABLE Especimen (
    ID_Evento_Recoleccion INTEGER REFERENCES Evento_de_Coleccion(ID_Evento_Recoleccion),
    ID_metodo INTEGER REFERENCES metodoDePrepacion(ID_preparacion),
    catalogNumber SERIAL PRIMARY KEY,
    scientificName TEXT,
    lifeStage TEXT,
    sex TEXT,
    individualCount INTEGER,
    estado TEXT CHECK (estado IN ('recolectado', 'pendiente_identificacion', 'identificado', 'validado', 'necesita_revision'))
);

-- Create TAXONOMIA table
CREATE TABLE TAXONOMIA (
    taxonID UUID PRIMARY KEY,
    ID_especimen INTEGER REFERENCES Especimen(catalogNumber),
    Tipo TEXT,
    scientificName TEXT,
    kingdom INTEGER REFERENCES kingdom(ID_kingdom),
    phylum INTEGER REFERENCES phylum(id_phylum),
    class INTEGER REFERENCES class(id_class),
    "order" INTEGER REFERENCES "Order"(id_order),
    family INTEGER REFERENCES family(id_family),
    genus INTEGER REFERENCES Genus(id_genus),
    specificEpithet INTEGER REFERENCES EpiteloEspecifico(id_specificEpithet)
);

-- Create datosRecoleccion table
CREATE TABLE datosRecoleccion (
    id_datos SERIAL PRIMARY KEY,
    id_especimen INTEGER REFERENCES Especimen(catalogNumber),
    fecha_recoleccion TIMESTAMP,
    fecha_identificacion TIMESTAMP,
    fecha_validacion TIMESTAMP
);

-- Create contribuidores table
CREATE TABLE contribuidores (
    id SERIAL,
    id_datos_recoleccion INTEGER REFERENCES datosRecoleccion(id_datos),
    id_contribuidor INTEGER REFERENCES Persona(id_Persona),
    nombre_trabajador TEXT,
    accion TEXT,
    detalles TEXT
);

-- Create especimen_imagenes table
CREATE TABLE especimen_imagenes (
    id_especimen INTEGER REFERENCES Especimen(catalogNumber),
    id_foto INTEGER REFERENCES IMAGENES(id_foto),
    PRIMARY KEY (id_especimen, id_foto)
);

-- Create TRABAJADOR_INSTITUCION table
CREATE TABLE TRABAJADOR_INSTITUCION (
    ID_TRABAJADOR INTEGER REFERENCES TRABAJADOR(ID_TRABAJADOR),
    ID_INSTITUCION INTEGER REFERENCES Instituto(ID_instituto),
    PRIMARY KEY (ID_TRABAJADOR, ID_INSTITUCION)
);

-- Create INSTITUTO_COLECTAS table
CREATE TABLE INSTITUTO_COLECTAS (
    ID_INSTITUCION INTEGER REFERENCES Instituto(ID_instituto),
    ID_Evento_Recoleccion INTEGER REFERENCES Evento_de_Coleccion(ID_Evento_Recoleccion),
    PRIMARY KEY (ID_INSTITUCION, ID_Evento_Recoleccion)
);

-- valores a insertar



-- Insertar en la tabla kingdom
INSERT INTO kingdom (name_kingdom) VALUES 
('Animalia');

-- Insertar en la tabla phylum
INSERT INTO phylum (name_phylum, id_reino) VALUES 
('Arthropoda', 1);

-- Insertar en la tabla class
INSERT INTO class (name_class, id_phylum) VALUES 
('Insecta', 1);

-- Insertar en la tabla "Order"
INSERT INTO "Order" (name_order, id_class) VALUES 
('Coleoptera', 1),
('Lepidoptera', 1),
('Hymenoptera', 1),
('Diptera', 1),
('Hemiptera', 1);

-- Insertar en la tabla family
INSERT INTO family (name_family, id_order) VALUES 
('Carabidae', 1),
('Nymphalidae', 2),
('Apidae', 3),
('Culicidae', 4),
('Reduviidae', 5);

-- Insertar en la tabla Genus
INSERT INTO Genus (genus, id_family) VALUES 
('Carabus', 1),
('Danaus', 2),
('Apis', 3),
('Aedes', 4),
('Triatoma', 5);

-- Insertar en la tabla EpiteloEspecifico
INSERT INTO EpiteloEspecifico (epithet) VALUES 
('auratus'),
('plexippus'),
('mellifera'),
('aegypti'),
('infestans');

-- Insertar en la tabla IMAGENES
INSERT INTO IMAGENES (url, idTipo) VALUES 
('https://example.com/carabus_auratus.jpg', 1),
('https://example.com/danaus_plexippus.jpg', 2),
('https://example.com/apis_mellifera.jpg', 3),
('https://example.com/aedes_aegypti.jpg', 4),
('https://example.com/triatoma_infestans.jpg', 5);

-- Las inserciones en la tabla Ubicacion se mantienen igual
INSERT INTO Ubicacion (decimalLatitude, decimalLongitude, locality, habitat, notas, pais) VALUES 
(19.4326, -99.1332, 'Ciudad de México', 'Urbano', 'Centro de la ciudad', 'México'),
(20.6736, -103.3444, 'Guadalajara', 'Bosque', 'Cerca de un río', 'México'),
(25.6866, -100.3161, 'Monterrey', 'Montaña', 'Altitud elevada', 'México'),
(17.0732, -96.7266, 'Oaxaca', 'Selva', 'Alta biodiversidad', 'México'),
(21.1619, -86.8515, 'Cancún', 'Playa', 'Zona costera', 'México');
-- Las inserciones en las tablas Persona, Rol, usuario, Instituto, y TRABAJADOR se mantienen igual
INSERT INTO Ubicacion (decimalLatitude, decimalLongitude, locality, habitat, notas, pais) VALUES 
(19.4326, -99.1332, 'Ciudad de México', 'Urbano', 'Centro de la ciudad', 'México'),
(20.6736, -103.3444, 'Guadalajara', 'Bosque', 'Cerca de un río', 'México'),
(25.6866, -100.3161, 'Monterrey', 'Montaña', 'Altitud elevada', 'México'),
(17.0732, -96.7266, 'Oaxaca', 'Selva', 'Alta biodiversidad', 'México'),
(21.1619, -86.8515, 'Cancún', 'Playa', 'Zona costera', 'México');

-- Insertar en la tabla Persona
INSERT INTO Persona (nombre, apellido_paterno, apellido_maternos, edad, telefono, nacionalidad) VALUES 
('Juan', 'García', 'López', 35, '5551234567', 'Mexicana'),
('alex', 'Rodríguez', 'Hernández', 28, '5559876543', 'Mexicana'),
('Carlos', 'Martínez', 'Gómez', 42, '5555555555', 'Mexicana'),
('Ana', 'López', 'Sánchez', 31, '5552223333', 'Mexicana'),
('Pedro', 'Hernández', 'Ramírez', 39, '5554446666', 'Mexicana');

-- Insertar en la tabla Rol
INSERT INTO Rol (nombre) VALUES 
('Colecotor'),
('Investigador'),
('profesor');

-- Insertar en la tabla usuario
INSERT INTO usuario (id_Persona, id_usuario, contraseña, email) VALUES 
(1, gen_random_uuid(), 'password1', 'juan@example.com'),
(2, gen_random_uuid(), 'password2', 'alex@example.com'),
(3, gen_random_uuid(), 'password3', 'carlos@example.com'),
(4, gen_random_uuid(), 'password4', 'ana@example.com'),
(5, gen_random_uuid(), 'password5', 'pedro@example.com');

-- Insertar en la tabla Instituto
INSERT INTO Instituto (nombre, direccion) VALUES 
('Nova Universitas', 'carretera puerto angel');

-- Insertar en la tabla TRABAJADOR
INSERT INTO TRABAJADOR (ID_PERSONA, role) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3);
-- Insertar en la tabla Evento_de_Coleccion
INSERT INTO Evento_de_Coleccion (event_date, ID_Ubicacion, ID_RECOLECTOR) VALUES 
('2023-01-15 10:30:00', 1, 1),
('2023-02-20 14:45:00', 2, 2),
('2023-03-25 09:15:00', 3, 3),
('2023-04-30 11:00:00', 4, 1),
('2023-05-05 16:30:00', 5, 2);

-- Insertar en la tabla descripcion_colecta
INSERT INTO descripcion_colecta (id_evento, descripcion) VALUES 
(1, 'Recolección de escarabajos en zona urbana'),
(2, 'Captura de mariposas en bosque'),
(3, 'Muestreo de abejas en zona montañosa'),
(4, 'Recolección de mosquitos en selva tropical'),
(5, 'Captura de chinches en zona costera');

-- Insertar en la tabla metodoDePrepacion
INSERT INTO metodoDePrepacion (descripcion_metodo) VALUES 
('Preservación en alcohol'),
('Montaje en seco'),
('Montaje en alfileres entomológicos'),
('Inclusión en resina'),
('Preparación microscópica');

-- Insertar en la tabla Especimen
INSERT INTO Especimen (ID_Evento_Recoleccion, ID_metodo, scientificName, lifeStage, sex, individualCount, estado) VALUES 
(1, 1, 'Carabus auratus', 'Adult', 'Male', 3, 'identificado'),
(2, 2, 'Danaus plexippus', 'Adult', 'Female', 2, 'validado'),
(3, 3, 'Apis mellifera', 'Adult', 'Worker', 10, 'pendiente_identificacion'),
(4, 4, 'Aedes aegypti', 'Adult', 'Female', 5, 'recolectado'),
(5, 5, 'Triatoma infestans', 'Nymph', 'Unknown', 4, 'necesita_revision');

-- Insertar en la tabla TAXONOMIA
INSERT INTO TAXONOMIA (taxonID, ID_especimen, Tipo, scientificName, kingdom, phylum, class, "order", family, genus, specificEpithet) VALUES 
(gen_random_uuid(), 1, 'Species', 'Carabus auratus', 1, 1, 1, 1, 1, 1, 1),
(gen_random_uuid(), 2, 'Species', 'Danaus plexippus', 1, 1, 1, 2, 2, 2, 2),
(gen_random_uuid(), 3, 'Species', 'Apis mellifera', 1, 1, 1, 3, 3, 3, 3),
(gen_random_uuid(), 4, 'Species', 'Aedes aegypti', 1, 1, 1, 4, 4, 4, 4),
(gen_random_uuid(), 5, 'Species', 'Triatoma infestans', 1, 1, 1, 5, 5, 5, 5);

-- Insertar en la tabla datosRecoleccion
INSERT INTO datosRecoleccion (id_especimen, fecha_recoleccion, fecha_identificacion, fecha_validacion) VALUES 
(1, '2023-01-15 10:30:00', '2023-01-16 14:00:00', '2023-01-17 09:00:00'),
(2, '2023-02-20 14:45:00', '2023-02-21 11:30:00', '2023-02-22 10:00:00'),
(3, '2023-03-25 09:15:00', '2023-03-26 13:00:00', NULL),
(4, '2023-04-30 11:00:00', NULL, NULL),
(5, '2023-05-05 16:30:00', '2023-05-06 10:00:00', NULL);
-- Insertar en la tabla contribuidores
INSERT INTO contribuidores (id_datos_recoleccion, nombre_trabajador, accion, detalles) VALUES 
(1, 'Juan García', 'Recolector', 'Captura manual de escarabajos'),
(1, 'Ana López', 'Identificación', 'Análisis morfológico de Carabus auratus'),
(1, 'Pedro Hernández', 'validacion', 'Captura de mosquitos con aspirador'),
(2, 'Juan Garcia', 'Recolectar', 'Uso de red para captura de mariposas'),
(2, 'Ana lópez', 'identificacion', 'Uso de red para captura de mariposas'),
(2, 'Pedro Hernandez', 'validacion', 'Uso de red para captura de mariposas'),
(3, 'alex Rofriguez', 'recolector', 'Uso de trampas para abejas'),
(3, 'Ana López', 'identificacion', 'Uso de trampas para abejas'),
(4, 'alex Rofriguez', 'recolector', 'Uso de trampas para abejas'),
(5, 'alex Rofriguez', 'recolector', 'Uso de trampas para abejas'),
(5, 'Ana López', 'indentificacion', 'Uso de trampas para abejas');

-- Insertar en la tabla especimen_imagenes
INSERT INTO especimen_imagenes (id_especimen, id_foto) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Las inserciones en las tablas TRABAJADOR_INSTITUCION y INSTITUTO_COLECTAS se mantienen igual

INSERT INTO TRABAJADOR_INSTITUCION (ID_TRABAJADOR, ID_INSTITUCION) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- Insertar en la tabla INSTITUTO_COLECTAS
INSERT INTO INSTITUTO_COLECTAS (ID_INSTITUCION, ID_Evento_Recoleccion) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);