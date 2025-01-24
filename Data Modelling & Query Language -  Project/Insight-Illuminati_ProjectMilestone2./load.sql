-- Load data into the 'movies' table
\copy movies(movie_id, title, original_title, is_adult, start_year, end_year, runtime_minutes) FROM 'TABLES DATA/Movies.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'genre' table
\copy genre(genre_id, genre_name) FROM 'TABLES DATA/Genre.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'moviegenres' table
\copy moviegenres(movie_id, genre_id) FROM 'TABLES DATA/MovieGenres.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'people' table
\copy people(person_id, name, birth_year, death_year) FROM 'TABLES DATA/People.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'occupations' table
\copy occupations(occupation_id, occupation_title) FROM 'TABLES DATA/Occupations.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'castandcrew' table
\copy castandcrew(movie_id, person_id, occupation_id, start_date, end_date) FROM 'TABLES DATA/CastAndCrew.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'alternatetitles' table
\copy alternatetitles(movie_id, ordering, title, region, language, types, attributes, is_original_title) FROM 'TABLES DATA/AlternateTitles.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'titlecrew' table
\copy titlecrew(movie_id, director_ids, writer_ids) FROM 'TABLES DATA/TitleCrew.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'episodes' table
\copy episodes(episode_id, parent_movie_id, season_number, episode_number) FROM 'TABLES DATA/Episodes.tsv' WITH (FORMAT CSV, DELIMITER E'\t', NULL 'NULL', HEADER);

-- Load data into the 'rating' table
\copy rating(movie_id, rating_value, num_votes, rating_timestamp, rating_source) FROM 'TABLES DATA/Ratings.tsv' DELIMITER E'\t' CSV HEADER;

-- Load data into the 'filmroles' table
\copy filmroles(movie_id, person_id, ordering, character_name) FROM 'TABLES DATA/FilmRoles.tsv' DELIMITER E'\t' CSV HEADER;
