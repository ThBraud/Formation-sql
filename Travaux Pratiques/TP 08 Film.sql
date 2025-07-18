--Supprimer la base de données si elle existe
DROP DATABASE IF EXISTS prime;

--Création de la base de données si elle n'existe pas avec utf8mb4 qui stocke tous les caractères unicodes comme les émojis.
--Mais aussi avec utf8mb4_unicode_ci qui est insensible à la casse 
CREATE DATABASE IF NOT EXISTS prime  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--Utiliser la base données prime
USE prime;

--Création de la table film
DROP TABLE IF EXISTS film;
CREATE TABLE IF NOT EXISTS film (
  id INT  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_film PRIMARY KEY(id)
)ENGINE=INNODB;

--Création de la table acteur 
DROP TABLE IF EXISTS acteur;
CREATE TABLE IF NOT EXISTS acteur (
  id INT NOT NULL AUTO_INCREMENT,
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
   CONSTRAINT pk_acteur PRIMARY KEY(id)
)ENGINE=INNODB;

--Création de la table acteur_film
DROP TABLE IF EXISTS acteur_film;
CREATE TABLE IF NOT EXISTS acteur_film (
film_id INT NOT NULL,
acteur_id INT NOT NULL,
  CONSTRAINT pk_acteur_film PRIMARY KEY (film_id, acteur_id)
)ENGINE=INNODB;

--Ajoute des clés étrangères pour structurer la liason entre les tables
ALTER TABLE acteur_film ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES acteur (id);
ALTER TABLE acteur_film ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film (id);

--Insertion des données dans la table acteur
INSERT INTO acteur (prenom, nom) VALUES
('Brad', 'PITT'),
('Léonardo', 'Dicaprio'),
('Tom', 'Cruise');

--Insertion des données dans la table film
INSERT INTO film (nom) VALUES
('Fight Club'),
('Once Upon a time in Hollywood'),
('Titanic');

--Insertion des données dans la table acteur_film
INSERT INTO acteur_film (film_id, acteur_id) VALUES 
('1', '1'), 
('2', '1'), 
('2', '2'),
('3', 2);

--Afficher tous les films Brad PTIT
#SELECT acteur.prenom, acteur.nom, film.nom FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id WHERE acteur.nom = 'PITT' AND acteur.prenom = 'Brad'


--Afficher le nombre de films par acteur
#SELECT acteur.prenom, acteur.nom, COUNT(film.nom) AS nb_films FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id GROUP BY acteur.nom

--Trouver le film qui n'a pas d'acteur
#SELECT film.nom FROM film LEFT JOIN acteur_film ON film.id = acteur_film.film_id WHERE acteur_film.acteur_id IS NULL;

--Afficher tous les film avec acteur
#SELECT film.nom AS film, acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id 

--Afficher le nombre de films par acteur en incluant TOM CRUISE
#SELECT acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom, COUNT(film.nom) AS nb_films FROM acteur LEFT JOIN acteur_film ON acteur.id = acteur_film.acteur_id LEFT JOIN film ON acteur_film.film_id= film.id GROUP BY acteur.nom

--Afficher les acteurs ayant jouer dans 2 films avec HAVING
#SELECT acteur.prenom AS acteur_prenom, acteur.nom AS acteur_nom, COUNT(film.nom) AS nb_films FROM acteur LEFT JOIN acteur_film ON acteur.id = acteur_film.acteur_id LEFT JOIN film ON acteur_film.film_id= film.id GROUP BY acteur.nom HAVING COUNT(film.nom) = 2

--Afficher la moyenne d'acteur par film 
SELECT COUNT(acteur.nom)/COUNT(DISTINCT(film.id)) AS nb_films FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id 















