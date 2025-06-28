DROP DATABASE IF EXISTS invitation;
CREATE DATABASE IF NOT EXISTS invitation;
USE invitation;
DROP TABLE IF EXISTS inv_personne;
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

INSERT INTO inv_personne (prenom, nom, age, inscription, etat, statut, cv, salaire) VALUES
('Brad', 'PITT', 60, '1970-01-01', 1, 'non membre', 'lorem ipsum', 2000000),
('George', 'CLONEY', 62, '1999-01-01', 1, 'membre', 'juste beau', 4000000),
('Jean', 'DUJARDIN', 51, '1994-01-01', 0, 'membre', 'brice de nice', 1000000);

##SELECT MAX(salaire) AS PlusGrosSalaire FROM inv_personne; ##Afficher le plus gros salaire
##SELECT MIN(salaire) AS PlusPetitSalaire FROM inv_personne; ##Afficher le plus petit salaire
##SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire ASC LIMIT 1 ##Acteur avec le plus petit salaire
##SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire DESC LIMIT 1 ##Acteur avec le plus gros salaire
##SELECT AVG(salaire) AS SalaireMoyen FROM inv_personne; ##Afficher le salaire moyen
##SELECT COUNT(*) FROM inv_personne;
##SELECT * FROM inv_personne WHERE salaire BETWEEN '1000001' AND '3999999' ##Afficher Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000
##SELECT UPPER(prenom) AS prenom_majuscule, LOWER(nom) AS nom_minuscule FROM inv_personne WHERE prenom = 'Brad' AND nom = 'PITT'; 
##SELECT * FROM inv_personne WHERE prenom LIKE '%bra%' ##Selectionner les personnes avec "bra"
##SELECT * FROM inv_personne ORDER BY age ASC ##Trier les personnes par age 
##SELECT COUNT(*) AS nombre_membres FROM inv_personne WHERE statut = 'membre'; ##Afficher le nombre d'acteurs "membre"
SELECT statut, COUNT(*) AS nombre_acteurs FROM inv_personne GROUP BY statut ORDER BY nombre_acteurs DESC; ##Afficher le nombre des membres et d'acteur "non membre"






