-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Ven 24 Juin 2016 à 05:55
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nfc`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `type_article` varchar(32) NOT NULL,
  `nom_article` varchar(32) NOT NULL,
  `prix_article` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `type_article`, `nom_article`, `prix_article`, `createdat`, `updatedat`) VALUES
(1, 'Plat', 'Couscous', 3.5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Plat', 'Chirachi', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Plat', 'Entrecôte', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Plat', 'Lasagne', 2.5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Plat', 'Moules', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Plat', 'Dinde', 2.5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Plat', 'Pizza', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Plat', 'Hamburger', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Plat', 'Poisson', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Plat', 'Jambon', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'CE', 'Parc Disney', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'CE', 'Parc Asterix', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'CE', 'Zoo', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'CE', 'UGC ciné', 3.5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'CE', 'Aquarium', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'CE', 'Futuroscope', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'CE', 'Final Euro 2016', 350, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'CE', 'Piscine', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'CE', 'Restaurant Gourmet', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'CE', 'Séjour Espagne', 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'CE', 'Voyage Maroc', 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `montant` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_compte`, `date_commande`, `montant`, `createdat`, `updatedat`) VALUES
(1, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `argent` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`id`, `id_utilisateur`, `argent`, `active`, `createdat`, `updatedat`) VALUES
(1, 4, 11, 1, '2016-03-01 00:00:00', '2016-03-01 00:00:00'),
(2, 17, 0, 0, '2016-03-28 00:00:27', '2016-03-28 00:00:55'),
(3, 30, 0, 0, '2016-03-28 17:40:45', '2016-03-28 17:42:19'),
(4, 31, 0, 0, '2016-03-28 17:43:15', '2016-03-28 17:44:27'),
(5, 32, 0, 0, '2016-03-28 17:49:31', '2016-03-28 18:19:06'),
(6, 33, 0, 0, '2016-03-28 18:30:30', '2016-03-29 09:20:52'),
(7, 20, 0, 1, '2016-06-13 17:22:21', '2016-06-13 17:22:21'),
(8, 21, 0, 0, '2016-06-13 17:55:08', '2016-06-14 10:22:34'),
(9, 23, 0, 0, '2016-06-14 10:33:55', '2016-06-14 11:01:34'),
(10, 24, 0, 0, '2016-06-14 10:39:32', '2016-06-17 12:06:31'),
(11, 25, 0, 0, '2016-06-14 10:49:16', '2016-06-14 10:59:00'),
(12, 21, 0, 1, '2016-06-16 10:56:11', '2016-06-16 10:56:11'),
(13, 22, 0, 1, '2016-06-16 14:56:01', '2016-06-16 14:56:01'),
(14, 24, 0, 0, '2016-06-17 11:59:17', '2016-06-17 12:06:31'),
(15, 26, 0, 0, '2016-06-17 12:10:11', '2016-06-17 12:13:24'),
(16, 27, 0, 1, '2016-06-17 12:50:46', '2016-06-17 12:50:46');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE `connexion` (
  `id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`id`, `login`, `password`, `salt`, `createdat`, `updatedat`, `id_utilisateur`) VALUES
(3, 'aadmin', '$2a$10$XoaCnf3Uk/Ag7mcIh0ZdtuXsa8fRpz6TH7BrL.rJcBc/8qiOQ9KlK', '$2a$10$XoaCnf3Uk/Ag7mcIh0Zdtu', '2016-03-27 23:12:09', '2016-03-27 23:12:09', 15),
(2, 'stephane.demaret@nfc.com', '$2a$10$Yhi0OWJau1hQ2OrlCoAyF.IQYr.qN51CgeKJJ5eCoc3ApKBRsaa/G', '$2a$10$Yhi0OWJau1hQ2OrlCoAyF.', '2016-03-03 00:00:00', '2016-06-16 11:26:57', 4),
(4, 'uuser', '$2a$10$a5K2pTyivYdpIHjZEZOv2evqbeDPesnYK1dwgy1nPXRanAQWNxNOe', '$2a$10$a5K2pTyivYdpIHjZEZOv2e', '2016-03-27 23:16:33', '2016-03-27 23:16:33', 16),
(5, 'ttoto', '$2a$10$uXZA68.L.aUM7S7qbybEd.M2/aoLSh8Abvg3hqNQriYIK3ePIbsRi', '$2a$10$uXZA68.L.aUM7S7qbybEd.', '2016-03-27 23:22:28', '2016-03-27 23:22:28', 17),
(21, 'ttutu', '$2a$10$c5uofTDBdDT972OX0MmsMeJuysN8g8FpAjQZJgJc1VTnyjPcqdcJm', '$2a$10$c5uofTDBdDT972OX0MmsMe', '2016-06-13 17:22:21', '2016-06-13 17:22:21', 20),
(26, 'ttest', '$2a$10$07coSb5hA0ujIeacyoSHwe81DR6CKubPrr1wFdotPK/IUB24Hw0r6', '$2a$10$07coSb5hA0ujIeacyoSHwe', '2016-06-16 10:56:11', '2016-06-16 10:56:11', 21),
(30, 'thai.joseph.hn@gmail.com', '$2a$10$0U09DpmB4oFCpdbz9f.K3eBjAD6zq0idq5xEgasNGBuFXD9WZzza2', 'PynKvF9TE2mc7uIdAVJbKDYMg30iiCTs', '2016-06-17 12:50:46', '2016-06-17 12:50:46', 27);

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `id` int(11) NOT NULL,
  `nom_emplacement` varchar(32) NOT NULL,
  `type` varchar(20) NOT NULL,
  `nb_place` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `emplacement`
--

INSERT INTO `emplacement` (`id`, `nom_emplacement`, `type`, `nb_place`, `createdat`, `updatedat`) VALUES
(1, 'Salle 1', 'Salle', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Salle 2', 'Salle', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Salle 3', 'Salle', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Cantine 1', 'Cantine', 150, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Cantine 2', 'Cantine', 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `id_commande` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignecommande`
--

INSERT INTO `lignecommande` (`id_commande`, `id_article`, `quantite`, `montant`, `createdat`, `updatedat`) VALUES
(1, 11, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 12, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 13, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 14, 10, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 15, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 6, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 8, 4, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE `localisation` (
  `code_emplacement` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_entree` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `localisation`
--

INSERT INTO `localisation` (`code_emplacement`, `id_utilisateur`, `date_entree`, `createdat`, `updatedat`) VALUES
(1, 4, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 4, '2016-06-13 11:30:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 15, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 15, '2016-04-23 08:32:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 15, '2016-06-14 07:52:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 15, '2016-06-17 10:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 16, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 16, '2016-04-23 09:45:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 16, '2016-06-14 06:28:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 17, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 16, '2016-04-14 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 16, '2016-06-13 11:30:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 16, '2016-06-15 06:33:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 17, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 20, '2016-06-17 10:57:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 17, '2016-04-23 11:04:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, '2016-04-16 10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 15, '2016-04-16 09:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 16, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 16, '2016-04-23 09:35:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 16, '2016-06-13 11:43:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 16, '2016-06-13 12:25:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 17, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 17, '2016-06-13 12:25:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 17, '2016-06-17 10:24:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 16, '2016-06-13 12:25:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 20, '2016-06-14 07:53:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `my_chart_data`
--

CREATE TABLE `my_chart_data` (
  `category` date NOT NULL,
  `value1` int(11) NOT NULL,
  `value2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `my_chart_data`
--

INSERT INTO `my_chart_data` (`category`, `value1`, `value2`) VALUES
('2013-08-24', 417, 127),
('2013-08-25', 417, 356),
('2013-08-26', 531, 585),
('2013-08-27', 333, 910),
('2013-08-28', 552, 30),
('2013-08-29', 492, 371),
('2013-08-30', 379, 781),
('2013-08-31', 767, 494),
('2013-09-01', 169, 364),
('2013-09-02', 314, 476),
('2013-09-03', 437, 759);

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

CREATE TABLE `pointage` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_entree` datetime NOT NULL,
  `date_sortie` datetime DEFAULT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pointage`
--

INSERT INTO `pointage` (`id`, `id_utilisateur`, `date_entree`, `date_sortie`, `createdat`, `updatedat`) VALUES
(3, 16, '2016-06-08 08:22:48', '2016-06-14 19:29:39', '2016-06-14 20:22:48', '2016-06-14 20:29:39'),
(4, 16, '2016-06-09 08:29:44', '2016-06-08 19:31:12', '2016-06-14 20:29:44', '2016-06-14 20:31:12'),
(6, 4, '2016-06-13 08:35:29', '2016-06-13 19:36:26', '2016-06-16 14:35:29', '2016-06-16 14:36:26'),
(7, 4, '2016-06-14 08:38:13', '2016-06-14 19:21:48', '2016-06-16 14:38:13', '2016-06-16 20:21:48'),
(8, 4, '2016-06-15 08:30:35', '2016-06-15 19:30:44', '2016-06-16 20:30:35', '2016-06-16 20:30:44'),
(9, 4, '2016-06-16 08:04:00', '2016-06-16 19:04:00', '2016-06-16 20:33:02', '2016-06-17 07:38:42'),
(10, 4, '2016-06-17 08:35:00', '2016-06-17 12:54:17', '2016-06-16 20:35:50', '2016-06-17 12:54:17'),
(11, 21, '2016-06-04 14:07:00', '2016-12-31 17:23:00', '2016-06-17 09:37:55', '2016-06-17 10:54:13');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nom_role` varchar(32) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `nom_role`, `createdat`, `updatedat`) VALUES
(1, 'ADMIN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'USER', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `nom_service` varchar(32) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id`, `nom_service`, `createdat`, `updatedat`) VALUES
(1, 'Informatique', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'RH', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tempstravail`
--

CREATE TABLE `tempstravail` (
  `id_utilisateur` int(11) NOT NULL,
  `temps_travail_jr` int(11) NOT NULL,
  `credit_heure` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  `type_transaction` varchar(20) NOT NULL,
  `montant` double NOT NULL,
  `date` date NOT NULL,
  `id_commande` int(11) NOT NULL,
  `commentaire` varchar(50) DEFAULT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `transaction`
--

INSERT INTO `transaction` (`id`, `id_compte`, `type_transaction`, `montant`, `date`, `id_commande`, `commentaire`, `createdat`, `updatedat`) VALUES
(1, 1, 'Débit', 25, '2016-06-14', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'Débit', 65.5, '2016-06-15', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'Remboursement', 25, '2016-06-17', 1, 'Parc Astérix', '2016-06-16 21:59:20', '2016-06-16 21:59:20');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_nfc` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `tel`, `id_service`, `id_role`, `id_nfc`, `createdat`, `updatedat`) VALUES
(4, 'Demaret', 'Stéphane', 'huunghi.thai@gmail.com', '0147852368', 1, 2, 0, '2016-03-20 13:56:28', '2016-06-16 11:29:01'),
(15, 'Admin', 'Admin', 'admin@nfc.com', '0214587963', 1, 1, 0, '2016-03-27 23:12:08', '2016-03-27 23:12:08'),
(16, 'user', 'user', 'user@user.com', '0321654987', 1, 2, 0, '2016-03-27 23:16:33', '2016-03-27 23:16:33'),
(17, 'toto', 'toto', 'toto@nfc.com', '0142536987', 2, 2, 0, '2016-03-27 23:22:27', '2016-03-27 23:22:27'),
(20, 'tutu', 'tutu', 'tutu@tutu.fr', '0123456789', 1, 2, 0, '2016-06-13 17:22:20', '2016-06-13 17:22:20'),
(21, 'test', 'test', 'test@test.fr', '0612345623', 1, 2, 0, '2016-06-16 10:56:11', '2016-06-16 10:56:11'),
(27, 'Lecoguic', 'Yoann', 'thai.joseph.hn@gmail.com', '0612345625', 1, 2, 0, '2016-06-17 12:50:45', '2016-06-17 12:50:45');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD UNIQUE KEY `id_commande` (`id_commande`),
  ADD KEY `id_compte` (`id_compte`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`,`id_utilisateur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `connexion_fk1` (`id_utilisateur`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`id_commande`,`id_article`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`code_emplacement`,`id_utilisateur`,`date_entree`),
  ADD KEY `code_emplacement` (`code_emplacement`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tempstravail`
--
ALTER TABLE `tempstravail`
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compte` (`id_compte`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `fk_role_id` (`id_role`),
  ADD KEY `fk_service_id` (`id_service`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `lignecommande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `lignecommande_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `localisation`
--
ALTER TABLE `localisation`
  ADD CONSTRAINT `localisation_ibfk_1` FOREIGN KEY (`code_emplacement`) REFERENCES `emplacement` (`id`),
  ADD CONSTRAINT `localisation_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD CONSTRAINT `pointage_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tempstravail`
--
ALTER TABLE `tempstravail`
  ADD CONSTRAINT `FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `fk_service_id` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
