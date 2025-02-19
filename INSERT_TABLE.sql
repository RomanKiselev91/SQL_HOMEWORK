INSERT INTO  artist
VALUES 
(1, 'ANNA ASTI', '1'),
(2, 'RAMMSTEIN', '2'),
(3, 'Дмитрий Маликов', '1'),
(4, 'Pink Floyd', '3');

INSERT INTO track
VALUES
(1, 'Космически', '00:03:12','1'),
(2, 'Дурак', '00:03:02','1'),
(3, 'Пообещай', '00:03:43','1'),
(4, 'Царица', '00:04:02','1'),
(5, 'Mein Herz brennt', '00:04:40', '2'),
(6, 'Links 2 3 4', '00:03:37', '2'),
(7, 'Sonne', '00:04:32', '2'),
(8, 'Ich will', '00:03:37', '2'),
(9, 'Ты одна, ты такая', '00:04:33', '3'),
(10, 'Звезда моя далекая', '00:04:33', '3'),
(11, 'На полночных бульварах','00:04:39', '3'),
(12, 'Этой ночью', '00:05:05', '3'),
(13, 'In the Flesh?', '00:03:18', '4'),
(14, 'Another Brick in the Wall', '00:03:11', '4'),
(15, 'The Thin Ice', '00:02:30', '4');


INSERT INTO album
VALUES
(1, 'Царица', '00:14:27', '2021'),
(2, 'Mutter', '00:15:12', '2004'),
(3, 'Звезда моя далекая', '00:18:19', '2002'),
(4, 'The Wall', '00:13:27', '1979');

INSERT INTO genres
VALUES
(1, 'pop'),
(2, 'rock'),
(3, 'art-rock');

INSERT INTO collection
VALUES
(1, 'The Best track', '2018'),
(2, 'Best the best', '2019'),
(3, 'Best 2020', '2020'),
(4, 'Best 2021', '2021');


INSERT INTO artist_album
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO genres_artist
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3);


INSERT INTO track_artist
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 4),
(14, 4),
(15, 4);

INSERT INTO album_track
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4), 
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11), 
(3, 12),
(4, 13),
(4, 14),
(4, 15);

INSERT INTO collection_track
VALUES
(1, 1),
(1, 2),
(1, 3), 
(2, 4),
(2, 5), 
(2, 6),
(3, 7),
(3, 2),
(3, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14);

