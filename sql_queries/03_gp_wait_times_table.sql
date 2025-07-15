CREATE TABLE wait_times(
	date VARCHAR(10),
	practice_code VARCHAR(10),
	practice_name VARCHAR(50),
	supplier VARCHAR(20),
	pcn_code VARCHAR(10),
	pcn_name VARCHAR(100),
	location VARCHAR(5),
	location_2 VARCHAR(100),
	wt_0 INTEGER,
	wt_1 INTEGER,
	wt_2_7 INTEGER,
	wt_8_14 INTEGER,
	wt_15_21 INTEGER,
	wt_22_28 INTEGER,
	wt_28_plus INTEGER,
	wt_NA INTEGER	
);

COPY wait_times
FROM '../data/raw/gp_wait_times.csv'
WITH (FORMAT csv, HEADER true);