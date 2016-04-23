-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.6.10 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour nfc
CREATE DATABASE IF NOT EXISTS `nfc` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nfc`;


-- Export de la structure de table nfc. article
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tye_article` varchar(32) NOT NULL,
  `nom_article` varchar(32) NOT NULL,
  `prix_article` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.article : ~5 rows (environ)
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `tye_article`, `nom_article`, `prix_article`, `createdat`, `updatedat`) VALUES
	(1, 'plat', 'couscous', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'plat', 'ratatouille', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'plat', 'omelette', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 'plat', 'steack', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 'plat', 'entrecote', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- Export de la structure de table nfc. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_compte` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `montant` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_compte` (`id_compte`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.commande : ~2 rows (environ)
DELETE FROM `commande`;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`id_commande`, `id_compte`, `date_commande`, `montant`, `createdat`, `updatedat`) VALUES
	(1, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 2, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;


-- Export de la structure de table nfc. compte
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `argent` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`,`id_utilisateur`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.compte : ~6 rows (environ)
DELETE FROM `compte`;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
INSERT INTO `compte` (`id`, `id_utilisateur`, `argent`, `active`, `createdat`, `updatedat`) VALUES
	(1, 2, 11, 1, '2016-03-01 00:00:00', '2016-03-01 00:00:00'),
	(2, 29, 0, 0, '2016-03-28 00:00:27', '2016-03-28 00:00:55'),
	(3, 30, 0, 0, '2016-03-28 17:40:45', '2016-03-28 17:42:19'),
	(4, 31, 0, 0, '2016-03-28 17:43:15', '2016-03-28 17:44:27'),
	(5, 32, 0, 0, '2016-03-28 17:49:31', '2016-03-28 18:19:06'),
	(6, 33, 0, 0, '2016-03-28 18:30:30', '2016-03-29 09:20:52');
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;


-- Export de la structure de table nfc. connexion
CREATE TABLE IF NOT EXISTS `connexion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `connexion_fk1` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.connexion : 5 rows
DELETE FROM `connexion`;
/*!40000 ALTER TABLE `connexion` DISABLE KEYS */;
INSERT INTO `connexion` (`id`, `login`, `password`, `salt`, `createdat`, `updatedat`, `id_utilisateur`) VALUES
	(3, 'aadmin', '$2a$10$XoaCnf3Uk/Ag7mcIh0ZdtuXsa8fRpz6TH7BrL.rJcBc/8qiOQ9KlK', '$2a$10$XoaCnf3Uk/Ag7mcIh0Zdtu', '2016-03-27 23:12:09', '2016-03-27 23:12:09', 15),
	(2, 'jinj', 'jnkjnl', 'kj,;', '2016-03-03 00:00:00', '2016-03-03 00:00:00', 3),
	(4, 'uuser', '$2a$10$a5K2pTyivYdpIHjZEZOv2evqbeDPesnYK1dwgy1nPXRanAQWNxNOe', '$2a$10$a5K2pTyivYdpIHjZEZOv2e', '2016-03-27 23:16:33', '2016-03-27 23:16:33', 16),
	(5, 'ttoto', '$2a$10$uXZA68.L.aUM7S7qbybEd.M2/aoLSh8Abvg3hqNQriYIK3ePIbsRi', '$2a$10$uXZA68.L.aUM7S7qbybEd.', '2016-03-27 23:22:28', '2016-03-27 23:22:28', 17),
	(7, 'ttutu', '$2a$10$mAjN.jJmiAtohfiycsPyIOcmtjlvKuxcEdoLHtf2xMLHFp8DMC61q', '$2a$10$mAjN.jJmiAtohfiycsPyIO', '2016-03-27 23:27:36', '2016-03-27 23:27:36', 19);
/*!40000 ALTER TABLE `connexion` ENABLE KEYS */;


-- Export de la structure de table nfc. emplacement
CREATE TABLE IF NOT EXISTS `emplacement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emplacement` varchar(32) NOT NULL,
  `type` varchar(20) NOT NULL,
  `nb_place` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.emplacement : ~5 rows (environ)
DELETE FROM `emplacement`;
/*!40000 ALTER TABLE `emplacement` DISABLE KEYS */;
INSERT INTO `emplacement` (`id`, `nom_emplacement`, `type`, `nb_place`, `createdat`, `updatedat`) VALUES
	(1, 'Salle 1', 'Salle', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Salle 2', 'Salle', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'Salle3', 'Salle', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 'Restaurant 1', 'Restaurant', 150, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 'Restaurant 2', 'Restaurant', 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `emplacement` ENABLE KEYS */;


-- Export de la structure de table nfc. lignecommande
CREATE TABLE IF NOT EXISTS `lignecommande` (
  `id_commande` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id_commande`,`id_article`),
  KEY `id_article` (`id_article`),
  CONSTRAINT `lignecommande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  CONSTRAINT `lignecommande_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.lignecommande : ~7 rows (environ)
DELETE FROM `lignecommande`;
/*!40000 ALTER TABLE `lignecommande` DISABLE KEYS */;
INSERT INTO `lignecommande` (`id_commande`, `id_article`, `quantite`, `montant`, `createdat`, `updatedat`) VALUES
	(1, 1, 4, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 2, 5, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 3, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 4, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 5, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 2, 6, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 3, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `lignecommande` ENABLE KEYS */;


-- Export de la structure de table nfc. localisation
CREATE TABLE IF NOT EXISTS `localisation` (
  `code_emplacement` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_entree` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`code_emplacement`,`id_utilisateur`,`date_entree`),
  KEY `code_emplacement` (`code_emplacement`),
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `localisation_ibfk_1` FOREIGN KEY (`code_emplacement`) REFERENCES `emplacement` (`id`),
  CONSTRAINT `localisation_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.localisation : ~13 rows (environ)
DELETE FROM `localisation`;
/*!40000 ALTER TABLE `localisation` DISABLE KEYS */;
INSERT INTO `localisation` (`code_emplacement`, `id_utilisateur`, `date_entree`, `createdat`, `updatedat`) VALUES
	(1, 4, '2016-04-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 15, '2016-04-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 16, '2016-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 17, '2016-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(1, 19, '2016-04-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 16, '2016-04-15 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 17, '2016-04-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 4, '2016-04-16 12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 15, '2016-04-16 11:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 16, '2016-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 17, '2016-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 19, '2016-04-17 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 19, '2016-04-18 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `localisation` ENABLE KEYS */;


-- Export de la structure de table nfc. pointage
CREATE TABLE IF NOT EXISTS `pointage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `date_entree` datetime DEFAULT NULL,
  `date_sorti` datetime DEFAULT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `pointage_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.pointage : ~1 rows (environ)
DELETE FROM `pointage`;
/*!40000 ALTER TABLE `pointage` DISABLE KEYS */;
INSERT INTO `pointage` (`id`, `id_utilisateur`, `date_entree`, `date_sorti`, `createdat`, `updatedat`) VALUES
	(1, 15, '2016-04-23 00:00:00', '2016-04-23 00:00:00', '2016-04-23 20:31:27', '2016-04-23 20:32:57');
/*!40000 ALTER TABLE `pointage` ENABLE KEYS */;


-- Export de la structure de table nfc. role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(32) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.role : ~2 rows (environ)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `nom_role`, `createdat`, `updatedat`) VALUES
	(1, 'ADMIN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'USER', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Export de la structure de table nfc. service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(32) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.service : ~2 rows (environ)
DELETE FROM `service`;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id`, `nom_service`, `createdat`, `updatedat`) VALUES
	(1, 'Informatique', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'RH', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;


-- Export de la structure de table nfc. tempstravail
CREATE TABLE IF NOT EXISTS `tempstravail` (
  `id_utilisateur` int(11) NOT NULL,
  `temps_travail_jr` int(11) NOT NULL,
  `credit_heure` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.tempstravail : ~0 rows (environ)
DELETE FROM `tempstravail`;
/*!40000 ALTER TABLE `tempstravail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempstravail` ENABLE KEYS */;


-- Export de la structure de table nfc. transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compte` int(11) NOT NULL,
  `type_transaction` varchar(7) NOT NULL,
  `montant` double NOT NULL,
  `date` date NOT NULL,
  `id_commande` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compte` (`id_compte`,`id_commande`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.transaction : ~0 rows (environ)
DELETE FROM `transaction`;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;


-- Export de la structure de table nfc. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_nfc` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `tel` (`tel`),
  KEY `fk_role_id` (`id_role`),
  KEY `fk_service_id` (`id_service`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_service_id` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Export de données de la table nfc.utilisateur : ~5 rows (environ)
DELETE FROM `utilisateur`;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `tel`, `id_service`, `id_role`, `id_nfc`, `createdat`, `updatedat`) VALUES
	(4, 'soso', 'sosoben', 'sosodu27@msn.com', '0147852368', 1, 1, 0, '2016-03-20 13:56:28', '2016-03-27 23:07:05'),
	(15, 'admin', 'admin', 'admin@nfc.com', '0214587963', 1, 1, 0, '2016-03-27 23:12:08', '2016-03-27 23:12:08'),
	(16, 'user', 'user', 'user@user.com', '0321654987', 1, 2, 0, '2016-03-27 23:16:33', '2016-03-27 23:16:33'),
	(17, 'toto', 'toto', 'toto@nfc.com', '0142536987', 2, 2, 0, '2016-03-27 23:22:27', '2016-03-27 23:22:27'),
	(19, 'tutu', 'tutu', 'tutu@nfc.com', '0987456321', 1, 2, 0, '2016-03-27 23:27:36', '2016-03-27 23:27:36');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
