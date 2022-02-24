-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INT REFERENCES albums ON DELETE NULL
);

CREATE TABLE album_artist
(
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums ON DELETE NULL,
  artist_id INT REFERENCES artists ON DELETE NULL,
);

CREATE TABLE song_artist
(
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES songs ON DELETE NULL,
  artist_id INT REFERENCES artists ON DELETE NULL,
);

CREATE TABLE song_producer
(
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES songs ON DELETE NULL,
  producer_id INT REFERENCES producers ON DELETE NULL,
);



CREATE TABLE