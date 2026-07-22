USE CIS230;

CREATE TABLE Region (
  region_id INT PRIMARY KEY AUTO_INCREMENT,
  region_name VARCHAR(255) NOT NULL,
  geography VARCHAR(128),
  climate_type VARCHAR(16),
);

CREATE TABLE Location (
  location_id INT PRIMARY KEY AUTO_INCREMENT,
  location_name VARCHAR(255) NOT NULL,
  city VARCHAR(32) NOT NULL,
  type VARCHAR(16),
  description VARCHAR(255),
  region_id INT,
  FOREIGN KEY (region_id) REFERENCES Region(region_id),
);

CREATE TABLE Food (
  food_id INT PRIMARY KEY AUTO_INCREMENT,
  food_name VARCHAR(32) NOT NULL,
  food_type VARCHAR(32) NOT NULL,
  price DECIMAL(9,2),
  description VARCHAR(255),
  location_id INT,
  FOREIGN KEY (location_id) REFERENCES Location(location_id),
);

CREATE TABLE Weather (
  weather_id INT PRIMARY KEY AUTO_INCREMENT,
  month VARCHAR(16) NOT NULL,
  avg_high_temp SMALL INT NOT NULL,
  avg_low_temp SMALL INT NOT NULL,
  rain_inches SMALLINT,
  location_id INT,
  FOREIGN KEY (location_id) REFERENCES Location(location_id),
);
