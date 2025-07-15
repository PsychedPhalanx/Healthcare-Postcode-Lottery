CREATE TABLE gp_staff(
	practice_code VARCHAR(10),
	practice_name VARCHAR(50),
	staff_group VARCHAR(20),
	staff_role VARCHAR(50),
	measure VARCHAR(10),
	value INTEGER
);

COPY gp_staff
FROM '../data/raw/gp_staff_headcounts.csv'
WITH (FORMAT csv, HEADER true, NULL 'NA');