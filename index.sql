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
  `id_agents` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birth_date` date NOT NULL,
  `code_name` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255),
  `role_id` int(11) NOT NULL
);

INSERT INTO `Agents` 
(`id_agents`, `lastname`, `firstname`, `birth_date`, `code_name`, `nationality`, `role_id`) VALUES
(NULL, "Volkov", "Vitaly", "1976-04-16", "Baimet", "Russe", 2),
(NULL, "Tretiakov", "Oscar", "1953-02-03", "Sheining", "Russe", 2),
(NULL, "Glazkov", "Zossima", "1980-08-29", "Anna", "Tchèque", 2),
(NULL, "Mellor", "Mia", "1986-06-06", "Lormand", "Anglais", 2),
(NULL, "Erzok", "Gall", "1978-11-28", "Wiltionew", "Anglais", 2);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Targets`;
-- Structure of the table `Targets`
CREATE TABLE IF NOT EXISTS `Targets` (
  `id_targets` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birth_date` date NOT NULL,
  `code_name` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255)
);

INSERT INTO `Targets` 
(`id_targets`, `lastname`, `firstname`, `birth_date`, `code_name`, `nationality`) VALUES
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
  `id_contacts` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `birth_date` date NOT NULL,
  `code_name` varchar(55) NOT NULL,
  `nationality` varchar(55) NOT NULL,
  `imageUrl` varchar(255),
  `role_id` int(11) NOT NULL
);

INSERT INTO `Contacts` 
(`id_contacts`, `lastname`, `firstname`, `birth_date`, `code_name`, `nationality`, `role_id`) VALUES
(NULL, "Shäfer", "Karl", "1983-03-27", "CO-016", "Etats Unis", 3),
(NULL, "Dante", "Jason", "1960-04-09", "CO-032", "Allemand", 3),
(NULL, "Perez", "Vincent", "1970-09-07", "CO-041", "Espagnol", 3),
(NULL, "Kratky", "Filip", "1970-09-07", "CO-041", "Russe", 3),
(NULL, "Chiff", "Salim", "1983-07-18", "CO-43", "Marocain", 3);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Stakeouts`;
-- Structure of the table `Stakeouts`
CREATE TABLE IF NOT EXISTS `Stakeouts` (
  `id_stakeouts` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(55) NULL,
  `imageUrl` varchar(255),
  `type_stakeouts_id` int(11) NOT NULL
);

INSERT INTO `Stakeouts` 
(`id_stakeouts`, `code`, `address`, `country`, `type_stakeouts_id`) VALUES
(NULL, "TX-106", "49 rue Krtsanisis, Tbilisi 0114", "Géorgie", 1),
(NULL, "TX-236", "Udomlya, Tver Oblast 171854", "Russie", 2),
(NULL, "TX-442", "Ambassade de chine", "Myanmar", 1),
(NULL, "TX-568", "Péninsule de Kola", "Russie", 5),
(NULL, "TX-033", "Old Town", "Royaume-Uni", 2);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Administrators`;
-- Structure of the table `Administrators`
CREATE TABLE IF NOT EXISTS `Administrators` (
  `id_administrators` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `lastname` varchar(55) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `imageUrl` varchar(255),
  `createdAt` datetime NOT NULL,
  `role_id` int(11) NOT NULL
);

INSERT INTO `Administrators` 
(`id_administrators`, `lastname`, `firstname`, `email`, `password`, `createdAt`, `role_id`) VALUES
(NULL, "Chélépine", "Alexandre", "Alexandre.chelepine@kgb.ru", "Aleche123!", "1958-09-01 06:02:38", 1),
(NULL, "Bakatine", "Vadim", "Vadim.bakatine@kgb.ru", "Vadbak123!", "1991-08-01 06:13:46", 1),
(NULL, "Tchebrikov", "Viktor", "Viktor.tchebrikov@kgb.ru", "Viktch123!", "1982-09-01 06:06:52", 1);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions`;
-- Structure of the table `Missions`
CREATE TABLE IF NOT EXISTS `Missions` (
  `id_missions` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code_name` varchar(55) NOT NULL,
  `country` varchar(55) NULL,
  `startDate` date NOT NULL, 
  `endDate` date,
  `imageUrl` varchar(255),
  `type_missions_id` int(11),
  `type_stakeouts_id` int(11)
);

INSERT INTO `Missions` (`id_missions`, `title`, `description`, `code_name`, `country`, `startDate`, `type_missions_id`, `type_stakeouts_id`) VALUES
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
  `id_roles` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `level` varchar(55) NOT NULL
);

INSERT INTO `Roles` (`id_roles`, `level`) VALUES
(NULL, "Administrator"),
(NULL, "Agent"),
(NULL, "Contact");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Skills`;
-- Structure of the table `Skills`
CREATE TABLE IF NOT EXISTS `Skills` (
  `id_skills` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `skill` varchar(55) NOT NULL
);

INSERT INTO `Skills` (`id_skills`, `skill`) VALUES
(NULL, "Infiltration"),
(NULL, "Elimination"),
(NULL, "Combat"),
(NULL, "Snipper"),
(NULL, "Informatique");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Type_missions`;
-- Structure of the table `Type_missions`
CREATE TABLE IF NOT EXISTS `Type_missions` (
  `id_type_missions` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL
);

INSERT INTO `Type_missions` (`id_type_missions`, `name`) VALUES
(NULL, "Renseignement"),
(NULL, "Terrorisme"),
(NULL, "Assassinat");

-- Delete Table if it exists
DROP TABLE IF EXISTS `Type_stakeouts`;
-- Structure of the table `Type_stakeouts`
CREATE TABLE IF NOT EXISTS `Type_stakeouts` (
  `id_type_stakeouts` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL
);

INSERT INTO `Type_stakeouts` (`id_type_stakeouts`, `name`) VALUES
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
  `missions_id` int(11) NOT NULL,
  `agents_id` int(11) NOT NULL
);

INSERT INTO `Missions_Agents` (`missions_id`, `agents_id`) VALUES
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
  `missions_id` int(11) NOT NULL,
  `contacts_id` int(11) NOT NULL
);

INSERT INTO `Missions_Contacts` (`missions_id`, `contacts_id`) VALUES
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
  `missions_id` int(11) NOT NULL,
  `targets_id` int(11) NOT NULL
);

INSERT INTO `Missions_Targets` (`missions_id`, `targets_id`) VALUES
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
  `missions_id` int(11) NOT NULL,
  `stakeouts_id` int(11) NOT NULL
);

INSERT INTO `Missions_Stakeouts` (`missions_id`, `stakeouts_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Stakeouts`;
-- Structure of the table `Missions_Stakeouts`
CREATE TABLE IF NOT EXISTS `Missions_Stakeouts` (
  `missions_id` int(11) NOT NULL,
  `stakeouts_id` int(11) NOT NULL
);

INSERT INTO `Missions_Stakeouts` (`missions_id`, `stakeouts_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Delete Table if it exists
DROP TABLE IF EXISTS `Missions_Skills`;
-- Structure of the table `Missions_Skills`
CREATE TABLE IF NOT EXISTS `Missions_Skills` (
  `missions_id` int(11) NOT NULL,
  `skills_id` int(11) NOT NULL
);

INSERT INTO `Missions_Skills` (`missions_id`, `skills_id`) VALUES
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
  `agents_id` int(11) NOT NULL,
  `skills_id` int(11) NOT NULL
);

INSERT INTO `Agents_Skills` (`agents_id`, `skills_id`) VALUES
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
ALTER TABLE `Missions` ADD CONSTRAINT `FK_MISSIONS_TYPE_MISSION` FOREIGN KEY (`type_missions_id`) REFERENCES `Type_missions`(`id_type_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association Type_stakeouts -> Missions
ALTER TABLE `Missions` ADD CONSTRAINT `FK_MISSIONS_TYPE_STAKEOUTS` FOREIGN KEY (`type_stakeouts_id`) REFERENCES `Type_stakeouts`(`id_type_stakeouts`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Associations Roles
-- Association OneToMany Roles -> Agents 
ALTER TABLE `Agents` ADD CONSTRAINT `FK_ROLES_AGENTS` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`id_roles`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Roles -> Contacts 
ALTER TABLE `Contacts` ADD CONSTRAINT `FK_ROLES_CONTACTS` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`id_roles`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association OneToMany Roles -> Administrators 
ALTER TABLE `Administrators` ADD CONSTRAINT `FK_ROLES_ADMINISTRATORS` FOREIGN KEY (`role_id`) REFERENCES `Roles`(`id_roles`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Associations Missions
-- Association ManyToMany Missions -> Agents 
ALTER TABLE `Missions_Agents` ADD CONSTRAINT `FK_AGENTS_MISSIONS` FOREIGN KEY (`agents_id`) REFERENCES `Agents`(`id_agents`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Missions_Agents` ADD CONSTRAINT `FK_MISSIONS_AGENTS` FOREIGN KEY (`missions_id`) REFERENCES `Missions`(`id_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Missions -> Contacts 
ALTER TABLE `Missions_Contacts` ADD CONSTRAINT `FK_CONTACTS_MISSIONS` FOREIGN KEY (`contacts_id`) REFERENCES `Contacts`(`id_contacts`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Missions_Contacts` ADD CONSTRAINT `FK_MISSIONS_CONTACTS` FOREIGN KEY (`missions_id`) REFERENCES `Missions`(`id_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Missions -> Targets 
ALTER TABLE `Missions_Targets` ADD CONSTRAINT `FK_TARGETS_MISSIONS` FOREIGN KEY (`targets_id`) REFERENCES `Targets`(`id_targets`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Missions_Targets` ADD CONSTRAINT `FK_MISSIONS_TARGETS` FOREIGN KEY (`missions_id`) REFERENCES `Missions`(`id_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Missions -> Stakeouts 
ALTER TABLE `Missions_Stakeouts` ADD CONSTRAINT `FK_STAKEOUTS_MISSIONS` FOREIGN KEY (`stakeouts_id`) REFERENCES `Stakeouts`(`id_stakeouts`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Missions_Stakeouts` ADD CONSTRAINT `FK_MISSIONS_STAKEOUTS` FOREIGN KEY (`missions_id`) REFERENCES `Missions`(`id_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association Skills
-- Association ManyToMany Agents -> Skills
ALTER TABLE `Agents_Skills` ADD CONSTRAINT `FK_SKILLS_AGENTS` FOREIGN KEY (`skills_id`) REFERENCES `Skills`(`id_skills`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Agents_Skills` ADD CONSTRAINT `FK_AGENTS_SKILLS` FOREIGN KEY (`agents_id`) REFERENCES `Agents`(`id_agents`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Association ManyToMany Missions -> Skills
ALTER TABLE `Missions_Skills` ADD CONSTRAINT `FK_SKILLS_MISSIONS` FOREIGN KEY (`skills_id`) REFERENCES `Skills`(`id_skills`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Missions_Skills` ADD CONSTRAINT `FK_MISSIONS_SKILLS` FOREIGN KEY (`missions_id`) REFERENCES `Missions`(`id_missions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Example query for retrieve many to many
-- SELECT m.id_missions, m.title, m.description, m.code_name, m.country, m.startDate, m.endDate, m.imageUrl, GROUP_CONCAT(ma.agents_id) as agents
-- FROM Missions m JOIN 
--      Missions_Agents ma
--      ON m.id_missions = ma.missions_id
--      WHERE m.id_missions = 1
-- GROUP BY m.id_missions;