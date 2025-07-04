-- Supprimer la base de données si elle existe
DROP DATABASE IF EXISTS spa;

-- Créer la base avec encodage UTF8 (très bon choix pour les caractères accentués)
CREATE DATABASE IF NOT EXISTS spa
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utiliser cette base
USE spa;

-- Supprimer la table Chat si elle existe déjà
DROP TABLE IF EXISTS Chat;

-- Créer la table des chats
CREATE TABLE IF NOT EXISTS Chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
age TINYINT NOT NULL,
couleur_id TINYINT ,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

-- Supprimer la table couleur si elle existe
DROP TABLE IF EXISTS couleur;

-- Créer la table des couleurs des yeux
CREATE TABLE IF NOT EXISTS couleur(
id INT NOT NULL AUTO_INCREMENT,
yeux VARCHAR(50) NOT NULL,
CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=INNODB; 

-- Insère des données dans la table Chat
INSERT INTO Chat (nom,age,couleur_id) VALUES
('Maine coon','20','1'),
('Siamois','15','2'),
('Bengal','18','1'),
('Scottish Fold','10','1'),
('Domestique','21',null);

-- Insère les différentes couleurs d’yeux dans la table 'couleur'
INSERT INTO couleur (yeux) Values
('marron'),
('bleu'),
('vert');


-- Afficher les chats avec leur couleur d’yeux (INNER JOIN : uniquement les chats qui ont une couleur renseignée)
#SELECT Chat.id, Chat.nom, couleur.yeux, Chat.age FROM Chat INNER JOIN couleur ON Chat.couleur_id = couleur.id; #

-- Afficher tous les chats, même ceux sans couleur d’yeux
#SELECT Chat.id, Chat.nom, couleur.yeux, Chat.age FROM Chat LEFT JOIN couleur ON Chat.couleur_id = couleur.id; 


-- Afficher uniquement les chats qui n’ont pas de couleur d’yeux
#SELECT * FROM Chat WHERE couleur_id is null

-- Afficher le nombre de chats pour chaque couleur d’yeux (seulement celles utilisées)
#SELECT couleur.yeux AS couleur, COUNT(Chat.id) AS nombre_de_chats FROM Chat INNER JOIN couleur ON Chat.couleur_id = couleur.id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC; 

-- Afficher le nombre de chats pour chaque couleur d’yeux, y compris celles non utilisées (ex : "vert")
#SELECT couleur.yeux AS couleur, COUNT(Chat.id) AS nombre_de_chats FROM Chat RIGHT JOIN couleur ON Chat.couleur_id = couleur.id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC; 

--Afficher le nombre de chats par couleur d’yeux, y compris les couleurs sans chats, triés par nombre décroissant.
#SELECT COUNT(Chat.id) AS nombre_de_chats FROM Chat RIGHT JOIN couleur ON Chat.couleur_id = couleur_id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC, AVG (nombre_de_chats); AS couleuryeux

-- Moyenne du nombre de chats par couleur (sur toutes les couleurs existantes, même non utilisées)
#SELECT COUNT(Chat.id)/COUNT(DISTINCT couleur.id) as moyenne FROM couleur LEFT JOIN Chat on couleur.id = Chat.couleur_id