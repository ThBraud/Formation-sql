DROP DATABASE IF EXISTS spa;
CREATE DATABASE IF NOT EXISTS spa
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE spa;
DROP TABLE IF EXISTS Chat;
CREATE TABLE IF NOT EXISTS Chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
age TINYINT NOT NULL,
couleur_id TINYINT ,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

USE spa;
DROP TABLE IF EXISTS couleur;
CREATE TABLE IF NOT EXISTS couleur(
id INT NOT NULL AUTO_INCREMENT,
yeux VARCHAR(50) NOT NULL,
CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=INNODB; 


INSERT INTO Chat (nom,age,couleur_id) VALUES
('Maine coon','20','1'),
('Siamois','15','2'),
('Bengal','18','1'),
('Scottish Fold','10','1'),
('Domestique','21',null);

INSERT INTO couleur (yeux) Values
('marron'),
('bleu'),
('vert');


#SELECT Chat.id, Chat.nom, couleur.yeux, Chat.age FROM Chat INNER JOIN couleur ON Chat.couleur_id = couleur.id; ##Afficher les chats avec les couleurs des yeux avec INNER JOIN
#SELECT Chat.id, Chat.nom, couleur.yeux, Chat.age FROM Chat LEFT JOIN couleur ON Chat.couleur_id = couleur.id; ##Afficher les chats avec les couleurs des yeux avec le chat domestique avec LEFT JOIN
#SELECT * FROM Chat WHERE couleur_id is null ##Afficher le chat qui n'a pas de couleur des yeux


#SELECT couleur.yeux AS couleur, COUNT(Chat.id) AS nombre_de_chats FROM Chat INNER JOIN couleur ON Chat.couleur_id = couleur.id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC; ##Afficher le nombre de chats par couleur des yeux sans la couleur verte = 0
#SELECT couleur.yeux AS couleur, COUNT(Chat.id) AS nombre_de_chats FROM Chat RIGHT JOIN couleur ON Chat.couleur_id = couleur.id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC; ##Afficher le nombre de chats par couleur des yeux avec la couleur "vert"
#SELECT COUNT(Chat.id) AS nombre_de_chats FROM Chat RIGHT JOIN couleur ON Chat.couleur_id = couleur_id GROUP BY couleur.yeux ORDER BY nombre_de_chats DESC, AVG (nombre_de_chats); AS couleuryeux
SELECT COUNT(Chat.id)/COUNT(DISTINCT couleur.id) as moyenne FROM couleur LEFT JOIN Chat on couleur.id = Chat.couleur_id