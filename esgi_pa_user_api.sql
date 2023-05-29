-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 29 mai 2023 à 23:33
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
-- Structure de la table `skin`
--

CREATE TABLE `skin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_added` date DEFAULT curdate(),
  `character` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `imagepath` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skin`
--

INSERT INTO `skin` (`id`, `name`, `data_added`, `character`, `price`, `description`, `imagepath`) VALUES
(1, 'Warrior of light Crow', '2023-05-24', 1, 500, '0', '\"C:\\Users\\antoine\\Pictures\\959897734037520484.jpeg\"');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `money`) VALUES
(0, 'kkk', 'kkk', 'kkk', 0),
(1, 'test', 'test', 'test', 99999),
(2, 'aesilff', 'grosrat@gmail.com', 'ratatouille', 0),
(5, 'ttt', 'ttt', 'ttt', 0),
(7, 'nnn', 'nnn', 'nnn', 0),
(26, 'tt', 'tt', 'tt', 0),
(57, 'iii', 'iii', 'iii', 0),
(547, 'xxxxx', 'xxxxx', 'xxxxx', 0),
(683, 'ggg', 'ggg', 'ggg', 0),
(933, 'oooo', 'oooo', 'oooo', 0),
(5575, 'ff', '', 'ff', 0),
(8225744, 'yyy', 'yyy', 'yyy', 0),
(2147483647, 'ffe', 'fefe', 'fef', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`character_id`);

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
-- AUTO_INCREMENT pour la table `character`
--
ALTER TABLE `character`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `skin`
--
ALTER TABLE `skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

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
