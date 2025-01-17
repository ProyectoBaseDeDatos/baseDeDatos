CALL crear_evento_de_coleccio(
 40.7128::DECIMAL(10,8), -- decimalLatitude
  -74.0060::DECIMAL(11,8), -- decimalLongitude
  'Central Park'::VARCHAR, -- locality
  'Deciduous forest'::VARCHAR, -- habitat
  'Healthy specimen with abundant foliage'::VARCHAR, -- notas
  'United States'::VARCHAR -- pais
  CURRENT_TIMESTAMP + INTERVAL '1 day' -- fecha_creacion
  10::INTEGER -- id_recolector
)

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
  'Collected'::VARCHAR, -- accion
  'Found near a stream'::VARCHAR, -- detalles
  6::INTEGER -- id_Evento_coleccion
  'todo bien',
  'longitud: 158.598 latitud: 23.4567'::TEXT -- coordenadas
);

CALL identificar_especimen(
  4,                     
  'Muestra de campo',   
  'Apis mellifera',     
  'Animalia',       
  'Arthropoda',           
  'Insecta',            
  'Apis',                  
  'Hymenoptera',            
  'Apidae',                  
  'mellifera',               
  ARRAY['Juan', 'Ana'],    
  ARRAY['Pérez', 'López'],  
  ARRAY['Gómez', 'Hernández']
);
