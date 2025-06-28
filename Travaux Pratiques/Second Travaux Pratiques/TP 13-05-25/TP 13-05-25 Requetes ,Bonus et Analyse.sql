-- Analyse l'éxécution pour la table Clients
#EXPLAIN SELECT * FROM Clients;

-- Analyse l'éxécution pour la table Produits
#EXPLAIN SELECT * FROM produits;

-- Analyse l'éxécution pour la table Lignes_Commandes
#EXPLAIN SELECT * FROM ligne_commandes;

-- Analyse l'éxécution pour la table Historique_commandes
#EXPLAIN SELECT * FROM historique_commandes;

-- Analyse l'éxécution pour la table Commandes
#EXPLAIN SELECT * FROM Commandes;


#SELECT * FROM Clients ORDER BY nom;

#SELECT * FROM Produits WHERE stock > 50;

#SELECT * FROM historique_commandes ORDER BY montant_total DESC;

#SELECT Clients.nom, Commandes.date_commande, SUM(Lignes_Commande.total) AS Total_par_Clients FROM Clients 
#JOIN Commandes ON Clients.client_id = Commandes.client_id 
#JOIN Lignes_Commande ON Commandes.commande_id = Lignes_Commande.commande_id GROUP BY nom

USE stock;
#SELECT COUNT(*) AS nombre_lignes FROM Clients WHERE client_id IS NOT NULL
#SELECT COUNT(*) AS nombre_lignes FROM Commandes WHERE commande_id IS NOT NULL
#SELECT COUNT(*) AS nombre_lignes FROM historique_commandes WHERE historique_id IS NOT NULL

#SELECT COUNT(*) AS nombre_lignes FROM lignes_commande WHERE ligne_id IS NOT NULL
#SELECT COUNT(*) AS nombre_lignes FROM produits WHERE produit_id IS NOT NULL