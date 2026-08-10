INSERT INTO [user] (first_name, last_name, [user_name], email, dob, email_subscription, user_type_id)
VALUES
	('Loc', 'Bui', 'lbunix', 'loc@example.com','1990-01-01', 0, 1),
	('Karen', 'Smith', 'karen', 'karen@example.com','1990-12-15', 0, 1),
	('Chris', 'Johnson', 'cjohnson', 'chris@example.com','1992-10-04', 0, 1),
	('Martha', 'Brown', 'mbrown', 'martha@example.com','1991-09-14', 0, 1),
	('Jake', 'Wilson', 'jwilson', 'jake@example.com','1999-07-22', 0, 1),
	('Isaac', 'Lynch', 'ilynch', 'isaac@example23.com','1982-12-24', 0, 2),
	('Ben', 'Hur', 'bhur', 'ben@example42.com','1823-04-13', 0, 2),
	('Celeste', 'Waller', 'cwaller', 'celeste@example94.com','1994-06-26', 0, 2),
	('Linda', 'Ayala', 'layala', 'layla@example57.com','2004-03-30', 0, 2),
	('Dean', 'Rice', 'drice', 'dean@example75.com','2001-09-11', 0, 2);

INSERT INTO [character] (in_game_name, date_created, last_logon, player_account_id, character_type_id, world_id)
VALUES

	-- Characters
	('Ye_olde_DM', '2020-03-19', '2026-08-10', 5, 2, 1),
	('Pzowoi', '2026-01-11', '2026-08-10', 6, 2, 1),
	('Oyzagra', '2026-04-15', '2026-08-08', 6, 2, 3),
	('Nuri', '2026-02-15', '2026-07-25', 7, 2, 5),
	('Oduti', '2025-07-02', '2026-02-22', 7, 2, 3),
	('Kimi', '2024-02-27', '2025-01-17', 8, 2, 2),
	('Bjeka', '2025-11-13', '2025-12-24', 9, 2, 4),
	('Cerokoz', '2022-12-10', '2026-08-09', 10, 2, 1),

	-- NPCs
	('Margot the Inn Keeper', '2020-03-19', NULL, NULL, 1, 1),
	('Kemeo the Inn Keeper', '2020-03-19', NULL, NULL, 1, 2),
	('Srimur the Inn Keeper', '2020-03-19', NULL, NULL, 1, 3),
	('cavu the Inn Keeper', '2020-03-19', NULL, NULL, 1, 4),
	('Wrote the Inn Keeper', '2020-03-19', NULL, NULL, 1, 5),
	('Zece the Blacksmith', '2020-03-19', NULL, NULL, 1, 1),
	('Paxom the Blacksmith', '2020-03-19', NULL, NULL, 1, 2),
	('Srari the Blacksmith', '2020-03-19', NULL, NULL, 1, 3),
	('Duret the Blacksmith', '2020-03-19', NULL, NULL, 1, 4),
	('Heguy the Blacksmith', '2020-03-19', NULL, NULL, 1, 5),
	('Zorro the Dungeon Boss', '2020-03-19', NULL, NULL, 1, 1),
	('Jeyzok the Dungeon Boss', '2020-03-19', NULL, NULL, 1, 2),
	('Zaigre the Dungeon Boss', '2020-03-19', NULL, NULL, 1, 3),
	('Sjurep the Dungeon Boss', '2020-03-19', NULL, NULL, 1, 4),
	('Praygruo the Dungeon Boss', '2020-03-19', NULL, NULL, 1, 5);

INSERT INTO character_attributes (character_id, strength, constitution, dexterity, intelligence, charisma, luck, damage, [description])

SELECT
    c.character_id,
    v.strength,
    v.constitution,
    v.dexterity,
    v.intelligence,
    v.charisma,
    v.luck,
    v.damage,
    v.[description]

FROM [character] c JOIN (

VALUES

    -- Playable Characters
    ('Ye_olde_DM', 20, 20, 20, 20, 20, 20, 25, 'Dungeon master / admin character'),
    ('Pzowoi',     17, 16, 11,  8, 10,  9, 18, 'Warrior build'),
    ('Oyzagra',    10, 11, 18, 12, 10, 14, 14, 'Rogue build'),
    ('Nuri',        7, 10, 12, 19, 14, 11, 17, 'Mage build'),
    ('Odutil',     16, 18,  9, 10, 15,  8, 17, 'Paladin tank build'),
    ('Kimi',       11, 12, 18, 12, 10, 13, 15, 'Ranger build'),
    ('Bjeka',       9, 11, 14, 13, 19, 15, 10, 'Bard support build'),
    ('Cerokoz',    19, 17, 12,  7,  8, 10, 20, 'Berserker build'),

    -- Inn Keepers
    ('Margot the Inn Keeper', 6, 10,  9, 11, 18, 12, 3, 'Inn keeper'),
    ('Kemeo the Inn Keeper',  7, 10, 10, 12, 17, 13, 3, 'Inn keeper'),
    ('Srimur the Inn Keeper', 5,  9, 11, 13, 18, 14, 2, 'Inn keeper'),
    ('cavu the Inn Keeper',   6, 11,  9, 12, 16, 15, 3, 'Inn keeper'),
    ('Wrote the Inn Keeper',  7, 10, 10, 11, 19, 12, 3, 'Inn keeper'),

    -- Blacksmiths
    ('Zece the Blacksmith',  16, 17,  9, 10, 11,  8, 11, 'Blacksmith'),
    ('Paxom the Blacksmith', 17, 16,  8,  9, 10,  9, 12, 'Blacksmith'),
    ('Srari the Blacksmith', 15, 18, 10, 11,  9,  7, 11, 'Blacksmith'),
    ('Duret the Blacksmith', 18, 17,  7,  9, 10,  8, 13, 'Blacksmith'),
    ('Heguy the Blacksmith', 16, 16, 10, 12, 11, 10, 12, 'Blacksmith'),

    -- Dungeon Bosses
    ('Zorro the Dungeon Boss',   19, 18, 14, 12, 14, 12, 22, 'Powerful dungeon boss'),
    ('Jeyzok the Dungeon Boss',  18, 19, 13, 15, 12, 10, 21, 'Powerful dungeon boss'),
    ('Zaigre the Dungeon Boss',  17, 18, 16, 14, 13, 13, 20, 'Powerful dungeon boss'),
    ('Sjurep the Dungeon Boss',  20, 17, 12, 10, 15, 11, 23, 'Powerful dungeon boss'),
    ('Praygruo the Dungeon Boss',19, 20, 14, 13, 12,  9, 24, 'Powerful dungeon boss')

) AS v (in_game_name, strength, constitution, dexterity, intelligence, charisma, luck, damage, [description])

ON c.in_game_name = v.in_game_name;
