CREATE DATABASE catalog_of_my_things;

CREATE TABLE labels(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100),  
);

CREATE TABLE books(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id INT REFERENCES genres(id),
  author_id INT REFERENCES authors(id),
  source_id INT REFERENCES sources(id),
  label_id  INT REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  cover_state VARCHAR(20) NOT NULL
);