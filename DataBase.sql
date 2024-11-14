-- Création de la base de données
CREATE DATABASE Centre_Formation;
USE Centre_Formation;

-- Création des tables
CREATE TABLE Etudiant (
    NumCINEtu INT PRIMARY KEY,
    NomEtu VARCHAR(50),
    PrenomEtu VARCHAR(50),
    dateNaissance DATE,
    adresseEtu VARCHAR(100),
    villeEtu VARCHAR(20),
    niveauEtu INT
);

CREATE TABLE Specialite (
    codeSpec INT PRIMARY KEY,
    nomSpec VARCHAR(50), 
    descSpec VARCHAR(50),
    active BOOLEAN DEFAULT 1
);

CREATE TABLE Formation (
    codeForm INT PRIMARY KEY,
    titreForm VARCHAR(100),
    dureeForm INT,
    prixForm FLOAT
);

CREATE TABLE Session (
    codeSess INT PRIMARY KEY,
    nomSess VARCHAR(50),
    dateDebut DATE,
    dateFin DATE,
    CONSTRAINT check_data_session
    CHECK (dateDebut < dateFin)
);

-- Création des relations
CREATE TABLE Inscrit (
    NumEtu INT,
    codeSess INT,
    typeCours VARCHAR(50) NOT NULL,
    PRIMARY KEY (NumEtu, codeSess),
    FOREIGN KEY (NumEtu) REFERENCES Etudiant(NumCINEtu),
    FOREIGN KEY (codeSess) REFERENCES Session(codeSess)
);
