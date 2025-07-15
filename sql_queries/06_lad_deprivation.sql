CREATE TABLE local_authority_deprivation(
	local_authority VARCHAR(50),
	not_deprived NUMERIC
);

COPY local_authority_deprivation
FROM '../data/raw/lad_deprivation_extract.csv'
WITH (FORMAT csv, HEADER true);