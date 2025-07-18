--Supprimer la base de données si elle est existe 
DROP DATABASE IF EXISTS my_crm;

--Création de la base de données si elle n'existe pas avec utf8mb4 qui stocke tous les caractères unicodes comme les émojis.
--Mais aussi avec utf8mb4_unicode_ci qui est insensible à la casse 
CREATE DATABASE my_crm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--Utiliser la base donnes my_crm
USE my_crm;

--Création de la table client avec une primary key
CREATE TABLE client (
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR(255) NOT NULL,
 CONSTRAINT pk_client PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table client avec une primary key
CREATE TABLE projet(
 id INT NOT NULL AUTO_INCREMENT,
 client_id INT NOT NULL,
 nom VARCHAR(255) NOT NULL,
 CONSTRAINT pk_projet PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table devis avec une primary key
CREATE TABLE devis(
 id INT NOT NULL AUTO_INCREMENT,
 version INT NOT NULL,
 reference VARCHAR(10) NOT NULL,
 prix FLOAT NOT NULL,
 projet_id INT NOT NULL,
 CONSTRAINT pk_devis PRIMARY KEY (id)
)ENGINE=INNODB;

--Création de la table facture avec une primary key
CREATE TABLE facture(
 id INT NOT NULL AUTO_INCREMENT,
 reference VARCHAR(10) NOT NULL,
 info VARCHAR(255) NOT NULL,
 total FLOAT NOT NULL,
 date_crea DATE NOT NULL,
 date_paiement DATE NULL,
 devis_id INT NOT NULL,
 CONSTRAINT pk_facture PRIMARY KEY (id)
)ENGINE=INNODB;


--Ajouter des clés étrangères pour structurer la liason entre les tables

-- fk_client dans table projet
ALTER TABLE projet 
ADD CONSTRAINT fk_client 
FOREIGN KEY projet(client_id) 
REFERENCES client(id);

-- fk_projet dans table devis
ALTER TABLE devis 
ADD CONSTRAINT fk_projets 
FOREIGN KEY devis(projet_id) 
REFERENCES projet(id);

-- fk_devis dans table facture
ALTER TABLE facture 
ADD CONSTRAINT fk_devis 
FOREIGN KEY facture(devis_id) 
REFERENCES devis(id);

--Insertion des données dans la table client
INSERT INTO client (nom) VALUES 
	('Mairie de Rennes'),
	('Neo Soft'),
	('Sopra'),
	('Accenture'),
	('Amazon');

--Insertion des données dans la table projet
INSERT INTO projet (nom, client_id) VALUES
	('Création de site internet', 1),
	('Logiciel CRM', 2),
	('Logiciel de devis', 3),
	('Site internet e-commerce', 4),
	('Logiciel ERP', 2),
	('Logiciel gestion de stock',5);

--Insertion des données dans la table devis
INSERT INTO devis (version,reference, prix, projet_id) VALUES
	('1','DEV2100A', 3000, 1),
	('2','DEV2100B', 5000, 1),
	('1','DEV2100C', 5000, 2),
	('1','DEV2100D', 3000, 3),
	('1','DEV2100E', 5000, 4),
	('1','DEV2100F', 2000, 5),
	('1','DEV2100G', 1000, 6);
	
--Insertion des données dans la table facture
INSERT INTO facture (reference,info,total,devis_id,date_crea,date_paiement)	
    VALUES
	('FA001', 'site internet partie 1', 1500, 1, '2023-09-01','2023-10-01'),
	('FA002', 'site internet partie 2', 1500, 1, '2023-09-20',null),
	('FA003', 'logiciel CRM', 5000, 3, '2024-02-01',null),
	('FA004', 'logiciel devis', 3000, 4, '2024-03-03','2024-04-03'),
	('FA005', 'site ecommerce', 5000, 5, '2023-03-01',null),
	('FA006', 'logiciel ERP', 2000, 6, '2023-03-01',null);
    
--Afficher toutes les factures avec le nom des clients
#SELECT facture.reference AS ref, client.nom AS client, facture.info AS info, facture.total AS total, facture.date_crea AS date, facture.date_paiement AS paiement FROM facture INNER JOIN devis ON facture.devis_id = devis.id INNER JOIN projet ON devis.projet_id = projet.id INNER JOIN client ON projet.client_id = client.id;

--Afficher le nombre de factures par client
#SELECT c.nom AS client, COUNT(f.id) AS nombre_factures FROM client c LEFT JOIN projet p ON c.id = p.client_id LEFT JOIN devis d ON p.id = d.projet_id LEFT JOIN facture f ON d.id = f.devis_id GROUP BY c.id;

--Afficher chiffres d'affaires par client avec un RIGHT Join et une autre requête avec une LEFT JOINT
#SELECT COALESCE(Sum(facture.total),0) AS CA_ParClient, client.nom AS client_nom FROM facture RIGHT JOIN devis ON facture.devis_id = devis.id RIGHT JOIN projet ON devis.projet_id = projet.id RIGHT JOIN client ON projet.client_id = client.id GROUP BY client.id
#SELECT COALESCE(SUM(facture.total),0) AS CA_ParCLient, client.nom AS client_nom FROM client LEFT JOIN projet ON client.id = projet.client_id LEFT JOIN devis ON projet.id = devis.projet_id LEFT JOIN facture ON devis.id = facture.devis_id GROUP BY client.id

--Afficher le CA total
#SELECT COALESCE(SUM(facture.total),0) AS CA_Total FROM client LEFT JOIN projet ON client.id = projet.client_id LEFT JOIN devis ON projet.id = devis.projet_id LEFT JOIN facture ON devis.id = facture.devis_id 



--Afficher la somme des factures en attente de paiement
#SELECT COALESCE(SUM(facture.total),0) AS CA_Total FROM client LEFT JOIN projet ON client.id = projet.client_id LEFT JOIN devis ON projet.id = devis.projet_id LEFT JOIN facture ON devis.id = facture.devis_id WHERE date_paiement is NULL

--Afficher les factures en retard de paiment
#SELECT facture.reference AS facture, facture.date_crea AS nb_jour, DATEDIFF(NOW(), facture.date_crea)-30 AS jours_de_retard FROM facture JOIN devis ON facture.devis_id = devis.id JOIN projet ON devis.projet_id = projet.id JOIN client ON projet.client_id = client.id  WHERE facture.date_paiement IS NULL


--Afficher les factures en retard de paiment avec le nom du client
#SELECT facture.reference AS facture,DATEDIFF(NOW(), facture.date_crea)-30 AS jours_de_retard, client.nom AS Nom_Client FROM facture JOIN devis ON facture.devis_id = devis.id JOIN projet ON devis.projet_id = projet.id JOIN client ON projet.client_id = client.id  WHERE facture.date_paiement IS NULL


--Ajouter une pénalité de 2 euros par jours de retard
#SELECT facture.reference AS facture,DATEDIFF(NOW(), facture.date_crea)-30 AS jours_de_retard, client.nom AS Nom_Client, (DATEDIFF(NOW(), facture.date_crea)-30 )*2 AS Penalite FROM facture INNER JOIN devis ON facture.devis_id = devis.id INNER JOIN projet ON devis.projet_id = projet.id iNNER JOIN client ON projet.client_id = client.id  WHERE facture.date_paiement IS NULL

--Afficher la Moyenne du CA par client facturé (Ceux qui n’ont pas encore généré de facture sont ignorés)
#SELECT sum(facture.total)/count(DISTINCT client.nom) as moyenne_ca_client from client INNER JOIN projet on client.id = projet.client_id INNER JOIN devis on projet.id = devis.projet_id INNER JOIN facture on devis.id = facture.devis_id

--Moyenne du CA par client au total, même ceux qui n'ont rien facturé
#SELECT sum(facture.total)/count(DISTINCT client.nom) as moyenne_ca_client from client LEFT JOIN projet on client.id = projet.client_id LEFT JOIN devis on projet.id = devis.projet_id LEFT JOIN facture on devis.id = facture.devis_id
