# 📦 Base de données

#### Créer une base de données :

Sans condition :


- ```sql
  CREATE DATABASE nom_base;
  ```

Avec condition : 

- ```sql
  CREATE DATABASE IF NOT EXISTS nom_base;
  ```

#### Supprimer une base de données

Sans condition : 

- ```sql
  DROP DATABASE nom_base;
  ```

Avec condition :  

- ```sql
  DROP DATABASE IF EXISTS nom_base;
  ```

#### Sélectionner une base de données

- ```sql
  USE nom_base
  ```

#### Exemple d’une base de données

```sql
DROP DATABASE IF EXISTS zoo;
CREATE DATABASE IF NOT EXISTS zoo
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoo;
```

*💡 On ajoute `CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;` pour avoir les accents, les émojis  et tous les autres caractères Unicode*

# 📋 Tables

#### Créer une table :

Sans condition : 

- ```sql
  CREATE TABLE nom_table (noms_des_valeurs);
  ```

Avec conditions : 

- ```sql
  CREATE TABLE IF NOT EXIST nom_table (noms_des_valeurs);
  ```

#### Supprimer une table :

Sans condition :

- ```sql
  DROP TABLE nom_table;
  ```

Avec condition : 

- ```sql
  DROP TABLE IF EXISTS nom_table;
  ```

#### Exemple de Table :

```sql
DROP TABLE IF EXISTS Chat;
CREATE TABLE IF NOT EXISTS Chat(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
yeux VARCHAR(20) NOT NULL,
age TINYINT NOT NULL,
CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;
```

💡 *On défini pendant la création de la table les types des valeurs . Pour plus d’informations sur les types aller voir le cours sur les types*

#### Ajouter une colonne :

- ```sql
  ALTER TABLE nom_table ADD colonne TYPE;
  ```

#### Modifier une colonne

- ```sql
  ALTER TABLE nom_table MODIFY colonne TYPE;
  ```

#### Supprimer une colonne

- ```sql
  ALTER TABLE nom_table DROP COLUMN colonne;
  ```

  ### Ajouter une ligne

- ```sql
  INSERT INTO nom_table (colonne1, colonne2, …) VALUES (valeur1, valeur2….);
  ```  

# 📝 Manipulations des données

#### Insérer des données

- ```sql
  INSERT INTO table (nom_des_valeurs) VALUES (’valeur1’, ‘valeur2’);
  ```

## Exemple d’insertions de données

```sql
INSERT INTO Chat (nom,yeux,age) VALUES
('Maine coon','Marron','20'),
('Siamois','Bleu','15'),
('Bengal','Marron','18'),
('Scottish Fold','Marron','10');
```

💡*Pour les chiffres on peut les écrire directement sans les apostrophes*

#### Modifier des données

- ```sql
  UPDATE nom_table SET colonne = ‘nouvelle_valeur’ WHERE condition;
  ```

💡*La condition WHERE dans une requête UPDATE permet de spécifier quelles lignes doivent être modifiés* 

#### Supprimer des données

- ```sql
  DELETE FROM nom_table WHERE condition;
  ```

#### Exemple de conditions dans le WHERE

- Avec une seule condition simple pour modifier une seule ligne par exemple un client spécifique :

```sql
UPDATE clients SET prenom = 'Pierre' WHERE id = 1;

```

- Avec une valeur spécifique, pour modifier plusieurs lignes,  par exemple tous les clients d'une certaine ville :

```sql
UPDATE clients SET ville = 'Paris' WHERE ville = 'Lyon';
```

*Il y a encore plusieurs conditions possibles avec de nombreux opérateurs logiques et relationnels comme `AND`, `OR` ou encore `BETWEEN`, `LIKE`, `IN`*  

⚠️ **Attention faire un UPDATE ou un DELETE sans WHERE met toute les lignes de la table à jour !**  

#### Supprimer tout les lignes d’un table

- ```sql
  TRUNCATE TABLE nom_table;
  ```

# 🔎 Lecture de données

#### Afficher toutes les données

- ```sql
  SELECT * FROM nom_table;
  ```

#### Sélectionner des colonnes spécifiques

- ```sql
  SELECT colonne1, colonne2 FROM nom_table;
  ```

#### Récupérer des valeurs uniques

- ```sql
  SELECT DISTINCT colonne FROM table;
  ```

#### Filtrer les résultats

- ```sql
  SELECT * FROM table WHERE condition;
  ```

#### Trier les résultats

- ```sql
  SELECT * FROM table ORDER BY colonne ASC/DESC;
  ```

#### Sélectionner une plage de valeurs

- ```sql
  SELECT * FROM table WHERE colonne BETWEEN valeur1 AND valeur2;
  ```

#### Vérifier si une valeur est dans une liste

- ```sql
  SELECT * FROM table WHERE colonne IN ('valeur1', 'valeur2');
  ```

#### Rechercher des motifs

- ```sql
  SELECT * FROM table WHERE colonne LIKE 'A%';
  ```

💡*La commande au dessus sélectionne toutes les lignes de la table “table” ou la colonne “colonne” commence par la lettre “A”*

*Il a quelque variantes :* 

- `LIKE '%A'` → finit par A
- `LIKE '%A%'` → contient la lettre A
- `LIKE '_A%'` → 2e lettre est A (`_` remplace un seul caractère)

#### Exemple de lecture données

```sql
SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire ASC LIMIT 1 ##Acteur avec le plus petit salaire
SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire DESC LIMIT 1 ##Acteur avec le plus gros salaire
```

# 🔧 Jointures

#### Afficher uniquement les correspondances

- ```sql
  INNER JOIN
  ```
  
💡*Le INNER n'est pas nécessaire mais on l'écrit par convention.*

#### Afficher tout de la table1 + correspondances table2

- ```sql
  LEFT JOIN
  ```

#### Afficher tout de la table2 + correspondance de table1

- ```sql
  RIGHT JOIN
  ```

#### Afficher toute les données des deux tables

- ```sql
  FULL JOIN
  ```

#### Exemples de jointure
```sql
SELECT COALESCE(SUM(facture.total),0) AS CA_ParCLient, client.nom AS client_nom FROM client LEFT JOIN projet ON client.id = projet.client_id LEFT JOIN devis ON projet.id = devis.projet_id LEFT JOIN facture ON devis.id = facture.devis_id GROUP BY client.id

SELECT acteur.prenom, acteur.nom, film.nom FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id WHERE acteur.nom = 'PITT' AND acteur.prenom = 'Brad'
```
# 📈 Fonctions

#### Nombres de ligne

- ```sql
  COUNT(colonne)
  ```

#### Somme des valeurs

- ```sql
  SUM(colonne)
  ```

#### Moyenne des valeurs

- ```sql
  AVG(colonne)
  ```

#### Valeur minimale

- ```sql
  MIN(colonne)
  ```

#### Valeur maximale

- ```sql
  MAX(colonne)
  ```

#### Grouper les résultats

- ```sql
  GROUP BY colonne
  ```

#### Filtrer après un GROUP BY

- ```sql
  HAVING condition
  ```

# Index  

#### Créer un index

- ```sql
  CREATE INDEX idx_nom_colonne ON table (colonne);
  ```  

#### Créer un index unique  

- ```sql
  CREATE UNIQUE INDEX idx_unique ON table (colonne);
  ```

#### Vérifier l'existence d'un index  

- ```sql
  EXPLAIN SELECT * FROM table WHERE colonne = 'valeur';
  ```  

#### Supprimer un index  

- ```sql
  DROP INDEX idx_nom_colonne ON table;
  ```  