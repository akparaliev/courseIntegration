USE custom_player;
SET NAMES 'utf8';
CREATE TABLE album (
	id INT AUTO_INCREMENT,
	title VARCHAR(64) NOT NULL,
	creation_year INT NOT NULL,
	PRIMARY KEY(id)
) DEFAULT CHARSET=utf8;
CREATE TABLE song (
	id INT AUTO_INCREMENT,
	title VARCHAR(256) NOT NULL,
	singer_name VARCHAR(256) NOT NULL,
	album_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (album_id)
	REFERENCES album(id)
	ON DELETE CASCADE
) DEFAULT CHARSET=utf8;



