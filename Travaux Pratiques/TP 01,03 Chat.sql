
-- Supprime la base zoo si elle existe déjà
DROP DATABASE IF EXISTS zoo;

--Création de la base de données si elle n'existe pas avec utf8mb4 qui stocke tous les caractères unicodes comme les émojis.
--Mais aussi avec utf8mb4_unicode_ci qui est insensible à la casse 
CREATE DATABASE IF NOT EXISTS zoo
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Sélectionne la base zoo
USE zoo;

-- Supprime la table Chat si elle existe
DROP TABLE IF EXISTS Chat;

-- Crée la table Chat avec id, nom, yeux et âge
CREATE TABLE IF NOT EXISTS Chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
yeux VARCHAR(20) NOT NULL,
age TINYINT NOT NULL,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

-- Insère des données dans la table Chat
INSERT INTO Chat (nom,yeux,age) VALUES
('Maine coon','Marron','20'),
('Siamois','Bleu','15'),
('Bengal','Marron','18'),
('Scottish Fold','Marron','10');

-- Sélectionne le chat avec l'ID = 2
#SELECT * FROM Chat WHERE ID = 2;

 -- Trie les chats par nom, puis par âge décroissant
#SELECT * FROM Chat ORDER BY nom, age DESC;

-- Sélectionne les chats dont l'âge est entre 11 et 19
#SELECT * FROM Chat WHERE age BETWEEN '11' AND '19'; 

-- Sélectionne les chats dont le nom contient "sia"
#SELECT * FROM Chat WHERE nom LIKE '%sia%' ##Selectionner les chats avec "sia";

-- Sélectionne les chats dont le nom contient la lettre "a"
#SELECT * FROM Chat WHERE nom LIKE '%a%';

-- Calcule l'âge moyen des chats
#SELECT AVG(age) AS AverageAge FROM Chat;

-- Compte le nombre total de chats
#SELECT COUNT(*) FROM Chat;  

-- Compte le nombre de chats aux yeux marron
#SELECT COUNT(*) FROM Chat WHERE yeux = 'Marron'; 

-- Affiche le chat le plus jeune
#SELECT * FROM Chat ORDER BY age LIMIT 1;

-- Affiche le chat le plus vieux
#SELECT * FROM Chat ORDER BY age DESC LIMIT 1;

-- Regroupe les chats par couleur des yeux et compte le nombre par groupe
#SELECT yeux, COUNT(*) AS nombre_de_chats FROM Chat GROUP BY yeux;
