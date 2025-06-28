DROP DATABASE IF EXISTS Ecommerce;
CREATE DATABASE IF NOT EXISTS Ecommerce  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE Ecommerce;


DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR (255),
prenom VARCHAR (255),
CONSTRAINT pk_client PRIMARY KEY (id)
)ENGINE=INNODB;


DROP TABLE IF EXISTS commande ;
CREATE TABLE IF NOT EXISTS commande (
id INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL,
date_achat VARCHAR(255),
nombre INT NOT NULL,
client_id INT NOT NULL,
CONSTRAINT pk_commande PRIMARY KEY (id)
)ENGINE=INNODB;

DROP TABLE IF EXISTS article ;
CREATE TABLE IF NOT EXISTS article (
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR (255),
 prix FLOAT NOT NULL,
 commande_id INT NOT NULL,
 CONSTRAINT pk_article PRIMARY KEY (id)
)ENGINE=INNODB;




INSERT INTO article (nom,prix,commande_id) VALUES
('XBox',350.00,1),
('Machine à café',300.00,2),
('PlayStation 3', 100.00,3),
('PlayStation 5', 400.00,4);

INSERT INTO clients (nom,prenom) VALUES
('Brad','PITT'),
('George', 'Cloney'),
('Jean', 'Dujardin');

INSERT INTO commande (date_achat, nombre, total, client_id) VALUES
('2024-09-08 10:15:00',1, 350,1),
('2024-09-08 10:15:00',1,300,1),
('2024-09-08 10:15:00',2,200,1);

##Afficher la commande de Brad PITT (sans les totaux)
SELECT clients.nom AS Nom, clients.prenom AS Prenom, commande.date_achat AS date_achat, article.nom AS Nom, article.prix AS Prix, commande.nombre AS nombre, commande.total AS total FROM commande  INNER JOIN clients ON commande.client_id = clients.id  INNER JOIN article ON commande.id = article.commande_id;  
 
##Afficher la commande de Brad PITT (les totaux)
SELECT SUM(commande.total) AS total_ht, (SUM(commande.total)*0.2) AS total_tva, ((SUM(commande.total)) + (SUM(commande.total)*0.2)) AS total_ttc FROM commande