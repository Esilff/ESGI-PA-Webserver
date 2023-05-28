-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 28 mai 2023 à 13:47
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
  `character_id` INT AUTO_INCREMENT PRIMARY KEY,
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
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `data_added` date DEFAULT curdate(),
  `character` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skin`
--

INSERT INTO `skin` (`id`, `name`, `value`, `data_added`, `character`) VALUES
(1, 'Warrior of light Crow', 1350, '2023-05-24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(0, 'kkk', 'kkk', 'kkk'),
(1, 'test', 'test', 'test'),
(2, 'aesilff', 'grosrat@gmail.com', 'ratatouille'),
(26, 'tt', 'tt', 'tt'),
(57, 'iii', 'iii', 'iii'),
(2147483647, 'ffe', 'fefe', 'fef');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `character`
--

--
-- Index pour la table `skin`
--
ALTER TABLE `skin`
  ADD KEY `fk_character_id` (`character`);

--
-- Index pour la table `users`
--

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
