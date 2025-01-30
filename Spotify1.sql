--EDA

select COUNT (*) from spotify.dbo.cleaned_dataset$

select COUNT (distinct	album) from spotify.dbo.cleaned_dataset$

select COUNT (distinct	artist) from spotify.dbo.cleaned_dataset$

SELECT DISTINCT Album_type
FROM spotify.dbo.cleaned_dataset$;

select max(duration_min) from 
spotify.dbo.cleaned_dataset$

select min(duration_min) from 
spotify.dbo.cleaned_dataset$

select distinct most_playedon from spotify.dbo.cleaned_dataset$

--DATA ANALYSIS -- CATEGORIA FACIL

1.Retrieve the names of all tracks that have more than 1 billion streams.
2.List all albums along with their respective artists.
3.Get the total number of comments for tracks where licensed = TRUE.
4.Find all tracks that belong to the album type single.
5.Count the total number of tracks by each artist.


1.
--Todos los nombres de las canciones que tengas mas de 1 billon de vistas
SELECT 
	artist,
	track,
	stream
FROM [Spotify].[dbo].[cleaned_dataset$]
WHERE stream > 1000000000;

2.
--Nombra todos los albumenes con su respectivo artista
select	
	distinct album, artist
FROM [Spotify].[dbo].[cleaned_dataset$]
where Album is not null
order by 1

3. 
--Numero total de commentarios para canciones que tengan su Licensed = True
select
	sum(comments) as total_comments
from Spotify.dbo.cleaned_dataset$
where licensed = 'true'
4.
--Todos las canciones que pertencen al album_type: single.

select * from Spotify.dbo.cleaned_dataset$
where Album_type = 'single'

select COUNT(*) from Spotify.dbo.cleaned_dataset$
where Album_type = 'single'

5.
--Numero total de canciones por cada artista
select 
	artist,
	count(*) as total_songs
from Spotify.dbo.cleaned_dataset$
group by Artist
order by 2 



6.
--Calcular  el avg de danceability de las canciones en cada album
SELECT
    album,
    AVG(CAST(danceability AS FLOAT)) AS avg_danceability
FROM Spotify.dbo.cleaned_dataset$
GROUP BY album
ORDER BY avg_danceability DESC;

7.
--top 5 de canciones con el mayor avg de energy.
SELECT TOP 5
    track,
    AVG(energy) AS avg_energy
FROM Spotify.dbo.cleaned_dataset$
GROUP BY track
ORDER BY avg_energy DESC;

8.
--Todas las canciones con sus vistas y likes donde official_video = true
SELECT 
    track,
    SUM(views) AS total_views,
    SUM(likes) AS total_likes
FROM Spotify.dbo.cleaned_dataset$
WHERE official_video = 'true'
GROUP BY track
ORDER BY total_views DESC;

9.
--Para cada album, calcular el total de vistas de todas las canciones asociadas
SELECT 
    album,
    track,
    SUM(views) AS total_views
FROM Spotify.dbo.cleaned_dataset$
GROUP BY album, track
ORDER BY total_views DESC;

10.
--Retrieve the track names that have been streamed on Spotify more than YouTube.
--Encuentra la cancion que fue reproducida mas en Spotify que en Youtube

select * from 
(select 
	track,
	most_playedon,
	coalesce(case when most_playedon = 'Youtube' then stream end,0) as streamed_on_youtube,
	coalesce(case when most_playedon = 'Spotify' then stream end,0) as streamed_on_spotify

from Spotify.dbo.cleaned_dataset$
) as t1
where 
	streamed_on_spotify > streamed_on_youtube 

11.
--Encuentra los top 3 mas vistas canciones por cada artista usando windows funcion.

with ranking_artist as 
(SELECT 
    artist,
    track,
    SUM(Views) AS total_view,
    DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(Views) DESC) AS rank
FROM spotify.dbo.cleaned_dataset$
GROUP BY artist, track
)
select * from ranking_artist
where rank <= 3


12. 
--ESCRIBE UN QUERY para encontrar canciones donde su liveness sea mayor que el promedio

select 
	track,
	artist,
	liveness
	FROM spotify.dbo.cleaned_dataset$

where liveness > (select avg(liveness) from Spotify.dbo.cleaned_dataset$)
select avg(liveness) from Spotify.dbo.cleaned_dataset$

13.

--Usa with clause para calcular la diferencia entre el mayor
--y menor valores de energia para cada cancion de cada album

with cte as
(SELECT
	album,
	max(energy) as highest_energy,
	MIN(energy) as lowest_energy
from Spotify.dbo.cleaned_dataset$
group by album)
select
	album,
	highest_energy - lowest_energy as energy_diff
from cte
order by 2 desc


