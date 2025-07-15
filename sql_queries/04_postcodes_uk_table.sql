CREATE TABLE postcodes_uk_staging (
    pcd TEXT,
    pcd2 TEXT,
    pcds VARCHAR(10),
    dointr TEXT,
    doterm TEXT,
    oscty TEXT,
    ced TEXT,
    oslaua VARCHAR(10),
    osward TEXT,
    parish TEXT,
    usertype TEXT,
    oseast1m TEXT,
    osnrth1m TEXT,
    osgrdind TEXT,
    oshlthau TEXT,
    nhser TEXT,
    ctry TEXT,
    rgn TEXT,
    streg TEXT,
    pcon TEXT,
    eer TEXT,
    teclec TEXT,
    ttwa TEXT,
    pct TEXT,
    itl TEXT,
    statsward TEXT,
    oa01 TEXT,
    casward TEXT,
    npark TEXT,
    lsoa01 TEXT,
    msoa01 TEXT,
    ur01ind TEXT,
    oac01 TEXT,
    oa11 TEXT,
    lsoa11 TEXT,
    msoa11 TEXT,
    wz11 TEXT,
    sicbl TEXT,
    bua11 TEXT,
    buasd11 TEXT,
    ru11ind TEXT,
    oac11 TEXT,
    lat DOUBLE PRECISION,
    long DOUBLE PRECISION,
    lep1 TEXT,
    lep2 TEXT,
    pfa TEXT,
    imd TEXT,
    calncv TEXT,
    icb TEXT,
    oa21 TEXT,
    lsoa21 VARCHAR(10),
    msoa21 TEXT
);

COPY postcodes_uk_staging
FROM '../data/raw/postcodes_uk.csv' -- Adjust the path as necessary
WITH (FORMAT csv, HEADER true, NULL 'NA');


CREATE TABLE postcodes_uk(
	postcode VARCHAR(10),
	latitude DOUBLE PRECISION,
	longitude DOUBLE PRECISION
);

INSERT INTO postcodes_uk(postcode, lad_code, latitude, longitude)
SELECT pcds, oslaua, lat, long
FROM postcodes_uk_staging;
