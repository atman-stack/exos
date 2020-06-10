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
-- Base de données :  `clinique_veterinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `DateNaissance` date NOT NULL,
  `DataDeces` date NOT NULL,
  `IdPropietaire` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `animal_fk_idpropietaire` (`IdPropietaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `IdAnimal` int(11) NOT NULL,
  `IdRace` int(11) NOT NULL,
  KEY `chat_fk_idanimal` (`IdAnimal`),
  KEY `chat_fk_idrace` (`IdRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `IdAnimal` int(11) NOT NULL,
  `Taille` float NOT NULL,
  `Poids` float NOT NULL,
  `IdRace` int(11) NOT NULL,
  KEY `chien_fk_idanimal` (`IdAnimal`),
  KEY `chien_fk_idrace` (`IdRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `antecedents` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `IdGarde` int(11) NOT NULL,
  `IdVeterinaire` int(11) NOT NULL,
  KEY `effectuer_fk_idgarde` (`IdGarde`),
  KEY `effectuer_fk_idveterinaire` (`IdVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

DROP TABLE IF EXISTS `garde`;
CREATE TABLE IF NOT EXISTS `garde` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` time NOT NULL,
  `heureDebut` time NOT NULL,
  `HeureFin` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
CREATE TABLE IF NOT EXISTS `horaire` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Jour` varchar(255) NOT NULL,
  `HeureDebut` time NOT NULL,
  `HeureFin` time NOT NULL,
  `IdVeterinaire` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `horaire_fk_idveterinaire` (`IdVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  `Indications` text NOT NULL,
  `EffetsSecondaires` text NOT NULL,
  `Laboratoire` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `IdVisite` int(11) NOT NULL,
  `IdMedicament` int(11) NOT NULL,
  `Posologie` text NOT NULL,
  KEY `prescrire_fk_idmedicament` (`IdMedicament`),
  KEY `prescrire_fk_idvisite` (`IdVisite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `propietaire`
--

DROP TABLE IF EXISTS `propietaire`;
CREATE TABLE IF NOT EXISTS `propietaire` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Rue` varchar(255) NOT NULL,
  `CodePostal` int(11) NOT NULL,
  `Ville` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `TelephoneMobile` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `race_chat`
--

DROP TABLE IF EXISTS `race_chat`;
CREATE TABLE IF NOT EXISTS `race_chat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `race_chien`
--

DROP TABLE IF EXISTS `race_chien`;
CREATE TABLE IF NOT EXISTS `race_chien` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

DROP TABLE IF EXISTS `veterinaire`;
CREATE TABLE IF NOT EXISTS `veterinaire` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `TelephoneMobil` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DateVisite` date NOT NULL,
  `HeureVisite` time NOT NULL,
  `Raison` varchar(255) NOT NULL,
  `IdDossier` int(11) NOT NULL,
  `IdAnimal` int(11) NOT NULL,
  `IdVeterinaire` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `visite_fk_idanimal` (`IdAnimal`),
  KEY `visite_fk_iddossier` (`IdDossier`),
  KEY `visite_fk_idveterinaire` (`IdVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_fk_idpropietaire` FOREIGN KEY (`IdPropietaire`) REFERENCES `propietaire` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_fk_idanimal` FOREIGN KEY (`IdAnimal`) REFERENCES `animal` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `chat_fk_idrace` FOREIGN KEY (`IdRace`) REFERENCES `race_chat` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `chien_fk_idanimal` FOREIGN KEY (`IdAnimal`) REFERENCES `animal` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `chien_fk_idrace` FOREIGN KEY (`IdRace`) REFERENCES `race_chien` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `effectuer_fk_idgarde` FOREIGN KEY (`IdGarde`) REFERENCES `garde` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `effectuer_fk_idveterinaire` FOREIGN KEY (`IdVeterinaire`) REFERENCES `veterinaire` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `horaire_fk_idveterinaire` FOREIGN KEY (`IdVeterinaire`) REFERENCES `veterinaire` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `prescrire_fk_idmedicament` FOREIGN KEY (`IdMedicament`) REFERENCES `medicament` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prescrire_fk_idvisite` FOREIGN KEY (`IdVisite`) REFERENCES `visite` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_fk_idanimal` FOREIGN KEY (`IdAnimal`) REFERENCES `animal` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `visite_fk_iddossier` FOREIGN KEY (`IdDossier`) REFERENCES `dossier` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `visite_fk_idveterinaire` FOREIGN KEY (`IdVeterinaire`) REFERENCES `veterinaire` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
