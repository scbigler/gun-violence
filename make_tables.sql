
--Create table from Census
CREATE TABLE IF NOT EXISTS subest2021 (
   SUMLEV INT,
   STATE INT,
	COUNTY INT,
	PLACE INT,
	COUSUB INT,
	CONSIT INT,
	PRIMGEO_FLAG VARCHAR(50),
	FUNCSTAT VARCHAR(50),
	NAME VARCHAR(75),
	STNAME VARCHAR(50),
	ESTIMATEBASE2020 INT,
	POPESTIMATE2020 INT,
	POPESTIMATE2021 INT );


	--Create gun incidents table
	CREATE TABLE IF NOT EXISTS gunviolencedata (
	incident_id INT,
	date DATE,
   	state VARCHAR(75),
	city_or_county VARCHAR(75),
	address VARCHAR(255),
	n_killed INT,
	n_injured INT,
	incident_url VARCHAR(255),
	source_url VARCHAR(255),
	incident_url_fields_missing BOOLEAN,
	congressional_district INT,
	gun_stolen TEXT,
	gun_type TEXT,
	incident_characteristics TEXT,
	latitude DOUBLE PRECISION,
	location_description TEXT,
	longitude DOUBLE PRECISION,
	population INT );