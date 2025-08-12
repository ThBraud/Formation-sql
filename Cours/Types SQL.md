# C'est un quoi un type ? 

*Dans SQL, chaque colonne, variable locale, expression et paramètre a un type de données associé.*  
💡**Un type de données est un attribut qui spécifie le type de données que l'objet peut contenir**  

SQL fournit par défaut un ensemble de types. Mais il est aussi possible pour l'utilisateur d'en définir par lui-même avec la commande **```CREATE TYPE```** ajoutée par l'extension *Transact-SQL*.  

Dans notre cas, nous aborderons que les types par défaut de SQL.  

# Toutes les catégories de types
- ### **Exacts numerics** *(Chiffres exacts)*
- ### **Approximate numerics** *(Chiffres approximatifs)*
- ### **Date and time** *(Date et Heure)*
- ### **Character strings** *(Chaînes de caractères)*
- ### **Unicode character strings** *(Chaînes de caractères Unicode)*
- ### **Binary strings** *(Chaînes binaires)*
- ### **Other data types** *(Autres types de données)*  

💡 Dans SQL Server, selon leurs caractéristiques de stockage, certains types de données sont désignés comme appartenant aux groupes suivants :
- Types de données de grande valeur : varchar(max), et nvarchar(max)
- Types de données d’objets volumineux : texte, ntext, image, varbinary(max), et xml  

## Exacts numerics 
