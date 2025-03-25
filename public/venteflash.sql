-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 26 mars 2024 à 18:34
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
-- Base de données : `venteflash`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `city`, `country`, `phone`, `address`) VALUES
(5, 5, 'domicile', 'victor', 'masoda', 'douala', 'CM', '45666642', 'pk9'),
(6, 5, 'domicile 2', 'j', 'j', 'douala', 'CM', '61353131635', 'cite des palmiers');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Djef', 'transporteur toute zone confondu de votre secteur', 100000);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'manteau'),
(2, 't-shirt'),
(3, 'echarpe'),
(4, 'materiel informatique'),
(5, 'laptop');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230702230814', '2023-07-03 01:36:14', 597),
('DoctrineMigrations\\Version20230707235853', '2023-07-08 02:24:15', 16584),
('DoctrineMigrations\\Version20230708095744', '2023-07-08 11:58:16', 6381),
('DoctrineMigrations\\Version20230714001253', '2023-07-14 02:14:07', 2622),
('DoctrineMigrations\\Version20230716092027', '2023-07-16 11:21:05', 428),
('DoctrineMigrations\\Version20230717171019', '2023-07-17 19:10:51', 690),
('DoctrineMigrations\\Version20230718103745', '2023-07-18 12:38:19', 3364),
('DoctrineMigrations\\Version20230722121205', '2023-07-22 14:12:27', 227),
('DoctrineMigrations\\Version20230804105212', '2023-08-04 12:52:38', 224),
('DoctrineMigrations\\Version20230912234858', '2023-09-13 01:49:24', 552),
('DoctrineMigrations\\Version20230914225529', '2023-09-15 00:55:56', 730),
('DoctrineMigrations\\Version20231010201401', '2023-10-10 22:14:49', 291),
('DoctrineMigrations\\Version20231011223722', '2023-10-12 00:37:57', 432);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `btn_title` varchar(255) NOT NULL,
  `btn_url` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'Nouvelle collection', 'Découvrez notre collection 2023', 'Découvrir', '/nos-produits', '59f6fc9f8d16d4c5f7858dc78bfd5ca186cbf8e5.jpg'),
(2, 'promotion de la rentrée', 'Découvrez tout les offres de la rentrée', 'Découvrir', '/nos-produits', '73179072247fb8619528e33d85b50cf87b9710b0.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_dat` datetime NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext NOT NULL,
  `reference` varchar(255) NOT NULL,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `create_dat`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `state`) VALUES
(1, 5, '2023-08-04 16:50:38', 'Djef', 1000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '', NULL, 0),
(2, 5, '2023-09-13 02:50:00', 'Djef', 1000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '130923-65010738055fd', NULL, 0),
(3, 5, '2023-09-15 01:06:41', 'Djef', 1000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '150923-65039201ba9a2', NULL, 0),
(4, 5, '2023-09-15 02:03:42', 'Djef', 1000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '150923-65039f5e8e9ad', 'cs_test_b1fyMgCet54vXIDU5sUsywJ9yekTRyaqpvHJkc0vjat4EOnQNsEJEHG3qz', 0),
(5, 5, '2023-09-22 01:46:37', 'Djef', 1000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '220923-650cd5dd7f2b9', 'cs_test_b1z57x0H2AcpwAISAj4sh1DHyXCgNeG5NVFJL4SsrCPO1xmctm70IgeZUD', 0),
(6, 5, '2023-09-22 02:19:22', 'Djef', 100000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '220923-650cdd8a54726', 'cs_test_b1DWYMyXFuVYrX9ZntMXo12ph3DFqt0tOatcQXLVrNONS8VbQLbdiLa0hc', 0),
(7, 5, '2023-09-22 02:21:18', 'Djef', 100000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '220923-650cddfe203a6', NULL, 0),
(8, 5, '2023-09-22 02:22:06', 'Djef', 100000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '220923-650cde2e692d4', NULL, 0),
(9, 5, '2023-09-22 02:23:04', 'Djef', 100000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '220923-650cde681e0f4', 'cs_test_b1XFV5EGOj16mH3JDS1eDw5ogddS6z810vCqSAKhDaQ9uhAChlalpjgXfK', 0),
(10, 5, '2023-10-10 22:23:53', 'Djef', 100000, 'victor masoda<br>45666642<br>pk9<br>douala CM', '101023-6525b2d95a456', 'cs_test_b1dW8BAi76fdeHU2XgFW0rAuqdjizeCPoaQ9SoGi8rQ6K7OfSQiJj1Q07i', 2),
(11, 5, '2023-12-27 16:15:36', 'Djef', 100000, 'j j<br>61353131635<br>cite des palmiers<br>douala CM', '271223-658c3f98c2e35', 'cs_test_b19HWLpD8h5WdFI0PdzTcRmMblSyKjoD1uR2b9KceGtF7pr1XS0iF5imwL', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `myorder_id` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `myorder_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Acer', 1, 100000, 100000),
(2, 2, 'Apple AirPods 2', 2, 200000, 400000),
(3, 2, 'AMD Ryzen 5 5600X', 1, 500000, 500000),
(4, 3, 'Apple AirPods 2', 2, 200000, 400000),
(5, 3, 'AMD Ryzen 5 5600X', 1, 500000, 500000),
(6, 4, 'Apple AirPods 2', 2, 200000, 400000),
(7, 4, 'AMD Ryzen 5 5600X', 1, 500000, 500000),
(8, 5, 'Acer', 1, 100000, 100000),
(9, 6, 'Acer', 1, 100000, 100000),
(10, 7, 'Acer', 1, 100000, 100000),
(11, 8, 'Acer', 1, 100000, 100000),
(12, 9, 'Acer', 1, 100000, 100000),
(13, 10, 'Apple AirPods 2', 1, 200000, 200000),
(14, 11, 'produit test', 1, 100000, 100000),
(15, 11, 'Acer', 1, 100000, 100000);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `illustration` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `is_best`) VALUES
(1, 2, 'produit test', 'produit-test', '256f2bc0c0f789ad08ce233441f790ced4be930a.jpg', 'test sous titre', 'test desc', 100000, 0),
(2, 4, 'Acer', 'acer', '1139b4092ff232c2cf08b2ca0ace33cb869fa584.png', 'V247Ybmipx', '23.8\", IPS, 16:9, 1920 x 1080 (FHD), 4 ms, 75 Hz, VGA/HDMI/DisplayPort\r\n\r\nBoostez votre productivité avec cet écran Acer V247Ybmipx et sa dalle IPS avec résolution Full HD (1920 x 1080 pixels).\r\nEgalement très agréable à utiliser, il propose notamment les technologies Flicker-less et Acer Vision Care ainsi qu\'un pied ergonomique facilement inclinable.', 100000, 1),
(4, 4, 'Apple AirPods 2', 'apple-airpods-2', 'f879c7cdb4887741eb9c30220fb9c7f0263f8ffb.png', 'charging case - Wireless headphones', 'True Wireless headphones, in-ear, Bluetooth\r\n\r\nApple\'s AirPods 2 are equipped with the H1 chip, this version 2 allows you to activate Siri only by voice. The H1 chip also enables a faster and more stable connection. Always as efficient and intuitive, Airpods are much more than simple wireless earphones. They are magical. In this version with standard box, charging is done by plugging the box into the Lightning port.', 200000, 1),
(5, 4, 'AMD Ryzen 5 5600X', 'amd-ryzen-5-5600x', '1e948d949ce0565e1de2146c1560b7d06e6d5ae6.png', 'bulk version', '6 cores, 3.70 GHz, 32 MB, AMD Zen 3, 65 Watts, bulk version without box, with fan (3 years warranty)\r\n\r\n\r\nThe AMD Ryzen 5 5600X processor benefits from the improvements made by the AMD Zen 3 architecture. Improved energy performance, higher frequencies, unified L3 cache in 32MB blocks and a processor that continues the AMD Ryzen tradition of excellence in terms of high performance per watt: here are a serious number of arguments to make it join your future PC gamer configuration!', 500000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'a@b.c', '[]', 'test', 'victor', 'cordrink'),
(3, 'b@b.c', '[]', 'test', 'victor', 'cordrink'),
(4, 'pres@g', '[]', '$2y$13$hXKWlF/4oaF5ZKdKfzwT2ux7ayPaGxTtysCGIY1b/6WZcFW1KKYjO', 'aese', 'alfalf'),
(5, 'cordrink@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$7YgH3h.aTbN/DiCvizA6fO8e.BH1K52sLDPdAVD1SZskaRpOHtRmq', 'victor', 'cordrink'),

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1732E2069` (`myorder_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1732E2069` FOREIGN KEY (`myorder_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
