USE CIS230;

CREATE TABLE [State] (
	state_id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	region VARCHAR(255) NOT NULL,
	geography VARCHAR(128),
	climate_type VARCHAR(16),
);

CREATE TABLE City (
	city_id INT IDENTITY(1,1) PRIMARY KEY,
	city_name VARCHAR(255) NOT NULL,
	is_capitol BIT NOT NULL DEFAULT 0, -- 0 = No (default), 1 = Yes
	type VARCHAR(16),
	description VARCHAR(255),
	state_id INT,
	FOREIGN KEY (state_id) REFERENCES [State](state_id),
);

CREATE TABLE Corporation (
	corp_id INT IDENTITY(1,1) PRIMARY KEY,
	corp_name VARCHAR(255) NOT NULL,
	business_type VARCHAR(16) NOT NULL,
	description VARCHAR(255),
	origin_city_id INT NOT NULL,
	FOREIGN KEY (origin_city_id) REFERENCES city(city_id),
	current_city_id INT,
	FOREIGN KEY (current_city_id) REFERENCES city(city_id),
);
