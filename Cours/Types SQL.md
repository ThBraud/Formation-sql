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

- tinyint → Entier très petit, *0 à 255*.  
*Plage → 0 à 255*

- smallint → Petit entier  
*Plage → -32 768 à 32 767*
  
- int → Entier standard  
*Plage → -2 147 483 648 à 2 147 483 647*.
  
- bigint → Très grand entier  
*Plage → -9 223 372 036 854 775 808* à *9 223 372 036 854 775 807*.
  
- bit → Valeur binaire 0 ou 1 (booléen).
  
- decimal(p,s) → Nombre exact avec précision p (total de chiffres) et échelle s (après la virgule). Stocke avec précision.
  
- numeric(p,s) → Même chose que decimal, juste un autre nom.
  
- money → Nombre pour valeurs monétaires, précision fixe à 4 décimales.
  
- smallmoney → Comme money mais plage plus petite.  

💡 *Le type de données bit est utilisé pour stocker des valeurs booléennes.*


## Approximate numerics

- float(n) → Nombre à virgule flottante approximatif, très grande plage, mais pas précis à 100 % (utile pour les valeurs scientifiques).

- real → Version plus petite de float, moins de précision que float.  
  
## Date and time  

- date → Stocke uniquement la date.     
*Format : (AAAA-MM-JJ)*

- time(n) → Stocke uniquement l’heure.  
*Format : (Heure-Minutes-Secondes)*

- datetime2(n) → Date + heure, précision élevée (7 chiffres après la seconde).

- datetimeoffset(n) → Comme datetime2 mais avec le décalage horaire. Sert à gérer les fuseaux horaires.

- datetime → Ancien type date+heure, précision ≈ 3 ms.

- smalldatetime → Version réduite de datetime, précision = 1 minute. 

💡 *Les plus utilisées aujourd'hui sont date, time, datetime2 et datetimeoffset*  


## Character strings  

- char(n) → Chaîne de longueur fixe. Taille max : 8 000 caractères. (1 octet/caractère)

- varchar(n) → Chaîne de longueur variable (ne prend que la place utilisée). Taille max : 8 000 caractères. (1 octet/caractère + 2 octets d’overhead)

- text → Ancien type pour des grandes chaînes (jusqu’à ~2 Go). Déprécié, remplacé par varchar(max).  


## Unicode character strings  
💡 *La norme de codage de caractères Unicode est un système de codage de caractères de longueur fixe qui inclut les caractères de presque toutes les langues vivantes du monde.*

- nchar(n) → Comme char, mais pour l’Unicode (UCS-2). Longueur fixe. Chaque caractère prend 2 octets. Max : 4 000 caractères.

- nvarchar(n) → Comme varchar, mais pour l’Unicode. Longueur variable. Chaque caractère prend 2 octets. Max : 4 000 caractères, ou nvarchar(max) pour jusqu’à 2 Go.

- ntext → Ancien type texte Unicode (jusqu’à 2 Go). Déprécié, remplacé par nvarchar(max).


