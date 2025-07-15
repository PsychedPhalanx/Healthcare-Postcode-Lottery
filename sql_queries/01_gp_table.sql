CREATE TABLE gp_practices_2025 (
    publication VARCHAR(20),
    extract_date DATE,
    type VARCHAR(10),
    sub_icb_location_code VARCHAR(10),
    ons_sub_icb_location_code VARCHAR(15),
    code VARCHAR(10),
    postcode VARCHAR(10),
    sex VARCHAR(10),
    age VARCHAR(10),
    number_of_patients INTEGER
);

COPY gp_practices_2025 
FROM '../data/raw/gp_practices_may2025.csv' 
WITH (FORMAT csv, HEADER true);