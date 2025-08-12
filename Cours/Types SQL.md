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

- tinyint → Entier très petit, 0 à 255 (1 octet).
  
- smallint → Petit entier, -32 768 à 32 767 (2 octets).
  
- int → Entier standard, -2 147 483 648 à 2 147 483 647 (4 octets).
  
- bigint → Très grand entier, -9 223 372 036 854 775 808 à 9 223 372 036 854 775 807 (8 octets).
  
- bit → Valeur binaire 0 ou 1 (booléen).
  
- decimal(p,s) → Nombre exact avec précision p (total de chiffres) et échelle s (après la virgule). Stocke avec précision.
  
- numeric(p,s) → Même chose que decimal, juste un autre nom.
  
- money → Nombre pour valeurs monétaires, précision fixe à 4 décimales (8 octets).
  
- smallmoney → Comme money mais plage plus petite (4 octets).