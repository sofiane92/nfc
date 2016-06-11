-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.6.22 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Export de données de la table nfc.article : ~5 rows (environ)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `tye_article`, `nom_article`, `prix_article`, `createdat`, `updatedat`) VALUES
	(1, 'plat', 'couscous', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'plat', 'ratatouille', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'plat', 'omelette', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 'plat', 'steack', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 'plat', 'entrecote', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Export de données de la table nfc.commande : ~2 rows (environ)
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`id_commande`, `id_compte`, `date_commande`, `montant`, `createdat`, `updatedat`) VALUES
	(1, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 2, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Export de données de la table nfc.compte : ~6 rows (environ)
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
INSERT INTO `compte` (`id`, `id_utilisateur`, `argent`, `active`, `createdat`, `updatedat`) VALUES
	(1, 2, 11, 1, '2016-03-01 00:00:00', '2016-03-01 00:00:00'),
	(2, 29, 0, 0, '2016-03-28 00:00:27', '2016-03-28 00:00:55'),
	(3, 30, 0, 0, '2016-03-28 17:40:45', '2016-03-28 17:42:19'),
	(4, 31, 0, 0, '2016-03-28 17:43:15', '2016-03-28 17:44:27'),
	(5, 32, 0, 0, '2016-03-28 17:49:31', '2016-03-28 18:19:06'),
	(6, 33, 0, 0, '2016-03-28 18:30:30', '2016-03-29 09:20:52');
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;

-- Export de données de la table nfc.connexion : 5 rows
/*!40000 ALTER TABLE `connexion` DISABLE KEYS */;
INSERT INTO `connexion` (`id`, `login`, `password`, `salt`, `createdat`, `updatedat`, `id_utilisateur`) VALUES
	(3, 'aadmin', '$2a$10$XoaCnf3Uk/Ag7mcIh0ZdtuXsa8fRpz6TH7BrL.rJcBc/8qiOQ9KlK', '$2a$10$XoaCnf3Uk/Ag7mcIh0Zdtu', '2016-03-27 23:12:09', '2016-03-27 23:12:09', 15),
	(2, 'jinj', 'jnkjnl', 'kj,;', '2016-03-03 00:00:00', '2016-03-03 00:00:00', 3),
	(4, 'uuser', '$2a$10$a5K2pTyivYdpIHjZEZOv2evqbeDPesnYK1dwgy1nPXRanAQWNxNOe', '$2a$10$a5K2pTyivYdpIHjZEZOv2e', '2016-03-27 23:16:33', '2016-03-27 23:16:33', 16),
	(5, 'ttoto', '$2a$10$uXZA68.L.aUM7S7qbybEd.M2/aoLSh8Abvg3hqNQriYIK3ePIbsRi', '$2a$10$uXZA68.L.aUM7S7qbybEd.', '2016-03-27 23:22:28', '2016-03-27 23:22:28', 17),
	(7, 'ttutu', '$2a$10$mAjN.jJmiAtohfiycsPyIOcmtjlvKuxcEdoLHtf2xMLHFp8DMC61q', '$2a$10$mAjN.jJmiAtohfiycsPyIO', '2016-03-27 23:27:36', '2016-03-27 23:27:36', 19);
/*!40000 ALTER TABLE `connexion` ENABLE KEYS */;

-- Export de données de la table nfc.emplacement : ~5 rows (environ)
/*!40000 ALTER TABLE `emplacement` DISABLE KEYS */;
INSERT INTO `emplacement` (`id`, `nom_emplacement`, `type`, `nb_place`, `createdat`, `updatedat`) VALUES
	(1, 'Salle 1', 'Salle', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Salle 2', 'Salle', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'Salle3', 'Salle', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 'Restaurant 1', 'Restaurant', 150, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 'Restaurant 2', 'Restaurant', 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `emplacement` ENABLE KEYS */;

-- Export de données de la table nfc.lignecommande : ~7 rows (environ)
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

-- Export de données de la table nfc.localisation : ~13 rows (environ)
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

-- Export de données de la table nfc.pointage : ~0 rows (environ)
/*!40000 ALTER TABLE `pointage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pointage` ENABLE KEYS */;

-- Export de données de la table nfc.role : ~2 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `nom_role`, `createdat`, `updatedat`) VALUES
	(1, 'ADMIN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'USER', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Export de données de la table nfc.service : ~2 rows (environ)
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id`, `nom_service`, `createdat`, `updatedat`) VALUES
	(1, 'Informatique', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'RH', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;

-- Export de données de la table nfc.tempstravail : ~0 rows (environ)
/*!40000 ALTER TABLE `tempstravail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempstravail` ENABLE KEYS */;

-- Export de données de la table nfc.transaction : ~0 rows (environ)
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- Export de données de la table nfc.utilisateur : ~5 rows (environ)
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
