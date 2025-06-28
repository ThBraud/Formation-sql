-- Crée la base de données "stock" si elle n'existe pas
CREATE DATABASE IF NOT EXISTS stock;

-- Utilise la base de données "stock"
use stock;

-- Crée la table Clients avec les colonnes client_id, nom, email et date d'inscription
CREATE TABLE IF NOT EXISTS Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE
);

-- Crée la table Produits avec les colonnes produit_id, nom, prix et stock
-- La contrainte CHECK s'assure que le stock est supérieur ou égal à 0
CREATE TABLE IF NOT EXISTS Produits (
    produit_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix FLOAT(10,2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0)
);

-- Crée la table Commandes avec un lien vers le client et un montant total par défaut à 0
-- La clé étrangère client_id fait référence à Clients(client_id)
CREATE TABLE IF NOT EXISTS Commandes (
    commande_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant_total DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

-- Crée la table Lignes_Commande pour enregistrer les produits d'une commande
-- Avec deux clés étrangères : commande_id et produit_id
CREATE TABLE IF NOT EXISTS Lignes_Commande (
    ligne_id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),
    prix_unitaire DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_commande FOREIGN KEY (commande_id) REFERENCES Commandes(commande_id),
    CONSTRAINT fk_produit FOREIGN KEY (produit_id) REFERENCES Produits(produit_id)
);


-- Crée la table Historique_Commandes pour enregistrer les statuts des commandes
-- Avec une clé étrangère sur commande_id
CREATE TABLE IF NOT EXISTS Historique_Commandes (
    historique_id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    date_enregistrement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(50) NOT NULL,
    montant_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_historique_commande FOREIGN KEY (commande_id) REFERENCES Commandes(commande_id)
);



-- Crée un index sur le nom du client
CREATE INDEX  idx_client_nom ON Clients(nom);

-- Crée un index composite sur date_commande et montant_total dans Commandes
CREATE INDEX idx_commandes_date_montant ON Commandes(date_commande,montant_total);

-- Crée un index composite sur date_enregistrement et montant_total dans Historique_Commandes
CREATE INDEX idx_historique_date_montant ON historique_commandes(date_enregistrement,montant_total);

-- Crée un index sur la quantité dans Lignes_Commande
CREATE INDEX idx_lignescommandes_quantite ON lignes_commande(quantite);

-- Crée un index sur le stock dans Produits
CREATE INDEX idx_produits_stocks ON produits(stock)