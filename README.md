# Proyecto Avanzado de SQL en Spotify y Optimización de Consultas

## 🎵 Logo de Spotify 🎵

## 📌 ##Descripción General
Este proyecto implica el análisis de un conjunto de datos de Spotify con diversos atributos sobre pistas, álbumes y artistas utilizando SQL. Se abarca todo el proceso, desde la normalización de un conjunto de datos desnormalizado hasta la ejecución de consultas SQL de diferentes niveles de complejidad (fácil, medio y avanzado) y la optimización del rendimiento de las consultas.

### Los principales objetivos del proyecto son:

✔️ Practicar habilidades avanzadas en SQL.

✔️ Extraer información valiosa del conjunto de datos.

### 📊 Creación de la Tabla
```sql
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
```

## 🔍 Pasos del Proyecto
### 1️⃣ Exploración de Datos
Antes de comenzar con SQL, es importante comprender el conjunto de datos. Algunos de los atributos principales son:

✔️ Artista: Nombre del intérprete de la pista.

✔️ Pista: Nombre de la canción.

✔️ Álbum: Álbum al que pertenece la canción.

✔️ Tipo de Álbum: Categoría del álbum (Ej. sencillo o álbum).

✔️ Métricas: Danceabilidad, energía, volumen, tempo, entre otras.

### 2️⃣ Consultas SQL
Una vez insertados los datos, se pueden escribir diversas consultas SQL para explorar y analizar la información. Estas consultas se dividen en tres niveles:

### 🔹 Consultas Fáciles
1.Recuperar los nombres de todas las pistas con más de 1,000 millones de reproducciones.

2.Listar todos los álbumes junto con sus respectivos artistas.

3.Obtener el total de comentarios en pistas donde licensed = TRUE.

4.Encontrar todas las pistas que pertenecen a álbumes de tipo sencillo.

5.Contar el número total de pistas por cada artista.
### 🔹 Consultas de Nivel Medio
6.Calcular el promedio de danceabilidad de las pistas en cada álbum.

7.Encontrar las 5 pistas con los valores más altos de energía.

8.Listar todas las pistas con sus vistas y "me gusta" donde official_video = TRUE.

9.Para cada álbum, calcular el total de vistas de todas sus canciones.

10.Recuperar los nombres de las pistas que han sido más reproducidas en Spotify que en YouTube.

### 🔹 Consultas Avanzadas

11.Encontrar las 3 pistas más vistas por cada artista usando funciones de ventana.

12.Escribir una consulta para encontrar las pistas donde la puntuación de liveness es superior al promedio.

13.Usar WITH para calcular la diferencia entre los valores de energía más alto y más bajo en cada álbum.

```sql
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
```

Encontrar las pistas donde la relación entre energía y liveness es mayor a 1.2.
Calcular la suma acumulativa de "me gusta" de las pistas, ordenadas por el número de vistas, usando funciones de ventana.

## 🛠️ Tecnologías Utilizadas
✅ Base de Datos: Microsoft SQL Management Studio
✅ Consultas SQL: DDL, DML, agregaciones, joins, subconsultas, funciones de ventana









