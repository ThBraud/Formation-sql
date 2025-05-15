CREATE DATABASE IF NOT EXISTS stock;
use stock;

CREATE TABLE IF NOT EXISTS Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE
);

CREATE TABLE IF NOT EXISTS Produits (
    produit_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix FLOAT(10,2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE IF NOT EXISTS Commandes (
    commande_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant_total DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Lignes_Commande (
    ligne_id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),
    prix_unitaire DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Historique_Commandes (
    historique_id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    date_enregistrement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(50) NOT NULL,
    montant_total DECIMAL(10,2) NOT NULL
);



#Cle Etrangère table Commandes
ALTER TABLE Clients ADD CONSTRAINT fk_Commandes FOREIGN KEY Clients(client_id) REFERENCES Commandes(client_id);

#Cle etrangère Table Lignes_commandes
ALTER TABLE Lignes_Commande ADD CONSTRAINT fk_commande FOREIGN KEY (commande_id) REFERENCES Commandes(commande_id);
ALTER TABLE Lignes_Commande ADD CONSTRAINT fk_produit FOREIGN KEY (produit_id) REFERENCES Produits(produit_id);

#EXPLAIN produits

#Index Table Client 
CREATE INDEX  idx_client_nom ON Clients(nom);  
#Index Table Commandes 
CREATE INDEX idx_commandes_date_montant ON Commandes(date_commande,montant_total);
#Index historique commandes
CREATE INDEX idx_historique_date_montant ON historique_commandes(date_enregistrement,montant_total);
#Index lignes commandes
CREATE INDEX idx_lignescommandes_quantite ON lignes_commande(quantite);
#Index Table Produits
CREATE INDEX idx_produits_stocks ON produits(stock)