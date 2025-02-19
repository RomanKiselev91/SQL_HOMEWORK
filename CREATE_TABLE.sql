CREATE TABLE artist
(
	artist_id int PRIMARY KEY,
	name_artist text NOT NULL,
	genres int NOT NULL
);

CREATE TABLE track
(
	track_id int PRIMARY KEY,
	name_track text NOT NULL,
	duration_track time NOT NULL,
	album_id int NOT NULL
	
);

CREATE TABLE album
(
	album_id int PRIMARY KEY,
	name_album text NOT NULL,
	duration_album time NOT NULL,
	album_release int  NOT NULL
);

CREATE TABLE genres
(
	genres_id int PRIMARY KEY,
	name_genres text NOT NULL
);

CREATE TABLE collection
(
	collection_id int PRIMARY KEY,
	name_collection text NOT NULL,
	realise int NOT NULL
);
CREATE TABLE artist_album
(
	artist_id int REFERENCES artist(artist_id),
	album_id int REFERENCES album(album_id),

	CONSTRAINT artist_album_pkey PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE genres_artist
(
	artist_id int REFERENCES artist(artist_id),
	genres_id int REFERENCES genres(genres_id),

	CONSTRAINT genres_artist_pkey PRIMARY KEY (artist_id, genres_id) 
);

CREATE TABLE track_artist
(
	track_id int REFERENCES track(track_id),
	artist_id int REFERENCES artist(artist_id),

	CONSTRAINT track_artist_pkey PRIMARY KEY (track_id, artist_id)
);

CREATE TABLE album_track
(
	album_id int REFERENCES album(album_id),
	track_id int REFERENCES track(track_id),

	CONSTRAINT album_track_pkey PRIMARY KEY (album_id, track_id)
);

CREATE TABLE collection_track
(
	collection_id int REFERENCES collection(collection_id),
	track_id int REFERENCES track(track_id),

	CONSTRAINT collection_track_pkey PRIMARY KEY (collection_id, track_id)
);
