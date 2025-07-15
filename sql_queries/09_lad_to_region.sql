CREATE TABLE lad_to_region(
	local_authority VARCHAR(50),
	region VARCHAR(50)
);

COPY lad_to_region
FROM '../data/raw/lad_to_region.csv'
WITH (FORMAT csv, HEADER true);
