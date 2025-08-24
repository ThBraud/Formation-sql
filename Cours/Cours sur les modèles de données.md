# ❓ C'est quoi un modèles de donnée ?   

💡 **En informatique, un modèle de données est un modèle qui décrit la manière dont sont représentées les données dans une organisation métier, un système d'information ou une base de données.**

Dans notre cas en SQL, il en existe plusieurs : 
- Modèle relationnel
- Modèle objet
- Modèle objet-relationnel  

# Le modèle relationnel 
💡 **Le modèle relationnel, introduit par Edgar F. Codd en 1970, est le modèle le plus utilisé pour les bases de données.**

## Propriétés fondamentales 
- Atomicité des données
- Structure tabulaire
- Relations entre tables
- Contraintes d'intégrité  

## Concepts clés 

- Relation(Table) : Une structure théorique qui représente un ensemble de données. Chaque relation a la même structure (les mêmes colonnes) 
 
    - Exemple : Une table ``Client`` avec les colonnes ``ID``, ``Nom`` et ``Email``.   

- Tuple(Ligne) : Un enregistrement unique dans la table. Chaque tuple respecte la stucture de la relation
    - Exemple : ```(1, "Alice", "alice@mail.com")``` est un tuple de la table ``Client``
  
- Attribut(Colonne) : Une propriété ou un champ d'une relation. Cela décrit le type d'une données stocké. 
    - Exemple : ``Nom`` ou ``Email`` sont des attributs de la table ``Client``  


- Domaine : Ensemble de valeurs possibles pour un attribut
- Clé primaire : Attribut(s) identifiant de manière unique chaque tuple
- Clé étrangère : Attribut(s) faisant référence à une clé primaire d'une autre relation



## Exemple de modèle relationnel 

Voici une illustration d'un modèle relationnel pour un système de gestion de bibliothèque universitaire. Ce diagramme représente les entités principales et leurs relations dans une base de données relationnelle.

![alt text](modèle_relationnel.png)





