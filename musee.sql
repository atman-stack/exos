-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 05 juin 2020 à 18:14
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `musee`
--

DELIMITER $$
--
-- Fonctions
--
DROP FUNCTION IF EXISTS `checkAnneOeuvre`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `checkAnneOeuvre` (`num` INT, `annee` INT) RETURNS INT(11) BEGIN
	DECLARE valide INT DEFAULT 0;
    DECLARE naissance INT;
    DECLARE deces INT;

    SELECT YEAR(anneeNaissance), YEAR(anneeDeces) 
    INTO naissance, deces
    FROM artiste
    INNER JOIN auteur
    ON auteur.numArtiste = artiste.numArtiste
    AND auteur.numOeuvre = id;
    
    IF annee > naissance 
    	THEN
   			SET valide = 1;
    END IF;
    
    RETURN valide;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE IF NOT EXISTS `artiste` (
  `numArtiste` int(11) NOT NULL AUTO_INCREMENT,
  `nomArtiste` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateDeces` date NOT NULL,
  `numNationalite` int(11) NOT NULL,
  `descriptionArtiste` text NOT NULL,
  PRIMARY KEY (`numArtiste`),
  KEY `artiste_fk_numnationalite` (`numNationalite`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `artiste`
--

INSERT INTO `artiste` (`numArtiste`, `nomArtiste`, `prenom`, `dateNaissance`, `dateDeces`, `numNationalite`, `descriptionArtiste`) VALUES
(1, 'Bianchi', 'Marie', '1780-05-03', '1850-03-21', 1, 'ddfdfdf');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `numOeuvre` int(11) NOT NULL,
  `numArtiste` int(11) NOT NULL,
  KEY `auteur_fk_numartiste` (`numArtiste`),
  KEY `auteur_fk_numoeuvre` (`numOeuvre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courantantartistique`
--

DROP TABLE IF EXISTS `courantantartistique`;
CREATE TABLE IF NOT EXISTS `courantantartistique` (
  `numCourant` int(11) NOT NULL AUTO_INCREMENT,
  `nomCourant` varchar(255) NOT NULL,
  `debut` int(11) NOT NULL,
  `fin` int(11) NOT NULL,
  `descriptionCourant` varchar(255) NOT NULL,
  PRIMARY KEY (`numCourant`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `courantantartistique`
--

INSERT INTO `courantantartistique` (`numCourant`, `nomCourant`, `debut`, `fin`, `descriptionCourant`) VALUES
(1, 'Le Romantisme', 1770, 1850, 'fsdgsg');

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `numOuevre` int(11) NOT NULL,
  `numMusee` int(11) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `exemplaire_fk_numouevre` (`numOuevre`),
  KEY `exemplaire_fk_nummusee` (`numMusee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `numMat` int(11) NOT NULL AUTO_INCREMENT,
  `nomMat` varchar(255) NOT NULL,
  PRIMARY KEY (`numMat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`numMat`, `nomMat`) VALUES
(1, 'Toile de lin');

-- --------------------------------------------------------

--
-- Structure de la table `musee`
--

DROP TABLE IF EXISTS `musee`;
CREATE TABLE IF NOT EXISTS `musee` (
  `numMusee` int(11) NOT NULL AUTO_INCREMENT,
  `nomMusee` varchar(255) NOT NULL,
  `numVille` int(11) NOT NULL,
  PRIMARY KEY (`numMusee`),
  KEY `musee_fk_numville` (`numVille`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `musee`
--

INSERT INTO `musee` (`numMusee`, `nomMusee`, `numVille`) VALUES
(1, 'Le Louvre', 1);

-- --------------------------------------------------------

--
-- Structure de la table `nacionalite`
--

DROP TABLE IF EXISTS `nacionalite`;
CREATE TABLE IF NOT EXISTS `nacionalite` (
  `numNationalite` int(11) NOT NULL AUTO_INCREMENT,
  `nomnationalite` varchar(255) NOT NULL,
  PRIMARY KEY (`numNationalite`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `nacionalite`
--

INSERT INTO `nacionalite` (`numNationalite`, `nomnationalite`) VALUES
(1, 'Italienne');

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

DROP TABLE IF EXISTS `oeuvre`;
CREATE TABLE IF NOT EXISTS `oeuvre` (
  `numOeuvre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `annee` int(11) NOT NULL,
  `dimensions` varchar(255) NOT NULL,
  `numType` int(11) NOT NULL,
  `numMat` int(11) NOT NULL,
  `numCourant` int(11) NOT NULL,
  PRIMARY KEY (`numOeuvre`),
  KEY `oeuvre_fk_nummat` (`numMat`),
  KEY `oeuvre_fk_numtype` (`numType`),
  KEY `oeuvre_fk_numcourant` (`numCourant`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

DROP TABLE IF EXISTS `participe`;
CREATE TABLE IF NOT EXISTS `participe` (
  `numCourant` int(11) NOT NULL,
  `numArtiste` int(11) NOT NULL,
  KEY `participe_fk_numartiste` (`numArtiste`),
  KEY `participe_fk_numcourant` (`numCourant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `numType` int(11) NOT NULL AUTO_INCREMENT,
  `nomType` varchar(255) NOT NULL,
  PRIMARY KEY (`numType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `numVille` int(11) NOT NULL AUTO_INCREMENT,
  `nomVille` varchar(255) NOT NULL,
  PRIMARY KEY (`numVille`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`numVille`, `nomVille`) VALUES
(1, 'Paris');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `artiste_fk_numnationalite` FOREIGN KEY (`numNationalite`) REFERENCES `nacionalite` (`numNationalite`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD CONSTRAINT `auteur_fk_numartiste` FOREIGN KEY (`numArtiste`) REFERENCES `artiste` (`numArtiste`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `auteur_fk_numoeuvre` FOREIGN KEY (`numOeuvre`) REFERENCES `oeuvre` (`numOeuvre`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `exemplaire_fk_nummusee` FOREIGN KEY (`numMusee`) REFERENCES `musee` (`numMusee`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `exemplaire_fk_numouevre` FOREIGN KEY (`numOuevre`) REFERENCES `oeuvre` (`numOeuvre`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `musee`
--
ALTER TABLE `musee`
  ADD CONSTRAINT `musee_fk_numville` FOREIGN KEY (`numVille`) REFERENCES `ville` (`numVille`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD CONSTRAINT `oeuvre_fk_numcourant` FOREIGN KEY (`numCourant`) REFERENCES `courantantartistique` (`numCourant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `oeuvre_fk_nummat` FOREIGN KEY (`numMat`) REFERENCES `matiere` (`numMat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `oeuvre_fk_numtype` FOREIGN KEY (`numType`) REFERENCES `type` (`numType`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `participe`
--
ALTER TABLE `participe`
  ADD CONSTRAINT `participe_fk_numartiste` FOREIGN KEY (`numArtiste`) REFERENCES `artiste` (`numArtiste`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `participe_fk_numcourant` FOREIGN KEY (`numCourant`) REFERENCES `courantantartistique` (`numCourant`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
