USE albums_db;


#3a 31 rows

SELECT DISTINCT artist
FROM albums;

#3b 23 unique artists

#3c ID is the primary key

SELECT DISTINCT release_date FROM albums;

#3d 1967 is the oldest release date, and the most recent is from 2011

SELECT *
FROM albums
WHERE artist = "pink floyd";

#4a The Wall, The Dark Side of the Moon

SELECT *
FROM albums
WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";

#4b 1967

SELECT *
FROM albums
WHERE NAME = "Nevermind";

#4c Grunge, Alternative Rock

SELECT *
FROM `albums`
WHERE `release_date` <= 1999 AND `release_date` > 1990;

#4d The Bodyguard, Jagged Little Pill, Come On Over, Falling Into You, Let's Talk about Love, Dangerous, Titanic: Music from Motion Picture, Metallica, Nevermind, and Supernatural

SELECT * 
FROM albums
WHERE sales < 20;

#4e Grease, Bad, Sgt. Peppers, Dirty Dancing, Dangerous, etc

SELECT *
FROM albums
WHERE genre = "Rock";

#4f 5 Rock albums, Sgt. Peppers, 1, Abbey Road, Born in the U.S.A., Supernatural.  The string is not the same, so it does not count them as Rock