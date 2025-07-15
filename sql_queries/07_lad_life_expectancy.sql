CREATE TABLE life_expectancy(
	lad_code VARCHAR(10),
	local_authority VARCHAR(50),
	sex VARCHAR(10),
	life_expectancy NUMERIC
);

COPY life_expectancy
FROM '../data/raw/lad_life_expectancy.csv'
WITH (FORMAT csv, HEADER true);