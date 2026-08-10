USE CIS230_FINAL;
GO

-- FOREIGN KEY SET UP

-- User Types
INSERT INTO user_type ([name])
VALUES
	('admin'),
	('player');

-- Character Types
-- 0 = NPC
-- 1 = Playable
INSERT INTO character_type ([type])
VALUES
	(0),
	(1);

-- Regions
INSERT INTO region (region_name)
VALUES
	('NA'),
	('EU'),
	('AS'),
	('OCE'),
	('SA');

-- Worlds
INSERT INTO world (world_name, region_id)
VALUES
	('Wild Mount', 1),
	('Luminara', 2),
	('Grimhollow', 3),
	('Morrowind', 4),
	('Erebor', 5);

ALTER TABLE character_type
ADD [name] AS (
	CASE
		WHEN [type] = 0 THEN 'NPC'
		WHEN [type] = 1 THEN 'Playable'
	END
);
GO
