--Supprimer la base 'invitation' si elle existe déja
DROP DATABASE IF EXISTS invitation;

-- Crée la base 'invitation' si elle n'existe pas déjà
CREATE DATABASE IF NOT EXISTS invitation;

-- Utilise la base 'invitation'
USE invitation;

-- Supprime la table 'inv_personne' si elle existe déjà
DROP TABLE IF EXISTS inv_personne;

-- Crée la table 'inv_personne' avec une primary key
CREATE TABLE IF NOT EXISTS inv_personne(
id INT NOT NULL AUTO_INCREMENT,
prenom VARCHAR(100) NOT NULL,
nom VARCHAR(100) NOT NULL,
age INT NOT NULL,
inscription DATE NOT NULL,
etat TINYINT NOT NULL,
statut ENUM ("membre", "non membre"),
cv TEXT NOT NULL,
salaire INT,
CONSTRAINT pk_invitations PRIMARY KEY (id)
)ENGINE=INNODB;

-- Insertion de 3 personnes avec leurs informations
INSERT INTO inv_personne (prenom, nom, age, inscription, etat, statut, cv, salaire) VALUES
('Brad', 'PITT', 60, '1970-01-01', 1, 'non membre', 'lorem ipsum', 2000000),
('George', 'CLONEY', 62, '1999-01-01', 1, 'membre', 'juste beau', 4000000),
('Jean', 'DUJARDIN', 51, '1994-01-01', 0, 'membre', 'brice de nice', 1000000);

-- Afficher le plus gros salaire
#SELECT MAX(salaire) AS PlusGrosSalaire FROM inv_personne; 

-- Afficher le plus petit salaire
#SELECT MIN(salaire) AS PlusPetitSalaire FROM inv_personne; 

-- Afficher la personne avec le plus petit salaire
#SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire ASC LIMIT 1 

-- Afficher l'acteur avec le plus gros salaire
#SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire DESC LIMIT 1 

-- Afficher le salaire moyen
#SELECT AVG(salaire) AS SalaireMoyen FROM inv_personne; ##Afficher le salaire moyen

-- Compter le nombre total de personnes
#SELECT COUNT(*) FROM inv_personne;

-- Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000
#SELECT * FROM inv_personne WHERE salaire BETWEEN '1000001' AND '3999999' 

-- Afficher le prénom en majuscules et le nom en minuscules pour Brad PITT
#SELECT UPPER(prenom) AS prenom_majuscule, LOWER(nom) AS nom_minuscule FROM inv_personne WHERE prenom = 'Brad' AND nom = 'PITT'; 

-- Sélectionner les personnes dont le prénom contient "bra"
#SELECT * FROM inv_personne WHERE prenom LIKE '%bra%' 

-- Trier les personnes par âge croissant
#SELECT * FROM inv_personne ORDER BY age ASC 

-- Compter le nombre de membres
#SELECT COUNT(*) AS nombre_membres FROM inv_personne WHERE statut = 'membre'; 

-- Afficher le nombre de personnes par statut (membre / non membre), trié par nombre décroissant
#SELECT statut, COUNT(*) AS nombre_acteurs FROM inv_personne GROUP BY statut ORDER BY nombre_acteurs DESC; 






