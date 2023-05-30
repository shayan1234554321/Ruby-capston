-- Create database
CREATE DATABASE catalog_of_my_things;

-- Genres table
CREATE TABLE genres(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL
);

-- Items table
CREATE TABLE items(
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id      INT REFERENCES genres(id),
  author_id     INT REFERENCES authors(id),
  source_id     INT REFERENCES sources(id),
  label_id      INT REFERENCES labels(id),
  publish_date  DATE NOT NULL,
  archived      BOOLEAN NOT NULL,
  type          VARCHAR(255) NOT NULL
);

-- Music albums table
CREATE TABLE music_albums(
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify    BOOLEAN NOT NULL,
  FOREIGN KEY (id) REFERENCES items(id)
);
