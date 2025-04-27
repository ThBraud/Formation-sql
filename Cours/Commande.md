# Base de données

### Créer une base de données :

Sans condition :


- `CREATE DATABASE nom_base`;

Avec condition : 

- ```sql
  CREATE DATABASE IF NOT EXISTS nom_base;
  ```

### Supprimer une base de données

Sans condition : 

- ```sql
  DROP DATABASE nom_base;
  ```

Avec condition :  

- ```sql
  DROP DATABASE IF EXISTS nom_base;
  ```

### Sélectionner une base de données

- `USE nom_base`

### Exemple d’une base de données

```sql
DROP DATABASE IF EXISTS zoo;
CREATE DATABASE IF NOT EXISTS zoo
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoo;
```

*💡 On ajoute `CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;` pour avoir les accents, les émojis  et tous les autres caractères Unicode*

# Tables

### Créer une table :

Sans condition : 

- `CREATE TABLE nom_table (noms_des_valeurs);`

Avec conditions : 

- `CREATE TABLE IF NOT EXIST nom_table (noms_des_valeurs);`

### Supprimer une table :

Sans condition :

- `DROP TABLE nom_table;`

Avec condition : 

- `DROP TABLE IF EXISTS nom_table;`

### Exemple de Table :

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

### Ajouter une colonne :

- `ALTER TABLE nom_table ADD colonne TYPE;`

### Modifier une colonne

- `ALTER TABLE nom_table MODIFY colonne TYPE;`

### Supprimer une colonne

- `ALTER TABLE nom_table DROP colonne;`

# Manipulations des données

### Insérer des données

- `INSERT INTO table (nom_des_valeurs) VALUES (’valeur1’, ‘valeur2’);`

## Exemple d’insertions de données

```sql
INSERT INTO Chat (nom,yeux,age) VALUES
('Maine coon','Marron','20'),
('Siamois','Bleu','15'),
('Bengal','Marron','18'),
('Scottish Fold','Marron','10');
```

💡*Pour les chiffres on peut les écrire directement sans les apostrophes*

### Modifier des données

- `UPDATE nom_table SET colonne = ‘nouvelle_valeur’ WHERE condition;`

💡*La condition WHERE dans une requête UPDATE permet de spécifier quelles lignes doivent être modifiés* 

### Supprimer des données

- `DELETE FROM nom_table WHERE condition`

### Exemple de conditions dans le WHERE

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

### Supprimer tout les lignes d’un table

- `TRUNCATE TABLE nom_table`

# Lecture de données

### Afficher toutes les données

- `SELECT * FROM nom_table;`

### Sélectionner des colonnes spécifiques

- `SELECT colonne1, colonne 2 FROM nom_table;`

### Supprimer les doublons

- `SELECT * DISTINCT table WHERE condition;`

### Filtrer les résultats

- `SELECT * FROM table WHERE condition`;

### Trier les résultats

- `SELECT * FROM table ORDER BY colonne ASC/DESC;`

### Exemple de lecture données

```sql
SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire ASC LIMIT 1 ##Acteur avec le plus petit salaire
SELECT nom, prenom, salaire FROM inv_personne ORDER BY salaire DESC LIMIT 1 ##Acteur avec le plus gros salaire
```

# Jointures

### Afficher uniquement les correspondances

- `INNER JOIN`
  
💡*Le INNER n'est pas nécessaire mais on l'écrit par convention.*

### Afficher tout de la table1 + correspondances table2

- `LEFT JOIN`

### Afficher tout de la table2 + correspondance de table1

- `RIGHT JOIN`

### Afficher toute les données des deux tables

- `FULL JOIN`

### Exemples de jointure
```sql
SELECT COALESCE(SUM(facture.total),0) AS CA_ParCLient, client.nom AS client_nom FROM client LEFT JOIN projet ON client.id = projet.client_id LEFT JOIN devis ON projet.id = devis.projet_id LEFT JOIN facture ON devis.id = facture.devis_id GROUP BY client.id

SELECT acteur.prenom, acteur.nom, film.nom FROM acteur INNER JOIN acteur_film ON acteur.id = acteur_film.acteur_id INNER JOIN film ON acteur_film.film_id= film.id WHERE acteur.nom = 'PITT' AND acteur.prenom = 'Brad'
```


