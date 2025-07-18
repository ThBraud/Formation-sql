DROP DATABASE IF EXISTS  netflix;
CREATE DATABASE IF NOT EXISTS netflix;
USE netflix;
DROP TABLE IF EXISTS film;
CREATE TABLE IF NOT EXISTS film(
id INT NOT NULL AUTO_INCREMENT,
titre VARCHAR(50) NOT NULL,
sortie VARCHAR(50) NOT NULL,
categ_id INT NOT NULL,
CONSTRAINT pk_film PRIMARY KEY (id)
)ENGINE=INNODB;

DROP TABLE IF EXISTS categ;
CREATE TABLE IF NOT EXISTS categ(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL, 
CONSTRAINT pk_categ PRIMARY KEY (id)
)ENGINE=INNODB;

INSERT INTO film (titre, sortie, categ_id) VALUES
('STAR WARS', '1977-05-25', 1),
('THE MATRIX', '1999-06-23',2),
('PULP FICTION', '1994-10-26',  3);

INSERT INTO categ (nom) VALUES
('Science Fiction'),
('Science Fiction'),
('Thriller');

#SELECT film.id, film.titre, film.sortie, categ.nom FROM film INNER JOIN categ ON film.categ_id = categ.id; ##
#SELECT film.id, film.titre, film.sortie, categ.nom FROM film INNER JOIN categ ON film.categ_id = categ.id WHERE categ.nom = 'Science Fiction'; ##Afficher tous les films de Science fiction
#SELECT categ.nom AS categorie, COUNT(*) AS nbfilms_SF FROM film INNER JOIN categ ON film.categ_id = categ.id WHERE categ.nom = 'Science Fiction'; ##Afficher Le nombre de films de Science Fiction
#SELECT categ.nom AS categorie, COUNT(*) AS nbfilms FROM film INNER JOIN categ ON film.categ_id = categ.id GROUP BY categ.nom; ##Afficher Le nombre de films 




