import psycopg2
connection = psycopg2.connect(database="Music_chart", user="postgres", password="5304113426", host="localhost", port=5432)
cursor = connection.cursor()

sel_1 = """SELECT name_artist, name_track
FROM artist
JOIN track_artist ON artist.artist_id = track_artist.artist_id
JOIN track ON track.track_id = track_artist.track_id;"""

sel_2= """SELECT name_artist, name_album
FROM artist
JOIN artist_album ON artist.artist_id = artist_album.artist_id
JOIN album ON album.album_id = artist_album.artist_id;
"""

sel_3= """SELECT name_album, name_track
FROM album
JOIN album_track ON album.album_id = album_track.album_id
JOIN track ON track.track_id = album_track.track_id;
"""

sel_4= """SELECT name_album, album_release
FROM album
WHERE album_release = '2004';
"""

sel_5= """SELECT track.name_track, duration_track
FROM track
WHERE duration_track = (SELECT MAX(duration_track) FROM track);
"""

sel_6= """SELECT name_track, duration_track---Название треков, продолжительность которых не менее 3,5 минут.
FROM track
WHERE duration_track >= '00:03:30';
"""

sel_7= """SELECT name_collection, realise ---Названия сборников, вышедших в период с 2018 по 2020 год включительно
FROM collection
WHERE realise BETWEEN '2018' AND '2020';
"""

sel_8= """SELECT name_track---Название треков, которые содержат слово «моя» или «my»
FROM track
WHERE name_track LIKE '%моя%' OR name_track LIKE 'my';

"""

sel_9= """SELECT name_genres, COUNT(artist_id)---Количество исполнителей в каждом жанре.
FROM genres
JOIN genres_artist ON genres.genres_id = genres_artist.genres_id
GROUP BY genres.name_genres;
"""
cursor.execute(sel_9)

records = cursor.fetchall()
for i in records:
 print(i)