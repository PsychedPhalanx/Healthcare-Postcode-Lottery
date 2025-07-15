CREATE TABLE lad_population(
	code VARCHAR(10),
	name VARCHAR(50),
	geography TEXT,
	area INTEGER,
	population INTEGER
);

COPY lad_population
FROM '../data/raw/lad_population.csv'
WITH (FORMAT csv, HEADER true);
