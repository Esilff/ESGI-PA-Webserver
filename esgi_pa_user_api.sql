-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 06 juil. 2023 à 21:09
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pute`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `id` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_skin` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `achat`
--

INSERT INTO `achat` (`id`, `id_user`, `id_skin`, `date`, `price`) VALUES
(1, 1, 1, '2023-07-06', 1),
(2, 1, 12, '2023-07-06', 1000),
(3, 1, 1, '2023-07-06', 500),
(4, 1, 12, '2023-07-06', 1000),
(5, 1, 1, '2023-07-06', 500),
(6, 1, 1, '2023-07-06', 500),
(7, 1, 12, '2023-07-06', 1000),
(8, 1, 12, '2023-07-06', 1000),
(9, 1, 12, '2023-07-06', 1000),
(10, 1, 12, '2023-07-06', 1000),
(11, 1, 12, '2023-07-06', 1000),
(12, 1, 1, '2023-07-06', 500),
(13, 1, 1, '2023-07-06', 500),
(14, 1, 12, '2023-07-06', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `character`
--

CREATE TABLE `character` (
  `character_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `silvervalue` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date_added` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `character`
--

INSERT INTO `character` (`character_id`, `name`, `description`, `silvervalue`, `value`, `date_added`) VALUES
(1, 'Crow', 'A mecanical elf mercenary engaged to obliterate his ennemies', 1350, 420, '2023-05-24'),
(2, 'Rider', 'The coolest racer in the entire world, faster the sound', 1350, 420, '2023-05-24'),
(3, 'Dummy', 'This dummy is hot', 450, 225, '2023-05-24'),
(4, 'Harpagon', 'The richest goblin in the city of Revel', 1668, 500, '2023-05-24');

-- --------------------------------------------------------

--
-- Structure de la table `chrono`
--

CREATE TABLE `chrono` (
  `id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `Time_tot` varchar(255) NOT NULL,
  `B_Time_Tour` varchar(255) NOT NULL,
  `Map_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chronoplayer`
--

CREATE TABLE `chronoplayer` (
  `id` int(11) NOT NULL,
  `id_player` varchar(255) NOT NULL,
  `name_player` varchar(255) NOT NULL,
  `best_tour` varchar(255) NOT NULL,
  `Time_total` varchar(255) NOT NULL,
  `map_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chronoplayer`
--

INSERT INTO `chronoplayer` (`id`, `id_player`, `name_player`, `best_tour`, `Time_total`, `map_name`) VALUES
(1, '111', 'toto', '00:38:53', '01:56:67', 'map1'),
(2, '111', 'toto', '00:38:53', '01:56:67', 'map1'),
(3, '111', 'toto', '00:38:53', '01:56:67', 'map1');

-- --------------------------------------------------------

--
-- Structure de la table `skin`
--

CREATE TABLE `skin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `data_added` date DEFAULT curdate(),
  `character` int(11) NOT NULL,
  `imagepath` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skin`
--

INSERT INTO `skin` (`id`, `name`, `value`, `data_added`, `character`, `imagepath`, `description`, `price`) VALUES
(1, 'Warrior of light Crow', 1, '2023-05-24', 1, '\"C:\\Users\\antoine\\Pictures\\959897734037520484.jpeg\"', 'test', 500),
(12, 'tuez moi', 5635, '2023-06-23', 4, 'C:\\Users\\antoine\\Pictures\\untitled.png', 'eh je suis la maj enculé', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `money`) VALUES
(1, 'test', 'test', 'test', 94999),
(2, 'aesilff', 'grosrat@gmail.com', 'ratatouille', 0),
(6, 'ttt', 'ttt', 'ttt', 0),
(39, 'ouais c\'est greg', 'ouais c\'est greg', 'ouais c\'est greg', 0),
(66, 'ggg', 'ggg', 'ggg', 0),
(2147483648, 'rrrrrrr', 'rrrrrrr', 'rrrrrrr', 0),
(2147483649, 'aled', 'aled', 'aled', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`character_id`);

--
-- Index pour la table `chrono`
--
ALTER TABLE `chrono`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chronoplayer`
--
ALTER TABLE `chronoplayer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `skin`
--
ALTER TABLE `skin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_character_id` (`character`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achat`
--
ALTER TABLE `achat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `character`
--
ALTER TABLE `character`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chronoplayer`
--
ALTER TABLE `chronoplayer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `skin`
--
ALTER TABLE `skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483650;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `skin`
--
ALTER TABLE `skin`
  ADD CONSTRAINT `fk_character_id` FOREIGN KEY (`character`) REFERENCES `character` (`character_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
