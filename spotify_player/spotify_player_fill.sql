USE spotify_player;
INSERT INTO
	music (name, duration)
VALUES
	("The ringer", 338),
	("Greatest", 227),
	("Perfect", 300),
	("Shape of you", 320),
	("You Don't Know", 264),
	("In Da Club", 250);
INSERT INTO
	singer (name, biography)
VALUES
	("Eminem", "an American rapper, songwriter, record producer, record executive, and actor."),
	("50 cent", "an American rapper, singer, songwriter, actor, producer, entrepreneur, and investor."),
	("Ed Sheeran", "an English singer, songwriter, guitarist, record producer, and actor.");
INSERT INTO
	musictosinger (music_id, singer_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 3),
	(4, 3),
	(5, 1),
	(5, 2),
	(6, 2);