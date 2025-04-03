# Base de données

### Créer une base de données :

<span style="color:red">[Sans condition :]</span>


- `CREATE DATABASE nom_base`;

Avec condition : 

- `CREATE DATABASE IF NOT EXISTS nom_base`;

### Supprimer une base de données

Sans condition : 

- `DROP DATABASE nom_base`;

Avec condition :  

- `DROP DATABASE IF EXISTS nom_base`;

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

💡Pour les chiffres on peut les écrire directement sans les apostrophes






