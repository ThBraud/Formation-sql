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


## Binary strings

- binary(n) → Données binaires de taille fixe (comme char mais pour des octets). Max : 8 000 octets.

- varbinary(n) → Données binaires de taille variable (comme varchar). Max : 8 000 octets, ou varbinary(max) jusqu’à 2 Go.

- image → Ancien type pour données binaires volumineuses (images, fichiers, etc.) jusqu’à 2 Go. Déprécié, remplacé par varbinary(max).  

## Other data types  

- cursor → Pointeur vers un jeu de résultats. Sert pour parcourir ligne par ligne (rare, lourd, à éviter si possible).

- geography → Données spatiales réelles (coordonnées latitude/longitude sur la Terre).

- geometry → Données spatiales planes (points, lignes, polygones dans un plan cartésien).

- hierarchyid → Type spécial pour stocker des structures hiérarchiques (ex : arbre de catégories, organigramme).

- json → Permet de stocker et manipuler du texte JSON (pas un vrai type natif, c’est du nvarchar(max) avec fonctions JSON intégrées). 
   
💡 *JSON (JavaScript Object Notation) est un format texte permettant de stocker et d'échanger des données de manière lisible par l'utilisateur et analysable par la machine.*

- vector → Nouveau (SQL Server 2025) : stockage de vecteurs numériques pour l’IA (embedding, recherche sémantique).

- sql_variant → Peut contenir différents types de données (int, decimal, varchar…), sauf text, ntext, image, xml. Utile mais rare.

- table → Variable de type table (stocke un petit jeu de résultats en mémoire, un peu comme une mini-table temporaire).

- uniqueidentifier → Identifiant global unique (GUID), généré avec ```NEWID()``` ou ```NEWSEQUENTIALID()```. Sert de clé primaire parfois.

- xml → Type pour stocker et interroger des données XML, avec index et schémas possibles.

- rowversion (ex timestamp) → Auto-généré, valeur binaire unique qui change à chaque modification de ligne. Sert pour la concurrence.  
  
Plus d'explications pour rowversion : 
- rowversion est une colonne spéciale que SQL Server met à jour automatiquement.
- Sa valeur change à chaque fois qu’on modifie une ligne de la table.  
  
On l'utilise pour savoir si une ligne a changé entre le moment où on l’a lue et le moment où on veut la modifier.
Ça permet d’éviter qu’un utilisateur écrase les modifications d’un autre sans s’en rendre compte.