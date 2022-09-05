-- DATABASE missions_KGB

-- |------------------------------|------------------------------| --
-- create DATABASE 
-- |------------------------------|------------------------------| --
DROP DATABASE IF EXISTS `missions_KGB`;
CREATE DATABASE IF NOT EXISTS `missions_KGB` CHARACTER SET `utf8` COLLATE `utf8_general_ci`;
USE `missions_KGB`;

-- |------------------------------|------------------------------| --
-- create table and insert data
-- Primary tables
-- |------------------------------|------------------------------| --

-- Delete Table if it exists
DROP TABLE IF EXISTS `Agents`;
-- Structure of the table `Agents`
CREATE TABLE IF NOT EXISTS `Agents` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birthDate` date NOT NULL,
  `codeName` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255),
  `roleId` int(11) NOT NULL
);

INSERT INTO `Agents` 
(`id`, `lastname`, `firstname`, `birthDate`, `codeName`, `nationality`, `roleId`) VALUES
(NULL, "Volkov", "Vitaly", "1976-04-16", "Baimet", "Russe", 2),
(NULL, "Tretiakov", "Oscar", "1953-02-03", "Sheining", "Russe", 2),
(NULL, "Glazkov", "Zossima", "1980-08-29", "Anna", "Tchèque", 2),
(NULL, "Mellor", "Mia", "1986-06-06", "Lormand", "Anglais", 2),
(NULL, "Erzok", "Gall", "1978-11-28", "Wiltionew", "Anglais", 2);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Targets`;
-- Structure of the table `Targets`
CREATE TABLE IF NOT EXISTS `Targets` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birthDate` date NOT NULL,
  `codeName` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255)
);

INSERT INTO `Targets` 
(`id`, `lastname`, `firstname`, `birthDate`, `codeName`, `nationality`) VALUES
(NULL, "Gabriel", "Roman","1975-03-21", "X-103", "France"),
(NULL, "Klein", "Klaus", "1962-05-11", "X-124", "Allemand"),
(NULL, "Hanko", "Lucas", "1982-07-02", "X-156", "Tchèque"),
(NULL, "Lazarevic", "Zoran", "1964-01-06", "X-168", "Russe"),
(NULL, "Flynn", "Harry", "1977-12-19", "X-172", "Etats Unis"),
(NULL, "Feirong", "Kong", "1963-08-02", "X-183", "Chinois");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Contacts`;
-- Structure of the table `Contacts`
CREATE TABLE IF NOT EXISTS `Contacts` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birthDate` date NOT NULL,
  `codeName` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255),
  `roleId` int(11) NOT NULL
);

INSERT INTO `Contacts` 
(`id`, `lastname`, `firstname`, `birthDate`, `codeName`, `nationality`, `roleId`) VALUES
(NULL, "Shäfer", "Karl", "1983-03-27", "CO-016", "Etats Unis", 3),
(NULL, "Dante", "Jason", "1960-04-09", "CO-032", "Allemand", 3),
(NULL, "Perez", "Vincent", "1970-09-07", "CO-041", "Espagnol", 3),
(NULL, "Kratky", "Filip", "1970-09-07", "CO-041", "Russe", 3),
(NULL, "Chiff", "Salim", "1983-07-18", "CO-43", "Marocain", 3);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Stakeouts`;
-- Structure of the table `Stakeouts`
CREATE TABLE IF NOT EXISTS `Stakeouts` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(55) NULL,
  `imageUrl` varchar(255),
  `type_stakeoutsId` int(11) NOT NULL
);

INSERT INTO `Stakeouts` 
(`id`, `code`, `address`, `country`, `type_stakeoutsId`) VALUES
(NULL, "TX-106", "49 rue Krtsanisis, Tbilisi 0114", "Géorgie", 1),
(NULL, "TX-236", "Udomlya, Tver Oblast 171854", "Russie", 2),
(NULL, "TX-442", "Ambassade de chine", "Myanmar", 1),
(NULL, "TX-568", "Péninsule de Kola", "Russie", 5),
(NULL, "TX-033", "Old Town", "Royaume-Uni", 2);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Administrators`;
-- Structure of the table `Administrators`
CREATE TABLE IF NOT EXISTS `Administrators` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `imageUrl` varchar(255),
  `createdAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL
);

INSERT INTO `Administrators` 
(`id`, `lastname`, `firstname`, `email`, `password`, `createdAt`, `roleId`) VALUES
(NULL, "Chélépine", "Alexandre", "Alexandre.chelepine@kgb.ru", "Aleche123!", "1958-09-01 06:02:38", 1),
(NULL, "Bakatine", "Vadim", "Vadim.bakatine@kgb.ru", "Vadbak123!", "1991-08-01 06:13:46", 1),
(NULL, "Tchebrikov", "Viktor", "Viktor.tchebrikov@kgb.ru", "Viktch123!", "1982-09-01 06:06:52", 1);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions`;
-- Structure of the table `Missions`
CREATE TABLE IF NOT EXISTS `Missions` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `codeName` varchar(55) NOT NULL,
  `country` varchar(55) NULL,
  `startDate` date NOT NULL, 
  `endDate` date,
  `imageUrl` varchar(255),
  `type_missionsId` int(11),
  `type_stakeoutsId` int(11)
);

INSERT INTO `Missions` (`id`, `title`, `description`, `codeName`, `country`, `startDate`, `type_missionsId`, `type_stakeoutsId`) VALUES
(NULL, "Poste de police de T'bilisi", "La mission se déroule a T'bilisi en Georgie. Il faut trouver Gurgenidze dans un entrepôt de la zone industrielle de cybil. Ensuite, Il faut infiltrer le commissariat et localiser les cibles X-103 et X-156 afin de les mettre sur écoute.", "INF-GEO-10021", "Géorgie", "1975-02-01", 1, 1),
(NULL, "Centrale nucléaire de Kalinine", "La mission se déroule à Kalinine en Russie. Un groupe de terroriste est en train de monter une opération pour prendre le contrôle de la centrale et mettre en péril la sécurité du pays.", "ELI-RUS-7998", "Russie", "1984-12-14", 2, 2),
(NULL, "Ambassade de chine", "L'objectif est de mettre sur écoute une conversation entre les cibles X-183 et X-172. Il faudra vous mettre en relation avec le contact CO-43 afin de passer la sécurité.", "INF-MYA-105", "Myanmar", "1986-06-14", 1, 1),
(NULL, "Chantier navale Russe", "L'objectif est d'intercepter / éliminer un groupe de terroriste qui envisage de prendre possession de la base naval. Cette zone comporte des armements lourds et données sensibles. Il faudra empêcher l'attaque de force si nécessaire.", "ELI-RUS-8011", "Russie", "1987-03-02", 2, 5);

-- |------------------------------|------------------------------| --
-- create table and insert data
-- Secondary tables
-- |------------------------------|------------------------------| --

-- Delete Table if it exists
DROP TABLE IF EXISTS `Roles`;
-- Structure of the table `Roles`
CREATE TABLE IF NOT EXISTS `Roles` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `level` varchar(55) NOT NULL
);

INSERT INTO `Roles` (`id`, `level`) VALUES
(NULL, "Administrator"),
(NULL, "Agent"),
(NULL, "Contact");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Skills`;
-- Structure of the table `Skills`
CREATE TABLE IF NOT EXISTS `Skills` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `skill` varchar(55) NOT NULL
);

INSERT INTO `Skills` (`id`, `skill`) VALUES
(NULL, "Infiltration"),
(NULL, "Elimination"),
(NULL, "Combat"),
(NULL, "Snipper"),
(NULL, "Informatique");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Type_missions`;
-- Structure of the table `Type_missions`
CREATE TABLE IF NOT EXISTS `Type_missions` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL
);

INSERT INTO `Type_missions` (`id`, `name`) VALUES
(NULL, "Renseignement"),
(NULL, "Terrorisme"),
(NULL, "Assassinat");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Type_stakeouts`;
-- Structure of the table `Type_stakeouts`
CREATE TABLE IF NOT EXISTS `Type_stakeouts` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL
);

INSERT INTO `Type_stakeouts` (`id`, `name`) VALUES
(NULL, "Zone urbaine"),
(NULL, "Zone peu urbaine"),
(NULL, "Zone village"),
(NULL, "Zone montagneuse"),
(NULL, "Zone aquatique"),
(NULL, "Zone désertique");

-- |------------------------------|------------------------------| --
-- Junctions Tables
-- |------------------------------|------------------------------| --

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Agents`;
-- Structure of the table `Missions_Agents`
CREATE TABLE IF NOT EXISTS `Missions_Agents` (
  `missionsId` int(11) NOT NULL,
  `agentsId` int(11) NOT NULL
);

INSERT INTO `Missions_Agents` (`missionsId`, `agentsId`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 2),
(4, 3);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Contacts`;
-- Structure of the table `Missions_Contacts`
CREATE TABLE IF NOT EXISTS `Missions_Contacts` (
  `missionsId` int(11) NOT NULL,
  `contactsId` int(11) NOT NULL
);

INSERT INTO `Missions_Contacts` (`missionsId`, `contactsId`) VALUES
(1, 4),
(1, 1),
(2, 2),
(2, 5),
(3, 2),
(3, 4),
(4, 3),
(4, 1);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Targets`;
-- Structure of the table `Missions_Targets`
CREATE TABLE IF NOT EXISTS `Missions_Targets` (
  `missionsId` int(11) NOT NULL,
  `targetsId` int(11) NOT NULL
);

INSERT INTO `Missions_Targets` (`missionsId`, `targetsId`) VALUES
(1, 1),
(1, 3),
(2, 5),
(2, 6),
(3, 4),
(4, 2);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Stakeouts`;
-- Structure of the table `Missions_Stakeouts`
CREATE TABLE IF NOT EXISTS `Missions_Stakeouts` (
  `missionsId` int(11) NOT NULL,
  `stakeoutsId` int(11) NOT NULL
);

INSERT INTO `Missions_Stakeouts` (`missionsId`, `stakeoutsId`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Stakeouts`;
-- Structure of the table `Missions_Stakeouts`
CREATE TABLE IF NOT EXISTS `Missions_Stakeouts` (
  `missionsId` int(11) NOT NULL,
  `stakeoutsId` int(11) NOT NULL
);

INSERT INTO `Missions_Stakeouts` (`missionsId`, `stakeoutsId`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Skills`;
-- Structure of the table `Missions_Skills`
CREATE TABLE IF NOT EXISTS `Missions_Skills` (
  `missionsId` int(11) NOT NULL,
  `skillsId` int(11) NOT NULL
);

INSERT INTO `Missions_Skills` (`missionsId`, `skillsId`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 2),
(3, 3),
(3, 1),
(3, 4),
(4, 1),
(4, 5);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Agents_Skills`;
-- Structure of the table `Agents_Skills`
CREATE TABLE IF NOT EXISTS `Agents_Skills` (
  `agentsId` int(11) NOT NULL,
  `skillsId` int(11) NOT NULL
);

INSERT INTO `Agents_Skills` (`agentsId`, `skillsId`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 5),
(4, 2),
(4, 3);
-- |------------------------------|------------------------------| --
-- Associations
-- |------------------------------|------------------------------| --

-- Association Type_missions -> Missions
ALTER TABLE `Missions` ADD CONSTRAINT `FK_MISSIONS_TYPE_MISSION` FOREIGN KEY (`type_missionsId`) REFERENCES `Type_missions`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association Type_stakeouts -> Missions
ALTER TABLE `Missions` ADD CONSTRAINT `FK_MISSIONS_TYPE_STAKEOUTS` FOREIGN KEY (`type_stakeoutsId`) REFERENCES `Type_stakeouts`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Associations Roles
-- Association OneToMany Roles -> Agents 
ALTER TABLE `Agents` ADD CONSTRAINT `FK_ROLES_AGENTS` FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Roles -> Contacts 
ALTER TABLE `Contacts` ADD CONSTRAINT `FK_ROLES_CONTACTS` FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Roles -> Administrators 
ALTER TABLE `Administrators` ADD CONSTRAINT `FK_ROLES_ADMINISTRATORS` FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Associations Missions
-- Association ManyToMany Missions -> Agents 
ALTER TABLE `Missions_Agents` ADD CONSTRAINT `FK_AGENTS_MISSIONS` FOREIGN KEY (`agentsId`) REFERENCES `Agents`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Missions_Agents` ADD CONSTRAINT `FK_MISSIONS_AGENTS` FOREIGN KEY (`missionsId`) REFERENCES `Missions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Association ManyToMany Missions -> Contacts 
ALTER TABLE `Missions_Contacts` ADD CONSTRAINT `FK_CONTACTS_MISSIONS` FOREIGN KEY (`contactsId`) REFERENCES `Contacts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Missions_Contacts` ADD CONSTRAINT `FK_MISSIONS_CONTACTS` FOREIGN KEY (`missionsId`) REFERENCES `Missions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Association ManyToMany Missions -> Targets 
ALTER TABLE `Missions_Targets` ADD CONSTRAINT `FK_TARGETS_MISSIONS` FOREIGN KEY (`targetsId`) REFERENCES `Targets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Missions_Targets` ADD CONSTRAINT `FK_MISSIONS_TARGETS` FOREIGN KEY (`missionsId`) REFERENCES `Missions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Association ManyToMany Missions -> Stakeouts 
ALTER TABLE `Missions_Stakeouts` ADD CONSTRAINT `FK_STAKEOUTS_MISSIONS` FOREIGN KEY (`stakeoutsId`) REFERENCES `Stakeouts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Missions_Stakeouts` ADD CONSTRAINT `FK_MISSIONS_STAKEOUTS` FOREIGN KEY (`missionsId`) REFERENCES `Missions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Association Skills
-- Association ManyToMany Agents -> Skills
ALTER TABLE `Agents_Skills` ADD CONSTRAINT `FK_SKILLS_AGENTS` FOREIGN KEY (`skillsId`) REFERENCES `Skills`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Agents_Skills` ADD CONSTRAINT `FK_AGENTS_SKILLS` FOREIGN KEY (`agentsId`) REFERENCES `Agents`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Association ManyToMany Missions -> Skills
ALTER TABLE `Missions_Skills` ADD CONSTRAINT `FK_SKILLS_MISSIONS` FOREIGN KEY (`skillsId`) REFERENCES `Skills`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Missions_Skills` ADD CONSTRAINT `FK_MISSIONS_SKILLS` FOREIGN KEY (`missionsId`) REFERENCES `Missions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Example query for retrieve many to many
-- SELECT m.id, m.title, m.description, m.codeName, m.country, m.startDate, m.endDate, m.imageUrl, GROUP_CONCAT(ma.agentsId) as agents
-- FROM Missions m JOIN 
--      Missions_Agents ma
--      ON m.id = ma.missionsId
--      WHERE m.id = 1
-- GROUP BY m.id;