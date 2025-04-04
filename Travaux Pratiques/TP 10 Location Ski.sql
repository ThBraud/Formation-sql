DROP DATABASE IF EXISTS ski;
CREATE DATABASE IF NOT EXISTS ski  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ski;

DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
noCLi INT NOT NULL,
nom VARCHAR(255) NOT NULL,
prenom VARCHAR(255) NOT NULL,
adresse VARCHAR(255) NOT NULL,
cpo INT NOT NULL,
ville VARCHAR(255),
CONSTRAINT pk_commande PRIMARY KEY (NoCLi)
)ENGINE=INNODB;

DROP TABLE IF EXISTS fiches;
CREATE TABLE IF NOT EXISTS fiches (
noFic INT NOT NULL,
noCli INT NOT NULL,
dateCrea DATE NOT NULL,
datePaiement DATE NOT NULL,
adresse VARCHAR(255) NOT NULL,
etat VARCHAR(255),
CONSTRAINT pk_commande PRIMARY KEY (noFic)
)ENGINE=INNODB;

DROP TABLE IF EXISTS lignesFic;
CREATE TABLE IF NOT EXISTS lignesFic (
noFic INT NOT NULL,
NoLig INT NOT NULL,
refart CHAR (8) NOT NULL,
depart DATE NOT NULL,
retour DATE,
CONSTRAINT pk_lignesFic PRIMARY KEY (noLig, noFic)
) ENGINE = INNODB;

DROP TABLE IF EXISTS articles;
CREATE TABLE IF NOT EXISTS articles (
refart CHAR (8) NOT NULL,
designation VARCHAR (80) NOT NULL,
codeGam CHAR (5),
codeCate CHAR (5),
CONSTRAINT pk_article PRIMARY KEY (refart)
) ENGINE = INNODB;

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
codeCate CHAR (5) NOT NULL,
libelle VARCHAR(30),
CONSTRAINT pk_catégories PRIMARY KEY (codeCate)
) ENGINE = INNODB;

DROP TABLE IF EXISTS gammes;
CREATE TABLE IF NOT EXISTS gammes (
codeGam CHAR(5) NOT NULL,
libelle VARCHAR (45),
CONSTRAINT pk_ligneFic PRIMARY KEY (codeGam)
) ENGINE = INNODB;

DROP TABLE IF EXISTS grilleTarifs;
CREATE TABLE IF NOT EXISTS grilleTarifs (
codeGam CHAR (5),
codeCate CHAR (5),
codeTarif CHAR (5),
CONSTRAINT pk_grilleTarifs PRIMARY KEY (codeGAM, CodeCate)
) ENGINE = INNODB;


DROP TABLE IF EXISTS tarifs;
CREATE TABLE IF NOT EXISTS tarifs (
codeTarif CHAR (5) ,
libelle VARCHAR(255) NOT NULL,
prixJour INT NOT NULL,
CONSTRAINT pk_tarifs PRIMARY KEY (codeTarif)
)ENGINE=INNODB;


USE ski;
INSERT INTO clients (noCli, nom, prenom, adresse, cpo, ville) VALUES 
    (1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens'),
    (2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse'),
    (3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
    (4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
     (5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne'),
    (6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes'),
    (9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
    (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

INSERT INTO fiches (noFic, noCli, dateCrea, datePaiement, etat) VALUES 
    (1001, 14,  DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY),'SO' ),
    (1002, 4,  DATE_SUB(NOW(),INTERVAL  13 DAY), NULL, 'EC'),
    (1003, 1,  DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY),'SO'),
    (1004, 6,  DATE_SUB(NOW(),INTERVAL  11 DAY), NULL, 'EC'),
    (1005, 3,  DATE_SUB(NOW(),INTERVAL  10 DAY), NULL, 'EC'),
    (1006, 9,  DATE_SUB(NOW(),INTERVAL  10 DAY),NULL ,'RE'),
    (1007, 1,  DATE_SUB(NOW(),INTERVAL  3 DAY), NULL, 'EC'),
    (1008, 2,  DATE_SUB(NOW(),INTERVAL  0 DAY), NULL, 'EC');

INSERT INTO tarifs (codeTarif, libelle, prixJour) VALUES
    ('T1', 'Base', 10),
    ('T2', 'Chocolat', 15),
    ('T3', 'Bronze', 20),
    ('T4', 'Argent', 30),
    ('T5', 'Or', 50),
    ('T6', 'Platine', 90);

INSERT INTO gammes (codeGam, libelle) VALUES
    ('PR', 'Matériel Professionnel'),
    ('HG', 'Haut de gamme'),
    ('MG', 'Moyenne gamme'),
    ('EG', 'Entrée de gamme');

INSERT INTO categories (codeCate, libelle) VALUES
    ('MONO', 'Monoski'),
    ('SURF', 'Surf'),
    ('PA', 'Patinette'),
    ('FOA', 'Ski de fond alternatif'),
    ('FOP', 'Ski de fond patineur'),
    ('SA', 'Ski alpin');

INSERT INTO grilleTarifs (codeGam, codeCate, codeTarif) VALUES
    ('EG', 'MONO', 'T1'),
    ('MG', 'MONO', 'T2'),
    ('EG', 'SURF', 'T1'),
    ('MG', 'SURF', 'T2'),
    ('HG', 'SURF', 'T3'),
    ('PR', 'SURF', 'T5'),
    ('EG', 'PA', 'T1'),
    ('MG', 'PA', 'T2'),
    ('EG', 'FOA', 'T1'),
    ('MG', 'FOA', 'T2'),
    ('HG', 'FOA', 'T4'),
    ('PR', 'FOA', 'T6'),
    ('EG', 'FOP', 'T2'),
    ('MG', 'FOP', 'T3'),
    ('HG', 'FOP', 'T4'),
    ('PR', 'FOP', 'T6'),
    ('EG', 'SA', 'T1'),
    ('MG', 'SA', 'T2'),
    ('HG', 'SA', 'T4'),
    ('PR', 'SA', 'T6');

INSERT INTO articles (refart, designation, codeGam, codeCate) VALUES 
    ('F01', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F02', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F03', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F04', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F05', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
    ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
    ('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
    ('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('S01', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S02', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S03', 'Décathlon Apparition', 'EG', 'SURF'),
    ('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

INSERT INTO lignesFic (noFic, noLig,  refart, depart, retour) VALUES 
    (1001, 1, 'F05', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1001, 2, 'F50', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  14 DAY)),
    (1001, 3, 'F60', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1002, 1, 'A03', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1002, 2, 'A04', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  7 DAY)),
    (1002, 3, 'S03', DATE_SUB(NOW(),INTERVAL  8 DAY), NULL),
    (1003, 1, 'F50', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1003, 2, 'F05', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1004, 1, 'P01', DATE_SUB(NOW(),INTERVAL  6 DAY), NULL),
    (1005, 1, 'F05', DATE_SUB(NOW(),INTERVAL  9 DAY), DATE_SUB(NOW(),INTERVAL  5 DAY)),
    (1005, 2, 'F10', DATE_SUB(NOW(),INTERVAL  4 DAY), NULL),
    (1006, 1, 'S01', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 2, 'S02', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 3, 'S03', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1007, 1, 'F50', DATE_SUB(NOW(),INTERVAL  3 DAY), DATE_SUB(NOW(),INTERVAL  2 DAY)),
    (1007, 3, 'F60', DATE_SUB(NOW(),INTERVAL  1 DAY), NULL),
    (1007, 2, 'F05', DATE_SUB(NOW(),INTERVAL  3 DAY), NULL),
    (1007, 4, 'S02', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL),
    (1008, 1, 'S01', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);
    
    #SELECT * FROM clients WHERE nom LIKE 'D%'; ## Liste des clients (toutes les informations) dont le nom commence par un D
    #SELECT clients.nom AS nom, clients.prenom AS prenom FROM clients ## Nom et prénom de tous les clients
    #SELECT clients.nom AS nom, clients.prenom AS prenom, fiches.etat AS etat, fiches.noFic AS NoFic FROM fiches LEFT JOIN clients ON fiches.noCli = clients.noCli WHERE cpo LIKE '44%' ## Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
    
    #Détail de la fiche n°1002
    #SELECT fiches.noFic, clients.nom AS nom , clients.prenom AS prenom, articles.refart AS refart, articles.designation AS designation, lignesFic.depart AS depart, lignesFic.retour AS retour, tarifs.prixJour AS prixJour, (DATEDIFF(lignesFic.retour, lignesFic.depart)*tarifs.prixJour) AS montant FROM tarifs  
#LEFT JOIN grilleTarifs ON tarifs.codeTarif = grilleTarifs.codeTarif
#LEFT JOIN categories ON grilleTarifs.codeCate = categories.codeCate  
#LEFT JOIN articles ON categories.codeCate = articles.codeCate  
#LEFT JOIN lignesFic ON articles.refart = lignesFic.refart  
#LEFT JOIN fiches ON lignesFic.noFic = fiches.noFic  
#LEFT JOIN clients ON fiches.noCli = clients.noCli WHERE fiches.noFic = 1002 GROUP BY refart
  
  #SELECT gammes.libelle AS Gamme, AVG(tarifs.prixJour) AS 'tarif journalier moyen' FROM tarifs INNER JOIN grilleTarifs ON tarifs.codeTarif = grilleTarifs.codeTarif INNER JOIN gammes ON grilleTarifs.codeGam = gammes.codeGam GROUP BY gammes.libelle ## Prix journalier moyen de location par gamme
  
  ##Détail de la fiche n°1002 avec le total
#SELECT fiches.noFic, clients.nom AS nom , clients.prenom AS prenom, articles.refart AS refart, articles.designation AS designation, lignesFic.depart AS depart, lignesFic.retour AS retour, tarifs.prixJour AS prixJour, (DATEDIFF(lignesFic.retour, lignesFic.depart)*tarifs.prixJour) AS montant, SUM( (DATEDIFF(IFNULL(retour, NOW()+1), depart) + 1) * prixJour) AS total FROM tarifs  
#LEFT JOIN grilleTarifs ON tarifs.codeTarif = grilleTarifs.codeTarif
#LEFT JOIN categories ON grilleTarifs.codeCate = categories.codeCate  
#LEFT JOIN articles ON categories.codeCate = articles.codeCate  
#LEFT JOIN lignesFic ON articles.refart = lignesFic.refart  
#LEFT JOIN fiches ON lignesFic.noFic = fiches.noFic  
#LEFT JOIN clients ON fiches.noCli = clients.noCli WHERE fiches.noFic = 1002 GROUP BY refart 

  
  
  
#SELECT categories.libelle AS categories, gammes.libelle AS Gamme, tarifs.libelle AS libelle, tarifs.prixJour AS prixJour FROM tarifs INNER JOIN grilleTarifs ON tarifs.codeTarif = grilleTarifs.codeTarif INNER JOIN gammes ON grilleTarifs.codeGam = gammes.codeGam INNER JOIN categories ON grilleTarifs.codeCate = categories.codeCate  ##Grille des tarifs

#SELECT articles.refart AS refart, articles.designation AS designation, COUNT(lignesFic.refart) AS nombre_de_locations FROM categories INNER JOIN articles ON categories.codeCate = articles.codeCate LEFT JOIN lignesFic ON articles.refart = lignesFic.refart WHERE categories.codeCate = 'SURF' GROUP BY articles.refart;  ##Liste des locations de la catégorie SURF
#Calcul du nombre moyen d’articles loués par fiche de location (fait avec de l'aide)
#SELECT AVG(subquery.nbLig) AS "Moyenne Article Loués" FROM (SELECT lF.noFic AS NumeroFiche, COUNT(lF.noLig) AS nbLig FROM lignesFic lF GROUP BY lF.noFic ) AS subquery;

#SELECT categories.libelle AS categories, COUNT(lignesFic.noLig) AS 'nombre de location' FROM categories LEFT JOIN articles ON categories.codeCate = articles.codeCate LEFT JOIN lignesFic ON articles.refart = lignesFic.refart WHERE categories.libelle IN ('SURF','Patinette','Ski alpin') GROUP BY categories.libelle  ##Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette


##SELECT avg(MontantParFiche) FROM (SELECT noFic, SUM((DATEDIFF(IFNULL(retour, NOW()+1),depart)+1)*prixJour) MontantParfiche FROM lignesfic l INNER JOIN articles a USING (refart) INNER JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate) INNER JOIN tarifs t USING (codeTarif) GROUP BY noFic) info ;  ## Calcul du montant moyen des fiches de location (Correction)









  