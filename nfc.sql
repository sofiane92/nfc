-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Mar 19 Avril 2016 à 22:15
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
  `tye_article` varchar(32) NOT NULL,
  `nom_article` varchar(32) NOT NULL,
  `prix_article` double NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `tye_article`, `nom_article`, `prix_article`, `createdat`, `updatedat`) VALUES
(1, 'plat', 'couscous', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'plat', 'ratatouille', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'plat', 'omelette', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'plat', 'steack', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'plat', 'entrecote', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_compte`, `date_commande`, `montant`, `createdat`, `updatedat`) VALUES
(1, 1, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, '0000-00-00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`id`, `id_utilisateur`, `argent`, `active`, `createdat`, `updatedat`) VALUES
(1, 2, 11, 1, '2016-03-01 00:00:00', '2016-03-01 00:00:00'),
(2, 29, 0, 0, '2016-03-28 00:00:27', '2016-03-28 00:00:55'),
(3, 30, 0, 0, '2016-03-28 17:40:45', '2016-03-28 17:42:19'),
(4, 31, 0, 0, '2016-03-28 17:43:15', '2016-03-28 17:44:27'),
(5, 32, 0, 0, '2016-03-28 17:49:31', '2016-03-28 18:19:06'),
(6, 33, 0, 0, '2016-03-28 18:30:30', '2016-03-29 09:20:52');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`id`, `login`, `password`, `salt`, `createdat`, `updatedat`, `id_utilisateur`) VALUES
(3, 'aadmin', '$2a$10$XoaCnf3Uk/Ag7mcIh0ZdtuXsa8fRpz6TH7BrL.rJcBc/8qiOQ9KlK', '$2a$10$XoaCnf3Uk/Ag7mcIh0Zdtu', '2016-03-27 23:12:09', '2016-03-27 23:12:09', 15),
(2, 'jinj', 'jnkjnl', 'kj,;', '2016-03-03 00:00:00', '2016-03-03 00:00:00', 3),
(4, 'uuser', '$2a$10$a5K2pTyivYdpIHjZEZOv2evqbeDPesnYK1dwgy1nPXRanAQWNxNOe', '$2a$10$a5K2pTyivYdpIHjZEZOv2e', '2016-03-27 23:16:33', '2016-03-27 23:16:33', 16),
(5, 'ttoto', '$2a$10$uXZA68.L.aUM7S7qbybEd.M2/aoLSh8Abvg3hqNQriYIK3ePIbsRi', '$2a$10$uXZA68.L.aUM7S7qbybEd.', '2016-03-27 23:22:28', '2016-03-27 23:22:28', 17),
(7, 'ttutu', '$2a$10$mAjN.jJmiAtohfiycsPyIOcmtjlvKuxcEdoLHtf2xMLHFp8DMC61q', '$2a$10$mAjN.jJmiAtohfiycsPyIO', '2016-03-27 23:27:36', '2016-03-27 23:27:36', 19);

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
(3, 'Salle3', 'Salle', 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Restaurant 1', 'Restaurant', 150, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Restaurant 2', 'Restaurant', 250, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(1, 1, 4, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 2, 5, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 3, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 4, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 5, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 6, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(1, 15, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 16, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 17, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 19, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 16, '2016-04-14 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 17, '2016-04-15 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, '2016-04-16 10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 15, '2016-04-16 09:10:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 16, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 17, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 19, '2016-04-16 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 19, '2016-04-17 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

CREATE TABLE `pointage` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_entree` date NOT NULL,
  `date_sorti` date NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `type_transaction` varchar(7) NOT NULL,
  `montant` double NOT NULL,
  `date` date NOT NULL,
  `id_commande` int(11) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `tel`, `id_service`, `id_role`, `id_nfc`, `createdat`, `updatedat`) VALUES
(4, 'soso', 'sosoben', 'sosodu27@msn.com', '0147852368', 1, 1, 0, '2016-03-20 13:56:28', '2016-03-27 23:07:05'),
(15, 'admin', 'admin', 'admin@nfc.com', '0214587963', 1, 1, 0, '2016-03-27 23:12:08', '2016-03-27 23:12:08'),
(16, 'user', 'user', 'user@user.com', '0321654987', 1, 2, 0, '2016-03-27 23:16:33', '2016-03-27 23:16:33'),
(17, 'toto', 'toto', 'toto@nfc.com', '0142536987', 2, 2, 0, '2016-03-27 23:22:27', '2016-03-27 23:22:27'),
(19, 'tutu', 'tutu', 'tutu@nfc.com', '0987456321', 1, 2, 0, '2016-03-27 23:27:36', '2016-03-27 23:27:36');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `connexion`
--
ALTER TABLE `connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
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
