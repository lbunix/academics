USE CIS230_FINAL;
GO

CREATE TABLE user_type (
	user_type_id INT IDENTITY(1,1) PRIMARY KEY,
	[name] VARCHAR(16) NOT NULL
);

CREATE TABLE [user] (
	account_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	[user_name] VARCHAR(16) NOT NULL,
	email VARCHAR(64) NOT NULL,
	dob DATE NOT NULL,
	email_subscription BIT NOT NULL DEFAULT 1, -- 0 = No, 1 = Yes (default)
	user_type_id INT NOT NULL,
	FOREIGN KEY (user_type_id) REFERENCES user_type(user_type_id)
);

CREATE TABLE player_account (
	player_account_id INT IDENTITY(1,1) PRIMARY KEY,
	date_created DATE NOT NULL,
	last_login DATE,
	achievement_count INT NOT NULL DEFAULT 0,
	friend_count INT NOT NULL DEFAULT 0,
	chat_count INT NOT NULL DEFAULT 0,
	character_count INT NOT NULL DEFAULT 0,
	account_id INT NOT NULL UNIQUE,
	FOREIGN KEY (account_id) REFERENCES [user](account_id)
);

CREATE TABLE character_type (
	character_type_id INT IDENTITY(1,1) PRIMARY KEY,
	[type] BIT NOT NULL DEFAULT 1 -- 0 = NPC, 1 = playable (default)
);

CREATE TABLE character_attributes (
	character_id INT PRIMARY KEY,
	strength INT NOT NULL DEFAULT 0,
	constitution INT NOT NULL DEFAULT 0,
	dexterity INT NOT NULL DEFAULT 0,
	intelligence INT NOT NULL DEFAULT 0,
	charisma INT NOT NULL DEFAULT 0,
	luck INT NOT NULL DEFAULT 0,
	damage INT NOT NULL DEFAULT 0,
	[description] VARCHAR(64)
--	character_id INT,
--	FOREIGN KEY (character_id) REFERENCES [character](character_id)
);

CREATE TABLE [character] (
	character_id INT IDENTITY(1,1) PRIMARY KEY,
	in_game_name VARCHAR(16) NOT NULL,
	date_created DATE NOT NULL,
	last_logon DATE,
	player_account_id INT,
	character_type_id INT NOT NULL,
	world_id INT NOT NULL,
	FOREIGN KEY (player_account_id) REFERENCES player_account(player_account_id),
	FOREIGN KEY (character_type_id) REFERENCES character_type(character_type_id)
--	FOREIGN KEY (world_id) REFERENCES world(world_id)
);

ALTER TABLE character_attributes
ADD FOREIGN KEY (character_id) REFERENCES [character](character_id);

CREATE TABLE region (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR(16) NOT NULL
);

CREATE TABLE world (
	world_id INT IDENTITY(1,1) PRIMARY KEY,
	world_name VARCHAR(16) NOT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES region(region_id)
);

ALTER TABLE [character]
ADD FOREIGN KEY (world_id) REFERENCES world(world_id);
