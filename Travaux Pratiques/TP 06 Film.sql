--Supprimer la base de données si elle existe.
DROP DATABASE IF EXISTS  netflix;

--Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS netflix;

--Utiliser la base de données Netflix
USE netflix;

--Création de la table film avec une primary key
DROP TABLE IF EXISTS film;
CREATE TABLE IF NOT EXISTS film(
id INT NOT NULL AUTO_INCREMENT,
titre VARCHAR(50) NOT NULL,
sortie VARCHAR(50) NOT NULL,
categ_id INT NOT NULL,
CONSTRAINT pk_film PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table Categ avec une primary key
DROP TABLE IF EXISTS categ;
CREATE TABLE IF NOT EXISTS categ(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL, 
CONSTRAINT pk_categ PRIMARY KEY (id)
)ENGINE=INNODB;


--Insertation de données dans la table film
INSERT INTO film (titre, sortie, categ_id) VALUES
('STAR WARS', '1977-05-25', 1),
('THE MATRIX', '1999-06-23',2),
('PULP FICTION', '1994-10-26',  3);

--Insertation de données dans la table categ
INSERT INTO categ (nom) VALUES
('Science Fiction'),
('Science Fiction'),
('Thriller');


--Afficher les films avec leur catégorie grâce aux INNER JOIN
#SELECT film.id, film.titre, film.sortie, categ.nom FROM film INNER JOIN categ ON film.categ_id = categ.id; ##

--Afficher tout les films de Sciences Fictions
#SELECT film.id, film.titre, film.sortie, categ.nom FROM film INNER JOIN categ ON film.categ_id = categ.id WHERE categ.nom = 'Science Fiction';

-- Afficher le nombre de films de Sciens Fictions
#SELECT categ.nom AS categorie, COUNT(*) AS nbfilms_SF FROM film INNER JOIN categ ON film.categ_id = categ.id WHERE categ.nom = 'Science Fiction';

--Afficher le nombre de films 
#SELECT categ.nom AS categorie, COUNT(*) AS nbfilms FROM film INNER JOIN categ ON film.categ_id = categ.id GROUP BY categ.nom;




