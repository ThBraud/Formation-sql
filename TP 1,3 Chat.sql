DROP DATABASE IF EXISTS zoo;
CREATE DATABASE IF NOT EXISTS zoo
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoo;
DROP TABLE IF EXISTS Chat;
CREATE TABLE IF NOT EXISTS Chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
yeux VARCHAR(20) NOT NULL,
age TINYINT NOT NULL,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

INSERT INTO Chat (nom,yeux,age) VALUES
('Maine coon','Marron','20'),
('Siamois','Bleu','15'),
('Bengal','Marron','18'),
('Scottish Fold','Marron','10');

##SELECT * FROM Chat WHERE ID = 2;    ##Selectionner le chat avec ID =2
##SELECT * FROM Chat ORDER BY nom, age DESC    ##Trier les chats par non et age 
##SELECT * FROM Chat WHERE age BETWEEN '11' AND '19'  ##Selectionner les chats qui vivient entre 11 et 19
##SELECT * FROM Chat WHERE nom LIKE '%sia%' ##Selectionner les chats avec "sia"
##SELECT * FROM Chat WHERE nom LIKE '%a%' ##Selectionner les chats avec la lettre a 
##SELECT AVG(age) AS AverageAge FROM Chat; ##Moyenne d'age des chats

##SELECT COUNT(*) FROM Chat;  ##Nombre de chats
##SELECT COUNT(*) FROM Chat WHERE yeux = 'Marron'; ##Compter le nombre de chat marron
##SELECT * FROM Chat ORDER BY age LIMIT 1 ## Afficher le chat avec la plus petite durée de vie
##SELECT * FROM Chat ORDER BY age DESC LIMIT 1  ##Afficher le chat avec la durée de vie la plus longue
##SELECT yeux, COUNT(*) AS nombre_de_chats FROM Chat GROUP BY yeux;
