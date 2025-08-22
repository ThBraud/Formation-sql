# ❓ C’est quoi une base de données ?

**Définition : Une base de données est une collection organisée de données structurées, généralement stockées électroniquement dans un système informatique. Les données sont généralement organisées pour modéliser des aspects pertinents de la réalité, de manière à soutenir les processus exigeant des informations..** 

*Exemples : Banque, site e-commerce*

**💡 Pourquoi utiliser une base de données ?**

Les bases de données sont utilisées pour :

- Centraliser et organiser les données de manière cohérente.
- Réduire les redondances et les incohérences des données.
- Assurer la sécurité et l'intégrité des informations.
- Améliorer l'accès rapide et efficace aux données.
- Permettre des transactions sécurisées et fiables.
- Faciliter l'analyse des données pour la prise de décision.

Les caractéristiques essentielles :
- Persistance des données
- Accès concurrent aux données
- Intégrité et cohérence des données
- Sécurité et confidentialité
- Redondance minimale

# Les types de bases de données  

## Bases de données relationnelles 

💡 **Les bases de données relationnelles organisent les données en tables composées de lignes et de colonnes, avec des relations clairement définies entre les tables**  

### Caratéristiques 
- Structure rigide avec schéma prédéfini (tables, colonnes)
- Utilisation du langage SQL (Structured Query Language)
- ACID (Atomicité, Cohérence, Isolation, Durabilité)
- Relations entre tables via les clés primaires et étrangères
- Normalisation pour réduire la redondance  


### Points forts 
- Intégrité des données grâce aux contraintes
- Transactions sécurisées
- Requêtes complexes et jointures entre tables
- Standardisation bien établie  

### Limites  
- Moins flexible pour les données non structurées
- Scaling horizontal plus complexe
- Les performances peuvent diminuer avec de très grands volumes

### Exemples  
- Une banque utilise MySQL pour gérer ses propres clients  
- Une compagnie aérienne utilise PostgreSQL pour gérer les réservations
- Un hôpital pour gérer les patients, les consultations et les préscriptions médicales liées aux patients et médecins  


## Bases de données non-relationnelles 

💡 **Ces bases de données s'affranchissent du modèle relationnel pour offrir plus de flexibilité et s'adapter à différents types de données. Elles ne stockent pas forcément en tables comme en SQL. Elles sont regroupées en familles, selon leur façon de stocker.**   

### Modèles de bases NoSQL
- Clé-valeur (Redis, DynamoDB)
- Documents (MongoDB, CouchDB)
- Colonnes (Cassandra, HBase)
- Graphes (Neo4j, JanusGraph)  


### Caratéristiques 
- Schémas flexibles ou absents
- Haute scalabilité horizontale
- Généralement BASE plutôt qu'ACID (Basically Available, Soft state, Eventually consistent)
- Optimisées pour des cas d'usage spécifique  

### Points forts  

- Excellentes performances à grande échelle
- Adaptées aux données non structurées ou semi-structurées
- Distribution et réplication facilitées
- Évolutivité horizontale  

### Limites 
- Moins de garanties transactionnelles
- Requêtes complexes parfois plus difficiles
- Moins standardisées que SQL


### Exemples
- Un site e-commerce stocke ses produits et commandes. 
- Application mobiles pour stocke les données en JSON pour les synchroniser facilement
- Analyses de données massives
- Fraude bancaire : détecter des connexions suspectes entre plusieurs comptes.  


## Bases de données orientées objet

💡 **Ces bases de données stockent les données sous forme d'objets, similaires à ceux utilisés dans la programmation orientée objet.**  


### Caractéristiques 
- Correspondance directe avec les modèles objets des langages de programmations
- Encapsulation, héritage et polymorphisme
- Identité d'objet plutôt que clés primaires
- Relations directes entre objets  
  
### Points forts 
- Intégration naturelle avec les langages orientés objet
- Pas de nécessité d'ORM (Object-Relational Mapping)
- Gestion efficace des structures de données complexes
- Manipulation directe des objets  


### Limites 
- Moins répandues et standardisées
- Performances variables selon les implémentations
- Requêtes moins puissantes que SQL
- Écosystème d'outils plus limité  

### Exemples 
- Logiciels scientifiques (molécules, simulations)
- Jeux vidéos et simulations en temps réels 
- Applications multimédias (images, vidéos et audios)

# Systèmes de Gestion de Bases de Données (SGBD)  

💡 **Un SGBD est un logiciel qui permet de créer, manipuler et administrer des bases de données.**


## Fonctions Principales 
- Définition des données (structure, contraintes)
- Manipulation des données (insertion, mise à jour, suppression, interrogation)
- Contrôle de la concurrence
- Sécurité et contrôle d'accès
- Intégrité et cohérence des données
- Sauvegarde et récupération

## Exemples d'applications dans le monde professionnel  
- Systèmes d'information d'entreprise
- Applications web et mobiles
- Analyse de données et business intelligence
- Intelligence artificielle et apprentissage automatique
- Internet des objets (IoT)

