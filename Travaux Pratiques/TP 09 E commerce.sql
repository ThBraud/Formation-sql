--Supprimer la base de données si elle existe
DROP DATABASE IF EXISTS Ecommerce;

--Création de la base de données si elle n'existe pas avec utf8mb4 qui stocke tous les caractères unicodes comme les émojis.
--Mais aussi avec utf8mb4_unicode_ci qui est insensible à la casse 
CREATE DATABASE IF NOT EXISTS Ecommerce  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--Utiliser la base de données Ecommerce
USE Ecommerce;

--Création de la table clients avec une primary key
DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255),
prenom VARCHAR (255),
CONSTRAINT pk_client PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table commande avec une primary key
DROP TABLE IF EXISTS commande ;
CREATE TABLE IF NOT EXISTS commande (
id INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL,
date_achat VARCHAR(255),
nombre INT NOT NULL,
client_id INT NOT NULL,
CONSTRAINT pk_commande PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table article avec une primary key
DROP TABLE IF EXISTS article ;
CREATE TABLE IF NOT EXISTS article (
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR (255),
 prix FLOAT NOT NULL,
 commande_id INT NOT NULL,
 CONSTRAINT pk_article PRIMARY KEY (id)
)ENGINE=INNODB;

--Insertion des données dans la table article
INSERT INTO article (nom,prix,commande_id) VALUES
('XBox',350.00,1),
('Machine à café',300.00,2),
('PlayStation 3', 100.00,3),
('PlayStation 5', 400.00,4);

--Insertion des données dans la table clients
INSERT INTO clients (nom,prenom) VALUES
('Brad','PITT'),
('George', 'Cloney'),
('Jean', 'Dujardin');

--Insertion des données dans la table commande
INSERT INTO commande (date_achat, nombre, total, client_id) VALUES
('2024-09-08 10:15:00',1, 350,1),
('2024-09-08 10:15:00',1,300,1),
('2024-09-08 10:15:00',2,200,1);

--Afficher la commande de Brad PITT (sans les totaux)
SELECT clients.nom AS Nom, clients.prenom AS Prenom, commande.date_achat AS date_achat, article.nom AS Nom, article.prix AS Prix, commande.nombre AS nombre, commande.total AS total FROM commande  INNER JOIN clients ON commande.client_id = clients.id  INNER JOIN article ON commande.id = article.commande_id;  
 
--Afficher la commande de Brad PITT (les totaux)
SELECT SUM(commande.total) AS total_ht, (SUM(commande.total)*0.2) AS total_tva, ((SUM(commande.total)) + (SUM(commande.total)*0.2)) AS total_ttc FROM commande