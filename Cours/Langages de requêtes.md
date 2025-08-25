# Langages de requêtes   
💡 *Le langage de requête, qui comprend le langage de requête des bases de données, est un langage informatique spécialisé utilisé pour effectuer des requêtes et récupérer des informations dans des bases de données. Il agit comme une interface entre les utilisateurs et les bases de données.* 

## SQL (Structured Query Language)
SQL est le langage standard pour interagir avec les bases de données relationnelles.  

## DDL (Data Definition Language) 
### Rôle du DDL 
Le DDL permet de définir la structure logique d'une base de données, notamment :
- La création de tables avec des types de données appropriés.
- L'établissement de relations entre les tables via des clés primaires et étrangères.
- L'ajout de contraintes pour assurer l'intégrité des données.

En résumé, le DDL est essentiel pour concevoir et maintenir la structure d'une base de données relationnelle. 

### Exemple 

```sql
CREATE TABLE Etudiants (
    id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    prenom VARCHAR (50),
    date_naissance DATE,
    email VARCHAR (100) UNIQUE
)ENGINE=INNODB;
```

## DML (Data Manipulation Language)  

### Le DML est essentiel pour : 
- Interroger les données stockées.
- Ajouter de nouvelles informations.
- Mettre à jour des enregistrements existants.
- Supprimer des données obsolètes ou incorrectes.

Ces opérations sont souvent utilisées en conjonction avec des transactions pour garantir l'intégrité des données.

### Exemple 

```sql
-- Insertion de données 
INSERT INTO Etudiants (nom,prenom, date_naissance) VALUES
('BRAUD', 'Thomas','2006-12-04')

--Sélection 
SELECT nom, prenom FROM Etudiants WHERE date_naissance > '2006-12-04';

-- Mise à jour 
UPDATE Etudiants SET email = 'thomas.braud@supdevinci-edu.fr' WHERE id_etudiant = 1;

--Suppression 
DELETE FROM Etudiants Where id_etudiant = 1;
```

## DCL (Data Control Language)

Le DCL permet de gérer les droits et permissions des utilisateurs sur les objets d’une base de données.
- ``GRANT`` : Accorder des privilèges 
- ``REVOKE`` : Supprimer des privilèges 

### Exemples 

```sql
GRANT SELECT, INSERT ON base_etudiants. * TO 'utilisateur1'@'localhost';
REVOKE INSERT ON base_etudiants. * FROM 'utilisateur1'@'localhost';
```

## TCL (Transaction Control Language)

Le TCL gère l’exécution des transactions afin d’assurer l’intégrité et la cohérence des données.
- ``COMMIT`` : Valider une transaction 
- ``ROLLBACK`` : Annuler une transaction 
- ``SAVEPOINT`` : Créer un point de sauvegarde dans une transaction
- ``SET TRANSACTION`` : Spécifier des caractéristiques pour la transaction

## Exemple 
```sql
BEGIN ;
UPDATE comptes SET solde = solde - 500 WHERE id_client = 1;
UPDATE comptes SET solde = solde + 500 WHERE id_client = 2;
COMMIT; 
```
