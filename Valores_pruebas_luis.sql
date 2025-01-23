-- valido
CALL crear_evento_de_coleccion(
  -33.865143,        -- decimalLatitude: Válido
  151.209900,        -- decimalLongitude: Válido
  'Sídney',          -- locality: Válido
  'Zona costera',    -- habitat: Válido
  'Área turística',  -- notas: Válido
  'Australia',       -- pais: Válido
  '2025-03-15',      -- fecha_limite: Válido
  100                -- maximo_especies: Válido
);

--no valido

CALL crear_evento_de_coleccion(
  19.432608,         -- decimalLatitude: Válido
  -99.133209,        -- decimalLongitude: Válido
  'Ciudad de México',-- locality: Válido
  'Bosque',          -- habitat: Válido
  'Área protegida',  -- notas: Válido
  'México',          -- pais: Válido
  '2020-01-01',      -- fecha_limite: Inválido (en el pasado)
  50                 -- maximo_especies: Válido
);


-- valido
CALL insertar_especie(
  1::INTEGER, -- id_recolector
  'Quercus robur'::VARCHAR, -- scientificName
  'Adult'::VARCHAR, -- lifeStage
  'Male'::VARCHAR, -- sexo
  1::INTEGER, -- individualCount
  'Visual observation'::VARCHAR, -- descripcion_metodo
  ARRAY['http://example.com/image1.jpg', 'http://example.com/image2.jpg']::TEXT[], -- imagenes
  '2023-06-15'::DATE, -- fecha_recoleccion
  ARRAY['John', 'Maria']::TEXT[], -- nombres_contribuidores
  ARRAY['Doe', 'Garcia']::TEXT[], -- apellidos_paternos_contribuidores
  ARRAY['Smith', 'Lopez']::TEXT[], -- apellidos_maternos_contribuidores
  ARRAY['1985-03-12', '1990-07-22']::DATE[], -- fechas_contribuidores
  ARRAY['Collected''HOLA']::TEXT[], -- accion
  ARRAY['Found near a stream','hola']::TEXT[], -- detalles
  1::INTEGER, -- id_Evento_coleccion
  'todo bien'::TEXT,
  'longitud: 158.598 latitud: 23.4567'::TEXT -- coordenadas
);

-- no valido
CALL insertar_especie(
  1::INTEGER,
  'Papilio machaon'::VARCHAR,
  'adulto'::VARCHAR,
  'macho'::VARCHAR,
  -1::INTEGER,
  'Red de insectos'::VARCHAR,
  ARRAY['http://example.com/image1.jpg', 'http://example.com/image1.2pg']::TEXT[],
  '2025-01-15'::DATE,
  ARRAY['Juan', 'María']::TEXT[],
  ARRAY['Pérez', 'González']::TEXT[],
  ARRAY['López', 'Hernández']::TEXT[],
  ARRAY['2000-05-21', '1998-03-15']::DATE[],
  'captura'::VARCHAR,
  'capturado con red en el campo'::VARCHAR,
  2::INTEGER,
  'Especie recolectada cerca del río'::TEXT,
  'Latitud: 19.4326, Longitud: -99.1332'::TEXT
);

CALL insertar_especie(
  1::INTEGER,
  'Papilio machaon'::VARCHAR, -- Nombre ya existente (especie duplicada)
  'adulto'::VARCHAR,
  'macho'::VARCHAR,
  2::INTEGER,
  'Red de insectos'::VARCHAR,
  ARRAY['http://example.com/image1.jpg', 'http://example.com/image1.jpg']::TEXT[],
  '2025-01-10'::DATE,
  ARRAY['Roberto', 'Ana']::TEXT[],
  ARRAY['López', 'Fernández']::TEXT[],
  ARRAY['Ruiz', 'Martínez']::TEXT[],
  ARRAY['1990-12-01', '1985-11-15']::DATE[],
  'muestra'::VARCHAR,
  'muestra duplicada'::VARCHAR,
  2::INTEGER,
  'Especie ya registrada previamente'::TEXT,
  'Latitud: 20.1234, Longitud: -98.7654'::TEXT
);

-- valido
CALL identificar_especimen(
  4::INTEGER,                     
  'Muestra de campo'::VARCHAR,   
  'Apis mellifera'::VARCHAR,     
  'Animalia'::VARCHAR,       
  'Arthropoda'::VARCHAR,           
  'Insecta'::VARCHAR,            
  'Apis'::VARCHAR,                  
  'Hymenoptera'::VARCHAR,            
  'Apidae'::VARCHAR,                  
  'mellifera'::VARCHAR,               
  ARRAY['Juan', 'Ana']::TEXT[],    
  ARRAY['Pérez', 'López']::TEXT[],  
  ARRAY['Gómez', 'Hernández']::TEXT[],
  ARRAY['hola', 'holaDos']::TEXT[],
  ARRAY['ayudo', 'no ayudo']::TEXT[]
);

-- no valido  
CALL identificar_especimen(
  9999::INTEGER,                     
  'Muestra de campo'::VARCHAR,   
  'Apis mellifera'::VARCHAR,     
  'Animalia'::VARCHAR,       
  'Arthropoda'::VARCHAR,           
  'Insecta'::VARCHAR,            
  'Apis'::VARCHAR,                  
  'Hymenoptera'::VARCHAR,            
  'Apidae'::VARCHAR,                  
  'mellifera'::VARCHAR,               
  ARRAY['Juan', 'Ana']::TEXT[],    
  ARRAY['Pérez', 'López']::TEXT[],  
  ARRAY['Gómez', 'Hernández']::TEXT[],
  ARRAY['hola', 'holaDos']::TEXT[],
  ARRAY['ayudo', 'no ayudo']::TEXT[]
);


CALL Validar_Identificacion_especimen(2::INTEGER,100::INTEGER)
SELECT * FROM sp_buscar_especimen_por_taxonomia(1,NULL,NULL,NULL,NULL,NULL,NULL);
call sp_agregar_imagen_a_especimen(12345, 'http://example.com/imagen.jpg', 1);
