#Proyecto Avanzado de SQL en Spotify y Optimización de Consultas
##Categoría del Proyecto:Avanzado 
dataset

🎵 Logo de Spotify 🎵

📌 ##Descripción General
Este proyecto implica el análisis de un conjunto de datos de Spotify con diversos atributos sobre pistas, álbumes y artistas utilizando SQL. Se abarca todo el proceso, desde la normalización de un conjunto de datos desnormalizado hasta la ejecución de consultas SQL de diferentes niveles de complejidad (fácil, medio y avanzado) y la optimización del rendimiento de las consultas.

Los principales objetivos del proyecto son:
✔️ Practicar habilidades avanzadas en SQL.
✔️ Extraer información valiosa del conjunto de datos.

📊 Creación de la Tabla
sql
Copiar
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
🔍 Pasos del Proyecto
1️⃣ Exploración de Datos
Antes de comenzar con SQL, es importante comprender el conjunto de datos. Algunos de los atributos principales son:
✔️ Artista: Nombre del intérprete de la pista.
✔️ Pista: Nombre de la canción.
✔️ Álbum: Álbum al que pertenece la canción.
✔️ Tipo de Álbum: Categoría del álbum (Ej. sencillo o álbum).
✔️ Métricas: Danceabilidad, energía, volumen, tempo, entre otras.

2️⃣ Consultas SQL
Una vez insertados los datos, se pueden escribir diversas consultas SQL para explorar y analizar la información. Estas consultas se dividen en tres niveles:

🔹 Consultas Fáciles
Recuperar los nombres de todas las pistas con más de 1,000 millones de reproducciones.
Listar todos los álbumes junto con sus respectivos artistas.
Obtener el total de comentarios en pistas donde licensed = TRUE.
Encontrar todas las pistas que pertenecen a álbumes de tipo sencillo.
Contar el número total de pistas por cada artista.
🔹 Consultas de Nivel Medio
Calcular el promedio de danceabilidad de las pistas en cada álbum.
Encontrar las 5 pistas con los valores más altos de energía.
Listar todas las pistas con sus vistas y "me gusta" donde official_video = TRUE.
Para cada álbum, calcular el total de vistas de todas sus canciones.
Recuperar los nombres de las pistas que han sido más reproducidas en Spotify que en YouTube.
🔹 Consultas Avanzadas
Encontrar las 3 pistas más vistas por cada artista usando funciones de ventana.
Escribir una consulta para encontrar las pistas donde la puntuación de liveness es superior al promedio.
Usar WITH para calcular la diferencia entre los valores de energía más alto y más bajo en cada álbum.
sql
Copiar
WITH cte AS (
    SELECT 
        album,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM spotify
    GROUP BY album
)
SELECT 
    album,
    highest_energy - lowest_energy AS energy_diff
FROM cte
ORDER BY energy_diff DESC;
Encontrar las pistas donde la relación entre energía y liveness es mayor a 1.2.
Calcular la suma acumulativa de "me gusta" de las pistas, ordenadas por el número de vistas, usando funciones de ventana.
🚀 Optimización de Consultas
En la etapa avanzada del proyecto, el enfoque se centra en mejorar el rendimiento de las consultas. Algunas estrategias utilizadas incluyen:

✅ Indexación: Creación de índices en columnas consultadas con frecuencia.
✅ Plan de Ejecución de Consultas: Uso de EXPLAIN ANALYZE para revisar y optimizar el rendimiento de las consultas.

📈 Análisis del Rendimiento de una Consulta Usando EXPLAIN
Antes de la optimización, ejecutamos una consulta sobre la columna artist y analizamos su rendimiento:

Tiempo de ejecución (E.T.): 7 ms
Tiempo de planificación (P.T.): 0.17 ms
🖼️ Captura de pantalla del resultado de EXPLAIN antes de la optimización

🔹 Creación de un Índice en la Columna artist
Para optimizar el rendimiento, creamos un índice en la columna artist, lo que permite una recuperación de datos más rápida.

sql
Copiar
CREATE INDEX idx_artist ON spotify(artist);
📊 Análisis del Rendimiento Tras la Creación del Índice
Después de la indexación, ejecutamos la misma consulta nuevamente y observamos mejoras significativas:

Tiempo de ejecución (E.T.): 0.153 ms
Tiempo de planificación (P.T.): 0.152 ms
🖼️ Captura de pantalla del resultado de EXPLAIN después de la optimización

📉 Comparación Gráfica de Rendimiento:
Un gráfico que muestra la reducción significativa en los tiempos de ejecución y planificación tras la indexación.

Este proceso demuestra cómo la indexación puede mejorar drásticamente el rendimiento de las consultas, optimizando las operaciones de la base de datos en este proyecto de Spotify.

🛠️ Tecnologías Utilizadas
✅ Base de Datos: PostgreSQL
✅ Consultas SQL: DDL, DML, agregaciones, joins, subconsultas, funciones de ventana
✅ Herramientas: pgAdmin 4 (o cualquier editor SQL), PostgreSQL (vía Homebrew, Docker o instalación directa)

📌 Cómo Ejecutar el Proyecto
1️⃣ Instalar PostgreSQL y pgAdmin (si aún no están instalados).
2️⃣ Configurar el esquema y las tablas en la base de datos utilizando la estructura proporcionada.
3️⃣ Insertar los datos de muestra en las tablas correspondientes.
4️⃣ Ejecutar las consultas SQL para resolver los problemas planteados.
5️⃣ Aplicar técnicas de optimización de consultas para conjuntos de datos grandes.

📩 Contacto y Contribución
Si deseas contribuir a este proyecto o tienes alguna sugerencia, ¡será bien recibida!

📧 Correo electrónico: [TuCorreo@ejemplo.com]
🔗 LinkedIn: [TuPerfilLinkedIn]

Este README ahora está optimizado para tu proyecto y con un formato profesional en español. Puedes copiarlo directamente en tu repositorio. 🚀🎵






