-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 17 Juillet 2018 à 18:56
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mini-ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `description`, `date_creation`, `date_modification`, `is_deleted`) VALUES
(18, 'Bières', '', '2018-07-17', '2018-07-17', 0),
(17, 'Patisseries', 'À consommer avec modération', '2018-07-17', '2018-07-17', 0),
(16, 'Pains', 'Ça croustille !', '2018-07-17', '2018-07-17', 0),
(15, 'Poissons', '', '2018-07-17', '2018-07-17', 0),
(14, 'Viandes', '', '2018-07-17', '2018-07-17', 0),
(13, 'Légumes', '', '2018-07-17', '2018-07-17', 0),
(12, 'Fruits', 'Aliment de bonne qualité nutritionnelle', '2018-07-17', '2018-07-17', 0),
(19, 'Vins', 'À consommer avec modération', '2018-07-17', '2018-07-17', 0),
(20, 'Vins', 'À consommer avec modération', '2018-07-17', '2018-07-17', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

CREATE TABLE `categorie_produit` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `categorie_produit`
--

INSERT INTO `categorie_produit` (`id`, `categorie_id`, `produit_id`) VALUES
(43, 19, 132),
(42, 19, 131),
(41, 19, 130),
(40, 12, 129),
(39, 12, 128),
(38, 12, 127),
(37, 13, 126),
(36, 13, 125),
(35, 13, 124),
(34, 14, 123),
(33, 14, 122),
(32, 15, 121),
(31, 15, 120),
(30, 16, 119),
(29, 16, 118),
(28, 16, 117),
(27, 17, 116),
(26, 17, 115),
(25, 18, 114),
(24, 18, 113),
(23, 18, 112);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `panier_produit`
--

CREATE TABLE `panier_produit` (
  `id` int(11) NOT NULL,
  `panier_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `prix_ht` float NOT NULL,
  `is_deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `utilisateur_id`, `date_creation`, `date_modification`, `nom`, `description`, `prix_ht`, `is_deleted`) VALUES
(112, 111, '2018-07-17', NULL, 'Grimbergen', 'Bière blonde', 4, 0),
(113, 111, '2018-07-17', NULL, 'Guiness', 'Bière brune', 3, 0),
(114, 111, '2018-07-17', NULL, 'Alésia', 'Bière blonde bio de Bourgogne', 5, 0),
(115, 111, '2018-07-17', NULL, 'Assortiment patisseries', 'Cinq gâteaux délicieux', 5, 0),
(116, 111, '2018-07-17', NULL, 'Éclairs chocolat', 'Deux éclairs, un goût du tonerre', 2, 0),
(117, 111, '2018-07-17', NULL, 'Pain au seigle', 'Tranché, 500g', 1, 0),
(118, 111, '2018-07-17', NULL, 'Pain de mie complet', 'Quatorze tranches', 0, 0),
(119, 111, '2018-07-17', NULL, 'Baguette précuite', '250g', 1, 0),
(120, 111, '2018-07-17', NULL, 'Pavés de saumon', 'Les quatre pavés, 560g', 15, 0),
(121, 111, '2018-07-17', NULL, 'Poisson panés', 'Barquette de 210g', 4, 0),
(122, 111, '2018-07-17', NULL, 'Steaks hachés pur boeuf', '15% de MG, la barquette de deux, 250g', 3, 0),
(123, 111, '2018-07-17', NULL, 'Viande bovine', 'Deux hampes, 260g', 6, 0),
(124, 111, '2018-07-17', '2018-07-17', 'Poivrons rouge et vert', 'Bio, 2 couleurs, 2 euros', 2, 0),
(125, 111, '2018-07-17', NULL, 'Avocat', 'Avocat lance défense, ce n\'est pas très efficace', 1, 0),
(126, 111, '2018-07-17', NULL, 'Chou Romanesco', 'Mauvais mais bon pour la santé', 3, 0),
(127, 111, '2018-07-17', NULL, 'Melon charentais jaune', 'Bio, vendu à la pièce', 2, 0),
(128, 111, '2018-07-17', NULL, 'Cerises rouges Burlat', 'La barquette de 750g', 4, 0),
(129, 111, '2018-07-17', NULL, 'Myrtilles', 'La barquette de 500g', 5, 0),
(130, 111, '2018-07-17', '2018-07-17', 'Vin rouge Bordeaux 2016', 'La bouteille de 75cl', 5, 0),
(131, 111, '2018-07-17', '2018-07-17', 'Vin rouge Medoc 2012', 'La bouteille de 75cl', 15, 0),
(132, 111, '2018-07-17', NULL, 'Vin blanc Pays d\'Oc Bio', 'La bouteille de 75cl', 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'admin'),
(2, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `mdp` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT '2',
  `date_creation` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `cp`, `ville_id`, `telephone`, `mdp`, `role_id`, `date_creation`, `date_modification`, `is_deleted`) VALUES
(3, 'Hunter', 'Ignacia', 'dui@Curabitur.com', '75012', 1, '01 27 88 46 66', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(12, 'Yuli', 'Fay', 'Lorem.ipsum@Donecsollicitudin.co.uk', '75012', 1, '03 94 56 19 00', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(13, 'Ralph', 'Nadine', 'Quisque@amet.com', '75012', 1, '09 67 33 11 62', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(14, 'Changé', 'Changé', 'changé@sitamet.net', '75012', 1, '02 67 57 17 11', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(15, 'Richard', 'Courtney', 'vel.arcu@Duis.co.uk', '75012', 1, '08 59 50 65 65', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(16, 'Geoffrey changé', 'May changé', 'imperdiet.ullamcorper@sedsem.net', '75012', 1, '07 86 32 54 81', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(17, 'Kibo', 'Anika', 'quis@luctus.com', '75012', 1, '07 44 54 44 50', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 1),
(18, 'Christopher', 'Tamara', 'Mauris@ut.co.uk', '75012', 1, '09 02 51 15 66', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(19, 'Kennedy', 'Vivian', 'sollicitudin@diamvel.net', '75012', 1, '01 65 86 54 50', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(20, 'Fuller', 'Constance', 'nisl@aliquet.net', '75012', 1, '08 35 24 92 54', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(21, 'Malachi', 'Dahlia', 'elit.sed@urnaNunc.com', '75012', 1, '01 36 28 16 80', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(22, 'Ciaran', 'Sloane', 'vitae.diam.Proin@semmolestiesodales.co.uk', '75012', 1, '01 96 41 88 61', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(23, 'James', 'Katell', 'mattis@mollisnec.com', '75012', 1, '01 44 46 89 80', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(24, 'Fletcher', 'Suki', 'sed.dolor@Donecfeugiatmetus.edu', '75012', 1, '04 66 28 87 32', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(25, 'Burton', 'Nevada', 'orci.luctus@sitamet.com', '75012', 1, '01 73 25 39 98', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(26, 'Kuame', 'Doris', 'tempus.non.lacinia@augueutlacus.org', '75012', 1, '01 50 67 41 35', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(27, 'Herman', 'Martina', 'amet@eu.com', '75012', 1, '05 46 22 73 07', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(28, 'Thomas', 'Natalie', 'eget.ipsum.Donec@volutpat.co.uk', '75012', 1, '06 18 47 23 76', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(29, 'Barry', 'Isabella', 'Morbi.sit.amet@blandit.ca', '75012', 1, '02 01 27 34 88', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(30, 'Steven', 'Chanda', 'pharetra.ut@tristiqueac.ca', '75012', 1, '07 93 23 21 76', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(31, 'Sean', 'Ria', 'sit@in.com', '75012', 1, '05 72 61 04 53', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(32, 'Garrison', 'Mallory', 'blandit@ametloremsemper.ca', '75012', 1, '01 71 46 78 77', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(33, 'Anthony', 'Odette', 'eleifend.vitae@ligula.com', '75012', 1, '07 02 75 93 77', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(34, 'Lev', 'Gloria', 'auctor.odio@nonummyipsum.edu', '75012', 1, '06 74 89 67 76', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(35, 'Austin', 'Maggie', 'Nullam.vitae@dolortempusnon.net', '75012', 1, '05 28 52 29 45', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(36, 'Timon', 'Octavia', 'nulla.Donec.non@atortor.org', '75012', 1, '07 03 00 14 06', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(37, 'Denton', 'Urielle', 'Sed@etrisus.net', '75012', 1, '03 94 97 92 50', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(38, 'Phillip', 'Kirby', 'nec.tellus@Etiamlaoreetlibero.co.uk', '75012', 1, '05 00 25 57 04', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(39, 'Jin', 'Stella', 'Cras@eliterat.co.uk', '75012', 1, '01 30 00 13 01', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(40, 'Elijah', 'Charlotte', 'Curabitur.massa.Vestibulum@felisNullatempor.org', '75012', 1, '08 25 91 44 66', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(41, 'Troy', 'Ebony', 'lectus@non.org', '75012', 1, '02 66 02 26 48', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(42, 'Addison', 'Margaret', 'et.libero.Proin@volutpatnunc.net', '75012', 1, '07 23 12 04 57', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(43, 'Ivan', 'Melodie', 'ullamcorper.magna@pharetraNam.co.uk', '75012', 1, '07 91 67 13 25', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(44, 'Elmo', 'Sigourney', 'cursus.et.magna@facilisisloremtristique.com', '75012', 1, '07 31 32 56 71', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(45, 'Jamal', 'Vivien', 'tincidunt.pede.ac@purus.net', '75012', 1, '07 59 81 77 11', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(46, 'Otto', 'Daphne', 'pellentesque@fringillaornare.org', '75012', 1, '09 94 52 88 93', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(47, 'Acton', 'Hope', 'tincidunt.vehicula.risus@sagittis.edu', '75012', 1, '01 14 14 22 69', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(48, 'Price', 'Maya', 'Morbi@etrisusQuisque.ca', '75012', 1, '04 21 97 21 01', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(49, 'Baxter', 'Olympia', 'ante.dictum.cursus@faucibusutnulla.net', '75012', 1, '06 71 44 82 11', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(50, 'Brody', 'Colette', 'hymenaeos.Mauris.ut@non.co.uk', '75012', 1, '07 97 26 17 59', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(51, 'Colin', 'Mollie', 'porttitor@aliquamarcu.co.uk', '75012', 1, '07 63 09 55 62', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(52, 'Gabriel', 'Mariko', 'sodales.elit.erat@etliberoProin.com', '75012', 1, '06 07 02 63 57', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(53, 'Driscoll', 'Mona', 'sem@convalliserateget.ca', '75012', 1, '02 00 37 17 62', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(54, 'Micah', 'Aspen', 'Proin.vel.arcu@nibh.ca', '75012', 1, '07 06 50 49 51', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(55, 'Robert', 'Yvonne', 'Quisque.porttitor.eros@malesuadavel.co.uk', '75012', 1, '08 56 90 13 71', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(56, 'Vance', 'Dorothy', 'risus.Donec.nibh@Proin.edu', '75012', 1, '05 96 52 81 14', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(57, 'Forrest', 'Rebekah', 'cursus.Nunc@metusfacilisislorem.edu', '75012', 1, '08 78 99 26 00', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(58, 'Jarrod', 'Winter', 'molestie.in@porttitor.edu', '75012', 1, '04 16 15 16 00', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(59, 'Quamar', 'Quemby', 'convallis.ligula.Donec@auctor.com', '75012', 1, '04 29 39 75 77', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(60, 'Kareem', 'Destiny', 'montes.nascetur@aarcuSed.edu', '75012', 1, '07 10 25 02 27', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(61, 'Amir', 'Daryl', 'magna.a@dolorFusce.ca', '75012', 1, '01 24 04 15 56', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(62, 'Gannon', 'Leah', 'eleifend.non@leoelementum.edu', '75012', 1, '08 87 39 58 63', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(63, 'Ezekiel', 'Kaden', 'blandit.mattis.Cras@turpisvitaepurus.ca', '75012', 1, '09 99 55 98 17', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(64, 'Adrian', 'Isabelle', 'massa@feugiat.com', '75012', 1, '04 02 77 81 25', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(65, 'Barrett', 'Xena', 'consequat.enim@nisi.ca', '75012', 1, '02 28 33 90 72', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(66, 'Emerson', 'Bryar', 'et.ultrices.posuere@tempusscelerisque.ca', '75012', 1, '07 59 45 07 34', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(67, 'Buckminster', 'Dakota', 'senectus@eu.ca', '75012', 1, '08 64 41 95 97', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(68, 'Dale', 'Constance', 'at@nullaIntincidunt.co.uk', '75012', 1, '02 66 85 24 28', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(69, 'Hall', 'Lee', 'mauris.Suspendisse.aliquet@consequat.co.uk', '75012', 1, '01 20 68 40 01', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(70, 'Howard', 'Lydia', 'Integer.aliquam.adipiscing@eudoloregestas.co.uk', '75012', 1, '05 77 68 03 62', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(71, 'Hakeem', 'Brynne', 'lacus@ac.com', '75012', 1, '07 13 15 42 00', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(72, 'Brennan', 'Quon', 'et.risus@Nunc.edu', '75012', 1, '07 14 54 25 77', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(73, 'Simon', 'Delilah', 'Aliquam@Donecfeugiat.ca', '75012', 1, '06 78 42 34 35', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(74, 'Len', 'Sarah', 'lacinia.at.iaculis@aceleifend.edu', '75012', 1, '08 67 94 11 90', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(75, 'Hasad', 'Brianna', 'dis.parturient@luctusaliquet.co.uk', '75012', 1, '05 61 84 31 24', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(76, 'Kennan', 'Daphne', 'lacinia.at@imperdietnon.co.uk', '75012', 1, '07 43 43 88 16', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(77, 'Lars', 'Jaquelyn', 'sit.amet@Vestibulumanteipsum.edu', '75012', 1, '01 27 16 23 25', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(78, 'Zeus', 'Sydney', 'et@nec.edu', '75012', 1, '09 72 81 40 40', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(79, 'Arsenio', 'Kimberly', 'convallis@liberoProinmi.ca', '75012', 1, '06 06 94 55 31', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(80, 'Nero', 'Emma', 'velit.Pellentesque.ultricies@tellus.co.uk', '75012', 1, '08 89 84 30 20', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(81, 'Reed', 'Angela', 'malesuada.ut.sem@ligulaelitpretium.ca', '75012', 1, '05 69 98 70 06', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(82, 'Price', 'Lavinia', 'Sed.neque@non.com', '75012', 1, '07 53 34 28 03', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(83, 'Chancellor', 'Heather', 'dignissim.magna.a@elit.org', '75012', 1, '04 55 88 64 97', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(84, 'Drew', 'Wynne', 'dolor@Morbiquis.ca', '75012', 1, '02 55 13 07 20', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(85, 'Elvis', 'Yael', 'dolor@dapibusquam.co.uk', '75012', 1, '01 61 13 89 33', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(86, 'Slade', 'Iola', 'in.consequat.enim@necquamCurabitur.org', '75012', 1, '02 42 26 48 35', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(87, 'Rajah', 'Illiana', 'Sed.auctor@Pellentesquehabitantmorbi.com', '75012', 1, '02 11 28 76 50', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(88, 'Porter', 'Christen', 'nisl.Maecenas.malesuada@bibendumullamcorper.co.uk', '75012', 1, '02 68 05 27 40', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(89, 'Kuame', 'Stacey', 'nisl.sem@egestas.ca', '75012', 1, '07 56 45 53 57', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(90, 'Travis', 'Zephr', 'dapibus@nec.com', '75012', 1, '06 98 27 57 26', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(91, 'Kadeem', 'Jaquelyn', 'vulputate.posuere.vulputate@laciniaorciconsectetuer.edu', '75012', 1, '09 04 65 76 81', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(92, 'Elliott', 'Hedy', 'Phasellus.libero.mauris@iaculislacuspede.com', '75012', 1, '06 65 71 63 21', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(93, 'Lev', 'Donna', 'aliquet.sem@nonbibendum.co.uk', '75012', 1, '06 01 45 37 38', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(94, 'Joshua', 'Karleigh', 'leo.Cras@utdolordapibus.org', '75012', 1, '07 97 93 42 45', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(95, 'Ryan', 'Ebony', 'ac@malesuada.ca', '75012', 1, '01 90 80 93 60', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(96, 'Thane', 'Caryn', 'pellentesque@convallisante.co.uk', '75012', 1, '07 16 22 30 63', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(97, 'Barry', 'Ava', 'mauris@CuraePhasellus.net', '75012', 1, '05 25 93 40 06', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(98, 'Matthew', 'Ursula', 'libero.dui.nec@dictum.org', '75012', 1, '07 04 68 11 08', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(99, 'Bruno', 'Tatiana', 'sit@necante.net', '75012', 1, '05 73 45 01 50', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(100, 'Peter', 'Kirestin', 'arcu@idblandit.ca', '75012', 1, '04 11 48 85 78', '83ea007bfdd589f29b820552b3f94260', 2, '2018-06-04', '2018-06-04', 0),
(101, 'wawa', 'wawa', 'waw@waw.com', '0000', 0, '0000000000', '0a1c6944cb66d02ccefac35620ce2e51', 1, '2018-06-14', '2018-06-14', 0),
(102, 'test', 'test', 'test@test.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, NULL, NULL, 0),
(103, 'tata', 'tata', 'tata@tata.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, NULL, NULL, 0),
(104, 'te', 'te', 'te@te.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, '2018-06-06', '2018-06-06', 0),
(105, '', '', '', '0000', 0, '0000000000', 'd41d8cd98f00b204e9800998ecf8427e', 2, '2018-06-06', '2018-06-06', 0),
(106, 'fqs', 'fqds', 'dsq@dsq.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, '2018-06-06', '2018-06-06', 0),
(107, 'tata', 'tata', 'toto@toto.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, '2018-06-18', '2018-06-18', 0),
(108, 'rara', 'rara', 'rara@rara.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, '2018-06-18', '2018-06-18', 0),
(109, 'jaja', 'jaja', 'jaja@jaja.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 2, '2018-06-18', '2018-06-18', 0),
(110, 'kaka', 'kaka', 'kaka@kaka.com', '0000', 0, '0000000000', '25f9e794323b453885f5181f1b624d0b', 1, '2018-06-18', '2018-06-18', 0),
(111, 'jocelynTest', 'azerty', 'azerty@azerty.com', '0000', 0, '0000000000', 'ab4f63f9ac65152575886860dde480a1', 1, '2018-07-17', '2018-07-17', 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panier_id` (`panier_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `commande_produit_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `commande_produit_ibfk_2` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD CONSTRAINT `panier_produit_ibfk_1` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`),
  ADD CONSTRAINT `panier_produit_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
