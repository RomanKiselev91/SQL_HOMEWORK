SELECT name_artist, name_track--- для каждого исполнителя список треков
FROM artist
JOIN track_artist ON artist.artist_id = track_artist.artist_id
JOIN track ON track.track_id = track_artist.track_id;

SELECT name_genres, name_artist --для каждого жанра список исполнителей ?????????
FROM genres
RIGHT JOIN genres_artist ON genres.genres_id = genres_artist.artist_id
LEFT JOIN artist ON artist.artist_id = genres_artist.artist_id;



SELECT name_artist, name_album---для каждого исполнителя список альбомов
FROM artist
JOIN artist_album ON artist.artist_id = artist_album.artist_id
JOIN album ON album.album_id = artist_album.artist_id;

SELECT name_album, name_track---для каждого альбома можно получить список треков
FROM album
JOIN album_track ON album.album_id = album_track.album_id
JOIN track ON track.track_id = album_track.track_id;

SELECT name_album, album_release---Название и год выхода альбомов, вышедших в 2018 году.
FROM album
WHERE album_release = '2004';

SELECT track.name_track, duration_track---Название и продолжительность самого длительного трека
FROM track
WHERE duration_track = (SELECT MAX(duration_track) FROM track);

SELECT name_track, duration_track---Название треков, продолжительность которых не менее 3,5 минут.
FROM track
WHERE duration_track >= '00:03:30';

SELECT name_collection, realise ---Названия сборников, вышедших в период с 2018 по 2020 год включительно
FROM collection
WHERE realise BETWEEN '2018' AND '2020';

SELECT name_artist---Исполнители, чьё имя состоит из одного слова.
FROM artist 
WHERE name_artist NOT LIKE '% %';

SELECT name_track---Название треков, которые содержат слово «моя» или «my»
FROM track
WHERE name_track LIKE '%моя%' OR name_track LIKE 'my';

---04 «Продвинутая выборка данных»

SELECT name_genres, COUNT(artist_id)---Количество исполнителей в каждом жанре.
FROM genres
JOIN genres_artist ON genres.genres_id = genres_artist.genres_id
GROUP BY genres.name_genres;

SELECT COUNT(track_id)---Количество треков, вошедших в альбомы 2000–2020 годов.
FROM track
JOIN album ON track.track_id = album.album_id
WHERE album.album_release BETWEEN 2000 AND 2020;

SELECT name_album, AVG(track.duration_track)---Средняя продолжительность треков по каждому альбому.
FROM album 
JOIN track ON album.album_id = track.track_id
GROUP BY album.name_album;


SELECT name_artist, name_album---Все исполнители, которые не выпустили альбомы в 2021 году.
FROM artist
JOIN artist_album ON artist.artist_id = artist_album.artist_id
JOIN album ON album.album_id = artist_album.artist_id
WHERE album.album_release <> '2021';


SELECT name_collection---Названия сборников, в которых присутствует конкретный исполнитель
FROM collection
JOIN collection_track ON collection.collection_id = collection_track.collection_id
JOIN track ON collection_track.track_id = track.track_id
JOIN album ON track.album_id = album.album_id
JOIN artist_album ON album.album_id = artist_album.album_id
JOIN artist ON artist_album.artist_id = artist.artist_id
WHERE artist.name_artist = 'RAMMSTEIN';

-- Наименования треков, которые не входят в сборники.
SELECT name_track 
FROM track
LEFT JOIN collection_track ON track.track_id = collection_track.track_id
WHERE collection_track.collection_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT name_artist, track.duration_track
FROM artist
LEFT JOIN artist_album ON artist.artist_id = artist_album.artist_id
LEFT JOIN album ON artist_album.album_id = album.album_id
LEFT JOIN track ON album.album_id = track.album_id
WHERE track.duration_track = (SELECT MIN(duration_track) FROM track
);
-- Названия альбомов, содержащих наименьшее количество треков.
SELECT album.name_album
FROM album
JOIN track ON album.album_id = track.album_id
GROUP BY album.album_id
HAVING COUNT(track.track_id) = (
    SELECT COUNT(*)
    FROM track
    GROUP BY album_id
    ORDER BY COUNT(*) ASC
	LIMIT 1
);



