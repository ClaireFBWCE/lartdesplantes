-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 16 déc. 2019 à 07:25
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
-- Base de données :  `cosmeplanet_bdd`
--
CREATE DATABASE IF NOT EXISTS `cosmeplanet_bdd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cosmeplanet_bdd`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent`, `name`, `description`, `picture`, `alt`, `created_at`) VALUES
(1, 0, 'Corps', 'description de la catégorie : Corps', 'https://picsum.photos/id/170/200/200', 'image alt : Corps', '2019-12-16 08:22:24'),
(2, 1, 'Crème', 'description de la catégorie : Crème', 'https://picsum.photos/id/171/200/200', 'image alt : Crème', '2019-12-16 08:22:24'),
(3, 0, 'Visage', 'description de la catégorie : Visage', 'https://picsum.photos/id/170/200/200', 'image alt : Visage', '2019-12-16 08:22:25'),
(4, 3, 'Nettoyant et exfoliant', 'description de la catégorie : Nettoyant et exfoliant', 'https://picsum.photos/id/171/200/200', 'image alt : Nettoyant et exfoliant', '2019-12-16 08:22:25'),
(5, 0, 'Cheveux', 'description de la catégorie : Cheveux', 'https://picsum.photos/id/170/200/200', 'image alt : Cheveux', '2019-12-16 08:22:25'),
(6, 5, 'Shampoing', 'description de la catégorie : Shampoing', 'https://picsum.photos/id/171/200/200', 'image alt : Shampoing', '2019-12-16 08:22:25'),
(7, 5, 'Shampoings solides', 'description de la catégorie : Shampoings solides', 'https://picsum.photos/id/171/200/200', 'image alt : Shampoings solides', '2019-12-16 08:22:25'),
(8, 5, 'Masque', 'description de la catégorie : Masque', 'https://picsum.photos/id/171/200/200', 'image alt : Masque', '2019-12-16 08:22:26'),
(9, 5, 'Après-shampoing', 'description de la catégorie : Après-shampoing', 'https://picsum.photos/id/171/200/200', 'image alt : Après-shampoing', '2019-12-16 08:22:26'),
(10, 0, 'Maquillage', 'description de la catégorie : Maquillage', 'https://picsum.photos/id/170/200/200', 'image alt : Maquillage', '2019-12-16 08:22:26'),
(11, 10, 'Yeux', 'description de la catégorie : Yeux', 'https://picsum.photos/id/171/200/200', 'image alt : Yeux', '2019-12-16 08:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `streetnumber` int(11) DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feature`
--

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `feature`
--

INSERT INTO `feature` (`id`, `name`) VALUES
(1, 'Huiles essentielles'),
(2, 'Femmes enceintes'),
(3, 'Dermo sensitive'),
(4, 'Conserver au frais');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `picture`, `alt`, `active`, `created_at`) VALUES
(1, 'Huile d\'olive', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d\'olive', 1, '2019-12-16 08:22:24'),
(2, 'Amande douce', 'https://picsum.photos/id/171/200/200', 'image alt : Amande douce', 1, '2019-12-16 08:22:24'),
(3, 'Aloe vera', 'https://picsum.photos/id/171/200/200', 'image alt : Aloe vera', 1, '2019-12-16 08:22:24'),
(4, 'Résine de myrrhe', 'https://picsum.photos/id/171/200/200', 'image alt : Résine de myrrhe', 1, '2019-12-16 08:22:24'),
(5, 'Absolue de vanille', 'https://picsum.photos/id/171/200/200', 'image alt : Absolue de vanille', 1, '2019-12-16 08:22:24'),
(6, 'Huile essentielle de patchouli', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de patchouli', 1, '2019-12-16 08:22:24'),
(7, 'Huile d\'olive bio', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d\'olive bio', 1, '2019-12-16 08:22:24'),
(8, 'Beurre de cacao', 'https://picsum.photos/id/171/200/200', 'image alt : Beurre de cacao', 1, '2019-12-16 08:22:24'),
(9, 'Eau de rose', 'https://picsum.photos/id/171/200/200', 'image alt : Eau de rose', 1, '2019-12-16 08:22:24'),
(10, 'Pamplemousse', 'https://picsum.photos/id/171/200/200', 'image alt : Pamplemousse', 1, '2019-12-16 08:22:25'),
(11, 'Beurre de karité', 'https://picsum.photos/id/171/200/200', 'image alt : Beurre de karité', 1, '2019-12-16 08:22:25'),
(12, 'Huile de jojoba', 'https://picsum.photos/id/171/200/200', 'image alt : Huile de jojoba', 1, '2019-12-16 08:22:25'),
(13, 'Fleur d\'oranger', 'https://picsum.photos/id/171/200/200', 'image alt : Fleur d\'oranger', 1, '2019-12-16 08:22:25'),
(14, 'Bergamote', 'https://picsum.photos/id/171/200/200', 'image alt : Bergamote', 1, '2019-12-16 08:22:25'),
(15, 'Huile essentielle de romarin', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de romarin', 1, '2019-12-16 08:22:25'),
(16, 'Lavande', 'https://picsum.photos/id/171/200/200', 'image alt : Lavande', 1, '2019-12-16 08:22:25'),
(17, 'Camomille bleue', 'https://picsum.photos/id/171/200/200', 'image alt : Camomille bleue', 1, '2019-12-16 08:22:25'),
(18, 'Kaolin', 'https://picsum.photos/id/171/200/200', 'image alt : Kaolin', 1, '2019-12-16 08:22:25'),
(19, 'Huile essentielle de lavande', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de lavande', 1, '2019-12-16 08:22:25'),
(20, 'Orchidée colombe', 'https://picsum.photos/id/171/200/200', 'image alt : Orchidée colombe', 1, '2019-12-16 08:22:25'),
(21, 'Huile d\'amande douce', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d\'amande douce', 1, '2019-12-16 08:22:25'),
(22, 'Huile essentielle d\'ylang-ylang', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle d\'ylang-ylang', 1, '2019-12-16 08:22:25'),
(23, 'Miel', 'https://picsum.photos/id/171/200/200', 'image alt : Miel', 1, '2019-12-16 08:22:25'),
(24, 'Huile essentielle de menthe poivrée', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de menthe poivrée', 1, '2019-12-16 08:22:25'),
(25, 'Huile essentielle de tagète et de chlorophylle', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de tagète et de chlorophylle', 1, '2019-12-16 08:22:25'),
(26, 'Orties', 'https://picsum.photos/id/171/200/200', 'image alt : Orties', 1, '2019-12-16 08:22:25'),
(27, 'Romarin', 'https://picsum.photos/id/171/200/200', 'image alt : Romarin', 1, '2019-12-16 08:22:25'),
(28, 'Vinaigre de son de riz', 'https://picsum.photos/id/171/200/200', 'image alt : Vinaigre de son de riz', 1, '2019-12-16 08:22:25'),
(29, 'Huile essentielle de camomille', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de camomille', 1, '2019-12-16 08:22:25'),
(30, 'Absolue de cire', 'https://picsum.photos/id/171/200/200', 'image alt : Absolue de cire', 1, '2019-12-16 08:22:25'),
(31, 'Mucilage de graine de lin', 'https://picsum.photos/id/171/200/200', 'image alt : Mucilage de graine de lin', 1, '2019-12-16 08:22:25'),
(32, 'Huile essentielle de néroli', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de néroli', 1, '2019-12-16 08:22:25'),
(33, 'Gros sel marin', 'https://picsum.photos/id/171/200/200', 'image alt : Gros sel marin', 1, '2019-12-16 08:22:25'),
(34, 'Huile essentielle de bergamote', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de bergamote', 1, '2019-12-16 08:22:25'),
(35, 'Huile essentielle de citron', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de citron', 1, '2019-12-16 08:22:25'),
(36, 'Noix de coco', 'https://picsum.photos/id/171/200/200', 'image alt : Noix de coco', 1, '2019-12-16 08:22:25'),
(37, 'Papaye fraîche', 'https://picsum.photos/id/171/200/200', 'image alt : Papaye fraîche', 1, '2019-12-16 08:22:25'),
(38, 'Infusion de graines de lin', 'https://picsum.photos/id/171/200/200', 'image alt : Infusion de graines de lin', 1, '2019-12-16 08:22:25'),
(39, 'Huile essentielle de cade', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de cade', 1, '2019-12-16 08:22:25'),
(40, 'Huile essentielle de rose', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de rose', 1, '2019-12-16 08:22:25'),
(41, 'Jus de citron frais', 'https://picsum.photos/id/171/200/200', 'image alt : Jus de citron frais', 1, '2019-12-16 08:22:25'),
(42, 'Olives vertes', 'https://picsum.photos/id/171/200/200', 'image alt : Olives vertes', 1, '2019-12-16 08:22:25'),
(43, 'Absolue de romarin', 'https://picsum.photos/id/171/200/200', 'image alt : Absolue de romarin', 1, '2019-12-16 08:22:25'),
(44, 'Huile essentielle de baie de genièvre', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de baie de genièvre', 1, '2019-12-16 08:22:25'),
(45, 'Huile d’olive bio extra vierge', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d’olive bio extra vierge', 1, '2019-12-16 08:22:26'),
(46, 'Huile de germe de blé', 'https://picsum.photos/id/171/200/200', 'image alt : Huile de germe de blé', 1, '2019-12-16 08:22:26'),
(47, 'Avocat', 'https://picsum.photos/id/171/200/200', 'image alt : Avocat', 1, '2019-12-16 08:22:26'),
(48, 'Crème de noix de cajou', 'https://picsum.photos/id/171/200/200', 'image alt : Crème de noix de cajou', 1, '2019-12-16 08:22:26'),
(49, 'Huile de noix de coco', 'https://picsum.photos/id/171/200/200', 'image alt : Huile de noix de coco', 1, '2019-12-16 08:22:26'),
(50, 'Huile essentielle d\'amande', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle d\'amande', 1, '2019-12-16 08:22:26'),
(51, 'Gel d’agar-agar', 'https://picsum.photos/id/171/200/200', 'image alt : Gel d’agar-agar', 1, '2019-12-16 08:22:26'),
(52, 'Melon cantaloup frais', 'https://picsum.photos/id/171/200/200', 'image alt : Melon cantaloup frais', 1, '2019-12-16 08:22:26'),
(53, 'Huile d\'avocat', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d\'avocat', 1, '2019-12-16 08:22:26'),
(54, 'Huile d’olive', 'https://picsum.photos/id/171/200/200', 'image alt : Huile d’olive', 1, '2019-12-16 08:22:26'),
(55, 'Néroli enivrant', 'https://picsum.photos/id/171/200/200', 'image alt : Néroli enivrant', 1, '2019-12-16 08:22:26'),
(56, 'Lait d\'amande', 'https://picsum.photos/id/171/200/200', 'image alt : Lait d\'amande', 1, '2019-12-16 08:22:26'),
(57, 'Huile essentielle de pamplemousse', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de pamplemousse', 1, '2019-12-16 08:22:26'),
(58, 'Talc', 'https://picsum.photos/id/171/200/200', 'image alt : Talc', 1, '2019-12-16 08:22:26'),
(59, 'Cire de carnauba', 'https://picsum.photos/id/171/200/200', 'image alt : Cire de carnauba', 1, '2019-12-16 08:22:26'),
(60, 'Cire du Japon', 'https://picsum.photos/id/171/200/200', 'image alt : Cire du Japon', 1, '2019-12-16 08:22:26'),
(61, 'Gel d\'aloe vera', 'https://picsum.photos/id/171/200/200', 'image alt : Gel d\'aloe vera', 1, '2019-12-16 08:22:26'),
(62, 'Huile essentielle de bois de cèdre', 'https://picsum.photos/id/171/200/200', 'image alt : Huile essentielle de bois de cèdre', 1, '2019-12-16 08:22:26'),
(63, 'Beurre de karité bio', 'https://picsum.photos/id/171/200/200', 'image alt : Beurre de karité bio', 1, '2019-12-16 08:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191214144144', '2019-12-16 07:21:58');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `added` datetime NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `must_have` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `short_description`, `long_description`, `picture`, `alt`, `active`, `added`, `price`, `discount`, `created_at`, `must_have`) VALUES
(1, NULL, 'Lait hydratant', 'Le parfum de ce Lait pour le corps vous invite à un voyage à la recherche de vous-même. Un trio riche, réchauffant et rassurant de patchouli, myrrhe et vanille se dépose sans effort sur votre peau.', 'Le parfum de ce Lait pour le corps vous invite à un voyage à la recherche de vous-même. Un trio riche, réchauffant et rassurant de patchouli, myrrhe et vanille se dépose sans effort sur votre peau.', 'https://picsum.photos/id/42/200/200', 'image alt : Lait hydratant', 1, '2019-12-16 08:22:24', 27, 4.05, '2019-12-16 08:22:24', 0),
(2, NULL, 'Crème soie', 'Crème au lait d\'avoine aux senteurs fraîches et herbacées et à la consistence d\'une véritable soie liquide.', 'Crème au lait d\'avoine aux senteurs fraîches et herbacées et à la consistence d\'une véritable soie liquide.', 'https://picsum.photos/id/42/200/200', 'image alt : Crème soie', 1, '2019-12-16 08:22:24', 25, 0, '2019-12-16 08:22:24', 0),
(3, NULL, 'Crème revitalisante', 'Revitalisez votre peau avec une bonne dose d\'agrumes tonifiants. Donnez un coup de fouet à votre esprit grâce à la purée d\'orange aux senteurs acidulées et au beurre de caca.', 'Revitalisez votre peau avec une bonne dose d\'agrumes tonifiants. Donnez un coup de fouet à votre esprit grâce à la purée d\'orange aux senteurs acidulées et au beurre de caca.', 'https://picsum.photos/id/42/200/200', 'image alt : Crème revitalisante', 1, '2019-12-16 08:22:25', 26, 0, '2019-12-16 08:22:25', 0),
(4, NULL, 'Crème rafraichissante', 'Cette Crème pour le corps vous enveloppe dans un parfum printanier verdoyant et rafraîchissant grâce à l\'absolue de fleur d\'oranger et la bergamote acidulée pour garder le sourire en toute circonstance.', 'Cette Crème pour le corps vous enveloppe dans un parfum printanier verdoyant et rafraîchissant grâce à l\'absolue de fleur d\'oranger et la bergamote acidulée pour garder le sourire en toute circonstance.', 'https://picsum.photos/id/42/200/200', 'image alt : Crème rafraichissante', 1, '2019-12-16 08:22:25', 6, 0, '2019-12-16 08:22:25', 0),
(5, NULL, 'Nettoyant apaisant', 'Un mélange de lavande équilibrante, de camomille bleue réparatrice et de kaolin. es amandes finement moulues exfolient la peau, tandis que l\'huile essentielle de lavande et l\'absolue de rose y déposent un parfum enchanteur.', 'Un mélange de lavande équilibrante, de camomille bleue réparatrice et de kaolin. es amandes finement moulues exfolient la peau, tandis que l\'huile essentielle de lavande et l\'absolue de rose y déposent un parfum enchanteur.', 'https://picsum.photos/id/42/200/200', 'image alt : Nettoyant apaisant', 1, '2019-12-16 08:22:25', 25, 0, '2019-12-16 08:22:25', 0),
(6, NULL, 'Nettoyant adoucissant', 'Iluminez votre peau avec ce lait nettoyant, apaisant et hydratant à l\'huile d\'amande et à l\'orchidée colombe. Cette émulsion contient un mélange exquis d\'huile essentielles florales qui illuminent le teint et éliminent les impuretés et les traces de maquillage. ', 'Iluminez votre peau avec ce lait nettoyant, apaisant et hydratant à l\'huile d\'amande et à l\'orchidée colombe. Cette émulsion contient un mélange exquis d\'huile essentielles florales qui illuminent le teint et éliminent les impuretés et les traces de maquillage. ', 'https://picsum.photos/id/42/200/200', 'image alt : Nettoyant adoucissant', 1, '2019-12-16 08:22:25', 23, 0, '2019-12-16 08:22:25', 0),
(7, NULL, 'Exfoliant mentholé', 'Exfoliant multi-usages est composé d\'huile essentielle de menthe poivrée stimulante, d\'huile essentielle de tagète et de chlorophylle pour prendre soin de votre peau. Les graines d\'onagre et les haricots azuki exfolient délicatement la peau au moment du rinçage', 'Exfoliant multi-usages est composé d\'huile essentielle de menthe poivrée stimulante, d\'huile essentielle de tagète et de chlorophylle pour prendre soin de votre peau. Les graines d\'onagre et les haricots azuki exfolient délicatement la peau au moment du rinçage', 'https://picsum.photos/id/42/200/200', 'image alt : Exfoliant mentholé', 1, '2019-12-16 08:22:25', 15, 0, '2019-12-16 08:22:25', 0),
(8, NULL, 'Nettoyant pureté', 'Eliminez saleté et graisse, pour une peau propre, brillante et resplendissante. L\'huile essentielle de camomille commune et l\'absolue de rose équilibrent le teint. Le son de riz et les amandes moulues exfolient délicatement la peau. ', 'Eliminez saleté et graisse, pour une peau propre, brillante et resplendissante. L\'huile essentielle de camomille commune et l\'absolue de rose équilibrent le teint. Le son de riz et les amandes moulues exfolient délicatement la peau. ', 'https://picsum.photos/id/42/200/200', 'image alt : Nettoyant pureté', 1, '2019-12-16 08:22:25', 16, 0, '2019-12-16 08:22:25', 0),
(9, NULL, 'Shampoing brillance au miel', 'Ce shampoing est composé à plus de 50% de miel issu du commerce équitable qui nourrit en profondeur et fait briller votre chevelure.. Le miel est bien plus qu\'une sucrerie naturelle, et c\'est pourquoi nous en avons utilisé autant dans ce produit : auto-conservé et naturellement humectant, il aide vos cheveux à attirer et à préserver l\'hydratation.', 'Ce shampoing est composé à plus de 50% de miel issu du commerce équitable qui nourrit en profondeur et fait briller votre chevelure.. Le miel est bien plus qu\'une sucrerie naturelle, et c\'est pourquoi nous en avons utilisé autant dans ce produit : auto-conservé et naturellement humectant, il aide vos cheveux à attirer et à préserver l\'hydratation.', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing brillance au miel', 1, '2019-12-16 08:22:25', 14, 0, '2019-12-16 08:22:25', 0),
(10, NULL, 'Shampoing volumateur', 'Faites monter le volume et boostez votre chevelure avec du sel marin, du miel nourrissant et du citron de Sicile rafraîchissant. L\'aquafaba riche en protéines et l\'huile d\'olive équitable améliorent l\'élasticité, pour des cheveux moins cassants et plus faciles à coiffer.', 'Faites monter le volume et boostez votre chevelure avec du sel marin, du miel nourrissant et du citron de Sicile rafraîchissant. L\'aquafaba riche en protéines et l\'huile d\'olive équitable améliorent l\'élasticité, pour des cheveux moins cassants et plus faciles à coiffer.', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing volumateur', 1, '2019-12-16 08:22:25', 26, 0, '2019-12-16 08:22:25', 0),
(11, NULL, 'Shampoing adoucissant', 'L\'huile de noix de coco extra vierge adoucissante, de la vanille réchauffante, du vétiver et du benjoin réconfortants... Riches en protéines, l\'infusion de graines de lin, le tofu soyeux et l\'aquafaba renforcent et nourrissent la chevelure. La noix de coco et le beurre d\'avocat s\'associent pour vous procurer éclat, force et hydratation. \n \n\n', 'L\'huile de noix de coco extra vierge adoucissante, de la vanille réchauffante, du vétiver et du benjoin réconfortants... Riches en protéines, l\'infusion de graines de lin, le tofu soyeux et l\'aquafaba renforcent et nourrissent la chevelure. La noix de coco et le beurre d\'avocat s\'associent pour vous procurer éclat, force et hydratation. \n \n\n', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing adoucissant', 1, '2019-12-16 08:22:25', 18, 0, '2019-12-16 08:22:25', 0),
(12, NULL, 'Shampoing apaisant', 'Ce shampoing va droit au but pour apaiser votre cuir chevelu. L\'huile essentielle de cade est dérivée du genévrier et est traditionnellement utilisée pour traiter les psoriasis, les pellicules et l\'eczéma. Les pétales de rose et de souci apaisent la peau et aident à soulager les rougeurs, pour un cuir chevelu au meilleur de sa forme.', 'Ce shampoing va droit au but pour apaiser votre cuir chevelu. L\'huile essentielle de cade est dérivée du genévrier et est traditionnellement utilisée pour traiter les psoriasis, les pellicules et l\'eczéma. Les pétales de rose et de souci apaisent la peau et aident à soulager les rougeurs, pour un cuir chevelu au meilleur de sa forme.', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing apaisant', 1, '2019-12-16 08:22:25', 20, 3, '2019-12-16 08:22:25', 0),
(13, NULL, 'Shampoing billance', 'Ce shampoing riche en agrume est la clé de votre quête vers des cheveux plus éclatants que jamais. Les olives vertes améliorent l\'élasticité des cheveux, tandis que l\'absolue de romarin nettoyante, l\'huile essentielle de citron de Sicile et le jus de citron fraîchement pressé les font briller de la racine à la pointe.', 'Ce shampoing riche en agrume est la clé de votre quête vers des cheveux plus éclatants que jamais. Les olives vertes améliorent l\'élasticité des cheveux, tandis que l\'absolue de romarin nettoyante, l\'huile essentielle de citron de Sicile et le jus de citron fraîchement pressé les font briller de la racine à la pointe.', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing billance', 1, '2019-12-16 08:22:25', 28, 0, '2019-12-16 08:22:25', 0),
(14, NULL, 'Shampoing régulateur', 'Ce shampoing est parfait pour les cheveux qui ont besoin d\'un grand nettoyage. Les baies de genièvre régulent la production de sébum et allègent le cuir chevelu, que les huiles essentielles de lavande apaisante et de romarin antibactérien apaisent et nettoient. Les huiles essentielles de citron et de citron vert apportent de la brillance en aidant les cuticules du cheveu à se reprofiler et à renvoyer la lumière.', 'Ce shampoing est parfait pour les cheveux qui ont besoin d\'un grand nettoyage. Les baies de genièvre régulent la production de sébum et allègent le cuir chevelu, que les huiles essentielles de lavande apaisante et de romarin antibactérien apaisent et nettoient. Les huiles essentielles de citron et de citron vert apportent de la brillance en aidant les cuticules du cheveu à se reprofiler et à renvoyer la lumière.', 'https://picsum.photos/id/42/200/200', 'image alt : Shampoing régulateur', 1, '2019-12-16 08:22:26', 16, 0, '2019-12-16 08:22:26', 0),
(15, NULL, 'Masque Hydratant', 'Ce masque capillaire rafraîchissant, riche en algue hydratante et en terre à foulon nettoyante est la recette idéal pour les cheveux et le cuir chevelu. Massez-le sur toute votre chevelure en insistant sur le cuir chevelu et laissez agir pendant 20 minutes ; la poudre de mousse irlandaise, la menthe poivrée et le romarin nettoient le cuir chevelu en douceur, tandis que le henné rouge donne de la brillance aux cheveux.', 'Ce masque capillaire rafraîchissant, riche en algue hydratante et en terre à foulon nettoyante est la recette idéal pour les cheveux et le cuir chevelu. Massez-le sur toute votre chevelure en insistant sur le cuir chevelu et laissez agir pendant 20 minutes ; la poudre de mousse irlandaise, la menthe poivrée et le romarin nettoient le cuir chevelu en douceur, tandis que le henné rouge donne de la brillance aux cheveux.', 'https://picsum.photos/id/42/200/200', 'image alt : Masque Hydratant', 1, '2019-12-16 08:22:26', 10, 0, '2019-12-16 08:22:26', 0),
(16, NULL, 'Masque fortifiant', 'Ce traitement pré-shampoing regorge d\'ingrédients fortifiants et revitalisants qui remettront vos cheveux dans le droit chemin. Les huiles d\'olive, de chanvre et de soja renforcent les cheveux, réduisant ainsi les frisottis et le risque de cassure au brossage ; l\'huile de noix du Brésil leur apporte hydratation, volume et brillance. ', 'Ce traitement pré-shampoing regorge d\'ingrédients fortifiants et revitalisants qui remettront vos cheveux dans le droit chemin. Les huiles d\'olive, de chanvre et de soja renforcent les cheveux, réduisant ainsi les frisottis et le risque de cassure au brossage ; l\'huile de noix du Brésil leur apporte hydratation, volume et brillance. ', 'https://picsum.photos/id/42/200/200', 'image alt : Masque fortifiant', 1, '2019-12-16 08:22:26', 27, 0, '2019-12-16 08:22:26', 0),
(17, NULL, 'Masque hydration ', 'Ce soin contient de l\'huile d\'olive extra vierge pour améliorer la souplesse des cheveux, ainsi que des huiles d\'amande et d\'avocat pour les hydrater en profondeur et les préparer pour tout ce que la vie leur réserve. La gomme guar réduit l\'électricité statique et l\'absolue de vanille parfume délicatement vos mèches pour les rendre irrésistibles.', 'Ce soin contient de l\'huile d\'olive extra vierge pour améliorer la souplesse des cheveux, ainsi que des huiles d\'amande et d\'avocat pour les hydrater en profondeur et les préparer pour tout ce que la vie leur réserve. La gomme guar réduit l\'électricité statique et l\'absolue de vanille parfume délicatement vos mèches pour les rendre irrésistibles.', 'https://picsum.photos/id/42/200/200', 'image alt : Masque hydration ', 1, '2019-12-16 08:22:26', 9, 0, '2019-12-16 08:22:26', 0),
(18, NULL, 'Soin nutritif', 'Pour une chevelure lisse et douce, au parfum de tonka et de cacao. Les huiles de noix du Brésil et de macadamia apportent une note revitalisante.', 'Pour une chevelure lisse et douce, au parfum de tonka et de cacao. Les huiles de noix du Brésil et de macadamia apportent une note revitalisante.', 'https://picsum.photos/id/42/200/200', 'image alt : Soin nutritif', 1, '2019-12-16 08:22:26', 26, 0, '2019-12-16 08:22:26', 0),
(19, NULL, 'Soin détox purifiant', 'Remettez votre chevelure à neuf avec cet après-shampoing réparateur riche en yaourt de soja et en huile d\'olive extra vierge, pour les ressourcer de la racine jusqu\'aux pointes.', 'Remettez votre chevelure à neuf avec cet après-shampoing réparateur riche en yaourt de soja et en huile d\'olive extra vierge, pour les ressourcer de la racine jusqu\'aux pointes.', 'https://picsum.photos/id/42/200/200', 'image alt : Soin détox purifiant', 1, '2019-12-16 08:22:26', 6, 0, '2019-12-16 08:22:26', 0),
(20, NULL, 'Soin rafaichissant', 'Après-shampoing aux senteurs ensoleillées, évocatrices des belles saisons. Le néroli enivrant et le lait d\'amande délicat adoucissent et parfument vos cheveux d\'un mélange exotique d\'arômes fleuris et fruités.', 'Après-shampoing aux senteurs ensoleillées, évocatrices des belles saisons. Le néroli enivrant et le lait d\'amande délicat adoucissent et parfument vos cheveux d\'un mélange exotique d\'arômes fleuris et fruités.', 'https://picsum.photos/id/42/200/200', 'image alt : Soin rafaichissant', 1, '2019-12-16 08:22:26', 20, 0, '2019-12-16 08:22:26', 0),
(21, NULL, 'Mascara', 'Mascara bienfaisant et revitalisant, riche en vitamines A, C et E, adoucit, renforce et définit les cils tout en prenant soin des yeux sensibles.', 'Mascara bienfaisant et revitalisant, riche en vitamines A, C et E, adoucit, renforce et définit les cils tout en prenant soin des yeux sensibles.', 'https://picsum.photos/id/42/200/200', 'image alt : Mascara', 1, '2019-12-16 08:22:26', 7, 0, '2019-12-16 08:22:26', 0),
(22, NULL, 'Eyeliner', 'Eyeliner noir corbeau, idéal pour un tracé net et précis ! Avec sa base apaisante composée d\'huile de jojoba bio et de gel d\'aloe vera bio issu du commerce équitable, cet est facile à appliquer est particulièrement doux pour le contour des yeux', 'Eyeliner noir corbeau, idéal pour un tracé net et précis ! Avec sa base apaisante composée d\'huile de jojoba bio et de gel d\'aloe vera bio issu du commerce équitable, cet est facile à appliquer est particulièrement doux pour le contour des yeux', 'https://picsum.photos/id/42/200/200', 'image alt : Eyeliner', 1, '2019-12-16 08:22:26', 27, 4.05, '2019-12-16 08:22:26', 0),
(23, NULL, 'Anti-cernes', 'Anti-cernes correcteur multi-usages, apaisant et équilibrant pour votre peau. Rayonnez toute la journée grâce à l\'huile de jojoba bio qui donne de l\'éclat à votre teint.', 'Anti-cernes correcteur multi-usages, apaisant et équilibrant pour votre peau. Rayonnez toute la journée grâce à l\'huile de jojoba bio qui donne de l\'éclat à votre teint.', 'https://picsum.photos/id/42/200/200', 'image alt : Anti-cernes', 1, '2019-12-16 08:22:26', 22, 4.4, '2019-12-16 08:22:26', 0);

-- --------------------------------------------------------

--
-- Structure de la table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
CREATE TABLE IF NOT EXISTS `product_feature` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`feature_id`),
  KEY `IDX_CE0E6ED64584665A` (`product_id`),
  KEY `IDX_CE0E6ED660E4B879` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_feature`
--

INSERT INTO `product_feature` (`product_id`, `feature_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 2),
(4, 1),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 4),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(10, 1),
(11, 2),
(11, 3),
(12, 1),
(13, 2),
(14, 1),
(15, 1),
(16, 2),
(16, 3),
(16, 4),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 3),
(19, 2),
(19, 3),
(20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_ingredient`
--

DROP TABLE IF EXISTS `product_ingredient`;
CREATE TABLE IF NOT EXISTS `product_ingredient` (
  `product_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`ingredient_id`),
  KEY `IDX_F8C8275B4584665A` (`product_id`),
  KEY `IDX_F8C8275B933FE08C` (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_ingredient`
--

INSERT INTO `product_ingredient` (`product_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 8),
(3, 10),
(3, 11),
(4, 8),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(6, 20),
(6, 21),
(6, 22),
(7, 18),
(7, 23),
(7, 24),
(7, 25),
(8, 18),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(9, 23),
(9, 30),
(9, 31),
(9, 32),
(10, 19),
(10, 33),
(10, 34),
(10, 35),
(11, 36),
(11, 37),
(11, 38),
(12, 39),
(12, 40),
(13, 41),
(13, 42),
(13, 43),
(14, 35),
(14, 44),
(15, 21),
(15, 24),
(15, 29),
(15, 43),
(16, 45),
(16, 46),
(17, 21),
(17, 47),
(18, 48),
(18, 49),
(18, 50),
(19, 51),
(19, 52),
(19, 53),
(19, 54),
(20, 9),
(20, 55),
(20, 56),
(20, 57),
(21, 58),
(21, 59),
(21, 60),
(22, 12),
(22, 61),
(23, 12),
(23, 49),
(23, 62),
(23, 63);

-- --------------------------------------------------------

--
-- Structure de la table `product_skinneed`
--

DROP TABLE IF EXISTS `product_skinneed`;
CREATE TABLE IF NOT EXISTS `product_skinneed` (
  `product_id` int(11) NOT NULL,
  `skinneed_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`skinneed_id`),
  KEY `IDX_CBB51F744584665A` (`product_id`),
  KEY `IDX_CBB51F74EFC7D2F5` (`skinneed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_skinneed`
--

INSERT INTO `product_skinneed` (`product_id`, `skinneed_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 1),
(7, 5),
(8, 6),
(9, 7),
(9, 8),
(10, 9),
(10, 10),
(11, 7),
(11, 8),
(12, 8),
(13, 7),
(14, 11),
(15, 7),
(16, 9),
(16, 12),
(17, 7),
(18, 7),
(19, 11),
(20, 8);

-- --------------------------------------------------------

--
-- Structure de la table `skinneed`
--

DROP TABLE IF EXISTS `skinneed`;
CREATE TABLE IF NOT EXISTS `skinneed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `skinneed`
--

INSERT INTO `skinneed` (`id`, `name`, `active`, `created_at`) VALUES
(1, 'Hydratant', 1, '2019-12-16 08:22:24'),
(2, 'Répérateur', 1, '2019-12-16 08:22:25'),
(3, 'Raffermissant', 1, '2019-12-16 08:22:25'),
(4, 'Apaisant', 1, '2019-12-16 08:22:25'),
(5, 'Anti-âge', 1, '2019-12-16 08:22:25'),
(6, 'Matifiant', 1, '2019-12-16 08:22:25'),
(7, 'Nutrition', 1, '2019-12-16 08:22:25'),
(8, 'Protection', 1, '2019-12-16 08:22:25'),
(9, 'Brillance', 1, '2019-12-16 08:22:25'),
(10, 'Detox', 1, '2019-12-16 08:22:25'),
(11, 'Détox', 1, '2019-12-16 08:22:25'),
(12, 'Anit-chute', 1, '2019-12-16 08:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `product_feature`
--
ALTER TABLE `product_feature`
  ADD CONSTRAINT `FK_CE0E6ED64584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CE0E6ED660E4B879` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_ingredient`
--
ALTER TABLE `product_ingredient`
  ADD CONSTRAINT `FK_F8C8275B4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F8C8275B933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_skinneed`
--
ALTER TABLE `product_skinneed`
  ADD CONSTRAINT `FK_CBB51F744584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CBB51F74EFC7D2F5` FOREIGN KEY (`skinneed_id`) REFERENCES `skinneed` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
