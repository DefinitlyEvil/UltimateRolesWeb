SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- `balance_history`
--

CREATE TABLE `balance_history` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `updateTime` int(11) NOT NULL,
  `reason` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `default_perks`
--

CREATE TABLE `default_perks` (
  `id` bigint(20) NOT NULL,
  `perkId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `randomKey` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `perks`
--

CREATE TABLE `perks` (
  `id` bigint(11) NOT NULL,
  `name` text NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `perk_applications`
--

CREATE TABLE `perk_applications` (
  `id` bigint(20) NOT NULL,
  `perkId` bigint(20) NOT NULL,
  `definitionId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `perk_instances`
--

CREATE TABLE `perk_instances` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `perkId` bigint(20) NOT NULL,
  `purchasedTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `perk_items`
--

CREATE TABLE `perk_items` (
  `id` bigint(20) NOT NULL,
  `perkId` bigint(20) NOT NULL,
  `itemType` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `server_definition`
--

CREATE TABLE `server_definition` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `group` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `shop_items`
--

CREATE TABLE `shop_items` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `image` longtext NOT NULL,
  `perkId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `price` float NOT NULL,
  `perk_time` int(11) NOT NULL,
  `featured` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` text NOT NULL,
  `uuid` text NOT NULL,
  `password` text NOT NULL,
  `passwordSet` tinyint(4) NOT NULL,
  `balance` float NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_history`
--
ALTER TABLE `balance_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `default_perks`
--
ALTER TABLE `default_perks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perkId` (`perkId`);

--
-- Indexes for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `perks`
--
ALTER TABLE `perks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perk_applications`
--
ALTER TABLE `perk_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perkId` (`perkId`),
  ADD KEY `definitionId` (`definitionId`);

--
-- Indexes for table `perk_instances`
--
ALTER TABLE `perk_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `perkId` (`perkId`);

--
-- Indexes for table `perk_items`
--
ALTER TABLE `perk_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perkId` (`perkId`);

--
-- Indexes for table `server_definition`
--
ALTER TABLE `server_definition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_items`
--
ALTER TABLE `shop_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perkId` (`perkId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `balance_history`
--
ALTER TABLE `balance_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `default_perks`
--
ALTER TABLE `default_perks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `perks`
--
ALTER TABLE `perks`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `perk_applications`
--
ALTER TABLE `perk_applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `perk_instances`
--
ALTER TABLE `perk_instances`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `perk_items`
--
ALTER TABLE `perk_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `server_definition`
--
ALTER TABLE `server_definition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `shop_items`
--
ALTER TABLE `shop_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 限制导出的表
--

--
-- 限制表 `balance_history`
--
ALTER TABLE `balance_history`
  ADD CONSTRAINT `balance_history_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 限制表 `default_perks`
--
ALTER TABLE `default_perks`
  ADD CONSTRAINT `default_perks_ibfk_1` FOREIGN KEY (`perkId`) REFERENCES `perks` (`id`) ON DELETE CASCADE;

--
-- 限制表 `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD CONSTRAINT `login_tokens_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 限制表 `perk_applications`
--
ALTER TABLE `perk_applications`
  ADD CONSTRAINT `perk_applications_ibfk_1` FOREIGN KEY (`perkId`) REFERENCES `perks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `perk_applications_ibfk_2` FOREIGN KEY (`definitionId`) REFERENCES `server_definition` (`id`) ON DELETE CASCADE;

--
-- 限制表 `perk_instances`
--
ALTER TABLE `perk_instances`
  ADD CONSTRAINT `perk_instances_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `perk_instances_ibfk_2` FOREIGN KEY (`perkId`) REFERENCES `perks` (`id`) ON DELETE CASCADE;

--
-- 限制表 `perk_items`
--
ALTER TABLE `perk_items`
  ADD CONSTRAINT `perk_items_ibfk_1` FOREIGN KEY (`perkId`) REFERENCES `perks` (`id`) ON DELETE CASCADE;

--
-- 限制表 `shop_items`
--
ALTER TABLE `shop_items`
  ADD CONSTRAINT `shop_items_ibfk_1` FOREIGN KEY (`perkId`) REFERENCES `perks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_items_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
