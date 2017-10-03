-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 12 Octobre 2016 à 15:40
-- Version du serveur: 5.5.50-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `intranet_mooc`
--

-- --------------------------------------------------------

--
-- Structure de la table `complement_video`
--
/*Création de la base de données*/
drop database if exists intranet_mooc;
create database if not exists intranet_mooc;
use intranet_mooc;

CREATE TABLE IF NOT EXISTS `complement_video` (
  `idcomplement_video` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(1000) DEFAULT NULL,
  `complement` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idcomplement_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `corresp_divers_etudiant`
--

CREATE TABLE IF NOT EXISTS `corresp_divers_etudiant` (
  `iddivers` int(11) NOT NULL DEFAULT '0',
  `idetudiant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iddivers`,`idetudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `idcours` int(11) NOT NULL AUTO_INCREMENT,
  `titrecours` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `categoriecours` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `descriptioncours` mediumtext CHARACTER SET utf8,
  `nombresemainecours` int(11) DEFAULT NULL,
  `logocours` varchar(1000) DEFAULT NULL,
  `lien` varchar(1000) DEFAULT 'http://coursera.org',
  `introduction` varchar(1000) DEFAULT NULL,
  `ouvert` int(11) DEFAULT '1',
  PRIMARY KEY (`idcours`),
  UNIQUE KEY `idcours_UNIQUE` (`idcours`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `cours`
--
/*
INSERT INTO `cours` (`idcours`, `titrecours`, `categoriecours`, `descriptioncours`, `nombresemainecours`, `logocours`, `lien`, `introduction`, `ouvert`) VALUES
(1, 'Micro controlleur', '', '<p>Le MOOC Comprendre les microcontr&ocirc;leurs,&nbsp;donne les bases th&eacute;oriques et pratiques n&eacute;cessaires &agrave; une bonne compr&eacute;hension et utilisation des microcontr&ocirc;leurs. De nombreux exemples seront abord&eacute;s. Des exercices seront propos&eacute;s, compatibles avec les cartes &agrave; microcontr&ocirc;leurs Arduino ou LaunchPad MSP430G.</p>\r\n', 7, 'img7547449081390399817.png', 'coursera.org', 'video752726297892839934.mp4', 1),
(3, 'Initiation a la programmation en java', '', '<p>Ce cours initie &agrave; la programmation en utilisant le langage Java. Il ne pr&eacute;suppose pas de connaissance pr&eacute;alable. Les aspects plus avanc&eacute;s (programmation orient&eacute;e objet) sont donn&eacute;s dans un cours suivant, &laquo;Introduction &agrave; la programmation orient&eacute;e objet (en Java)&raquo;.</p>\r\n', 6, 'img6336985004658749906.png', 'http://www.coursera.org', 'video907946085174892042.mp4', 1),
(4, 'Initiation a la programmation en C obj', '', '<p><strong>Le</strong> <strong>MOOC&nbsp;Initiation &agrave; la programmation (en C++)</strong>&nbsp;initie &agrave; la programmation en utilisant le langage C++. Il ne pr&eacute;suppose pas de connaissance pr&eacute;alable. Les aspects plus avanc&eacute;s (programmation orient&eacute;e objet) sont donn&eacute;s dans un cours suivant, &laquo;Introduction &agrave; la programmation orient&eacute;e objet (en C++)</p>\r\n', 6, 'img2493463143328719133.png', 'http://www.coursera.org', 'video3936510788340373589.mp4', 1),
(5, 'Analyse numérique', '', '<p>Ce cours contient les 7 premiers chapitres d&#39;un cours donn&eacute; aux &eacute;tudiants bachelor de l&#39;EPFL. Il est bas&eacute; sur le livre &quot;Introduction &agrave; l&#39;analyse num&eacute;rique&quot;, J. Rappaz M. Picasso, Ed. PPUR. Des outils de base sont d&eacute;crits dans les 5 premiers chapitres. Les deux derniers chapitres abordent la question de la r&eacute;solution num&eacute;rique d&#39;&eacute;quations diff&eacute;rentielles.</p>\r\n', 10, 'img8263007981506149481.png', 'http://www.coursera.org', 'video9144901667495849711.mp4', 1),
(6, 'Electronique', '', '<p><strong>Le MOOC Electronique 1&nbsp;</strong>est un cours d&rsquo;introduction &agrave; la r&eacute;alisation des fonctions lin&eacute;aires et non-lin&eacute;aires de base &agrave; l&rsquo;aide de l&rsquo;amplificateur op&eacute;rationnel. â?¨â?¨Les &eacute;tudiants appliquent la th&eacute;orie des circuits, la r&eacute;action n&eacute;gative et positive aux amplificateurs op&eacute;rationnels pour r&eacute;aliser les fonctions &eacute;lectroniques &eacute;l&eacute;mentaires (amplification, filtrage,&nbsp;transposition, addition, soustraction, g&eacute;n&eacute;ration des fonctions p&eacute;riodiques, etc.). Les explications sont illustr&eacute;es par des exercices au laboratoires avec des d&eacute;monstrations qui peuvent &ecirc;tre&nbsp;reproduite par les &eacute;l&egrave;ves par simulation.</p>\r\n', 8, 'img3152777043376478392.png', 'http://www.coursera.org', 'video693580425563826404.mp4', 1),
(7, 'Initiation a la programmation orientée objet en JAVA', '', '<p>Ce cours introduit la programmation orient&eacute;e objet en l&rsquo;illustrant en langage Java. Il pr&eacute;suppose connues les bases de la programmation (variables, types, boucles, fonctions, &hellip;). Il est con&ccedil;u comme la suite du cours &laquo;Initiation &agrave; la programmation (en Java)&raquo;.</p>\r\n', 7, 'img3347359260098100160.png', 'http://www.coursera.org', 'video377376055195939346.mp4', 1),
(8, 'Thermodynamique', '', '<p>Ce cours vous apportera une compr&eacute;hension des concepts fondamentaux de la thermodynamique du point de vue de la physique, de la chimie et de l&rsquo;ing&eacute;nierie. Il est scind&eacute; un deux MOOCs. Dans la premi&egrave;re partie, le Professeur J.-Ph. Ansermet de l&rsquo;EPFL et son collaborateur le Dr. Sylvain Br&eacute;chet ont rassembl&eacute; en quatre le&ccedil;ons tous les principes fondamentaux de la thermodynamique. La deuxi&egrave;me partie du MOOC illustre l&rsquo;approche thermodynamique par une s&eacute;rie d&rsquo;applications pr&eacute;sent&eacute;es par des sp&eacute;cialistes provenant de diverses institutions partenaires du r&eacute;seau RESCIF.</p>\r\n', 4, 'img5832457451375070991.png', 'http://www.coursera.org', 'video1080809920052477547.mp4', 1),
(9, 'ANGULARS COURSE', '', 'Description par defaut.', 0, 'logo.png', 'coursera.org', NULL, 1);

-- --------------------------------------------------------
*/
--
-- creation de la table d'examen
--

CREATE TABLE IF NOT EXISTS examen(
	idcours int(11) not null,
	titreExam varchar(100) character set utf8 not null,
   time Timestamp default now() not null,
   duree integer(7) not null,
   vue varchar(40) default 'true',
   nombreEssai integer(7),
   valeurMax integer(10), 
	primary key (idcours,titreExam),
	foreign key (idcours) REFERENCES cours(idcours)
);

/*
select*,TIMEDIFF(time,'2017-03-14 20:43:20') dif from examen;

-- Insertion des élements dans la table
insert into examen(idcours,titreExam) value
(1,'Examen de fin d\'année 2016/2017'),
(1,'Examen de fin de semestre 2016/2017'),
(3,'Examen de fin de semestre 2016/2017'),
(3,'Examen de fin de semestre 2017/2018'),
(1,'Examen de fin de semestre 2010/2011'),
(4,'Examen de fin de semestre 2016/2017');*/



-- ------------------------------------------------------------
--
-- Structure de la table `divers`
--

CREATE TABLE IF NOT EXISTS `divers` (
  `iddivers` int(11) NOT NULL AUTO_INCREMENT,
  `tempsAlloueGeneral` bigint(255) DEFAULT NULL,
  `jourAlloueGeneral` int(20) DEFAULT NULL,
  `ischrono` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddivers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS forum (
 idcours int(11) not null,
 titresujet varchar(100) not null,
 nombre int(10) default 0,
 primary key(idcours,titresujet),
 foreign key(idcours) references cours(idcours)
 );
 
 
 
 
 /*insert into forum(idcours,titresujet,nombre) value
 (1,"Les circuits intégrés",10),
 (1,"Les génies des circuits",15),
 (1,"Les differents astuces sur les circuits",36);*/

-- Structure de la table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `idenseignant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(1000) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `prenom` varchar(1000) DEFAULT NULL,
  `sexe` varchar(45) DEFAULT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `reponse` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idenseignant`),
  UNIQUE KEY `idenseignant_UNIQUE` (`idenseignant`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='La table concernant les enseignants' AUTO_INCREMENT=4 ;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`idenseignant`, `nom`, `code`, `status`, `prenom`, `sexe`, `question`, `reponse`, `email`) VALUES
(1, 'djobiii', '2078', 'admin', 'djobiii', 'M', 'Djobiii', 'iii', 'djobiii2079@gmail.com');/*,
(2, 'ENSEIGNANT', 'ensp.prof', 'Enseignant', '', 'Masculin', '', '', 'ensp@polytechnique.cm'),
(3, 'ADMIN', 'admin.prof@2016', 'admin', '', 'Masculin', '', '', 'admin@polytechnique.cm');
*/
-- --------------------------------------------------------

--
-- Structure de la table `etd_cours`
--

CREATE TABLE IF NOT EXISTS `etd_cours` (
  `idcours` int(11) DEFAULT NULL,
  `idetudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etd_cours`
--
/*
INSERT INTO `etd_cours` (`idcours`, `idetudiant`) VALUES
(3, 34),
(6, 34);
*/
-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `idetudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `matricule` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetudiant`),
  UNIQUE KEY `idetudiant_UNIQUE` (`idetudiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='La table des etudiants ' AUTO_INCREMENT=36 ;

--
-- Contenu de la table `etudiant`
--
/*
INSERT INTO `etudiant` (`idetudiant`, `nom`, `matricule`, `email`, `password`) VALUES
(34, 'MVONDO DJOB BARBE THYSTERE', '11P252', 'djobiii2078@gmail.com', 'ornella'),
(35, 'MVONDO TOBIAS CLYDE', '11P345', 'mthystere@yahoo.fr', 'ornella');
*/
-- --------------------------------------------------------

--
-- Structure de la table `heure_connexion`
--

CREATE TABLE IF NOT EXISTS `heure_connexion` (
  `matricule` varchar(45) NOT NULL,
  `heure_debut` timestamp NULL DEFAULT NULL,
  `heure_fin` timestamp NULL DEFAULT NULL,
  `ind` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ind`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(45) DEFAULT NULL,
  `datecreation` timestamp NULL DEFAULT NULL,
  `sujet` varchar(225) DEFAULT NULL,
  `texte` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='			' AUTO_INCREMENT=209 ;

--
-- Contenu de la table `message`
--
/*
INSERT INTO `message` (`id`, `auteur`, `datecreation`, `sujet`, `texte`) VALUES
(183, 'djobiii', '2016-08-22 13:02:27', 'PROGRAMMATION EN HTML5', 'Bienvenue au forum sur PROGRAMMATION EN HTML5'),
(184, 'djobiii', '2016-08-22 13:03:08', 'HTML5', 'Bienvenue au forum sur HTML5'),
(185, 'djobiii', '2016-08-22 13:03:29', 'BOTOO', 'Bienvenue au forum sur BOTOO'),
(186, 'djobiii', '2016-08-22 13:05:19', 'BANSHEE', 'Bienvenue au forum sur BANSHEE'),
(187, 'djobiii', '2016-08-22 13:05:29', 'sdfq', 'Bienvenue au forum sur sdfq'),
(188, 'djobiii', '2016-08-22 13:05:58', 'qsdf', 'Bienvenue au forum sur qsdf'),
(189, 'djobiii', '2016-08-22 13:08:03', 'PROGRAMMATION EN HTML5', 'Bienvenue au forum sur PROGRAMMATION EN HTML5'),
(190, 'djobiii', '2016-08-22 13:08:46', 'HTML5', 'Bienvenue au forum sur HTML5'),
(191, 'djobiii', '2016-08-23 07:57:17', 'BUSINESS INTELLIGENCE', 'Bienvenue au forum sur BUSINESS INTELLIGENCE'),
(192, 'djobiii', '2016-08-23 08:00:04', 'BUSINESS INTELLIGENCE', 'Bienvenue au forum sur BUSINESS INTELLIGENCE'),
(193, 'djobiii', '2016-08-23 08:04:35', 'ENERGIE', 'Bienvenue au forum sur ENERGIE'),
(194, 'djobiii', '2016-08-23 08:32:28', 'INTEGRATION NUMERIQUE', 'Bienvenue au forum sur INTEGRATION NUMERIQUE'),
(195, 'djobiii', '2016-08-23 08:33:38', 'ANALYSE NUMERIQUE', 'Bienvenue au forum sur ANALYSE NUMERIQUE'),
(196, 'djobiii', '2016-08-23 09:10:19', 'PROGRAMMATION EN HTML5', 'Bienvenue au forum sur PROGRAMMATION EN HTML5'),
(197, 'djobiii', '2016-08-23 09:57:35', 'PROGRAMMATION EN HTML5', 'Bienvenue au forum sur PROGRAMMATION EN HTML5'),
(198, 'djobiii', '2016-08-23 11:59:58', 'HTML5', 'Bienvenue au forum sur HTML5'),
(199, 'djobiii', '2016-08-26 16:56:38', 'INITIATION A LA PROGRAMMATION EN JAVA', 'Bienvenue au forum sur INITIATION A LA PROGRAMMATION EN JAVA'),
(200, 'ENSEIGNANT', '2016-08-29 14:48:00', 'Micro Controlleur', 'Bienvenue au forum sur Micro Controlleur'),
(201, 'ENSEIGNANT', '2016-08-29 14:50:26', 'Mécanique', 'Bienvenue au forum sur Mécanique'),
(202, 'ENSEIGNANT', '2016-08-29 14:51:49', 'Initiation à la programmation en java', 'Bienvenue au forum sur Initiation à la programmation en java'),
(203, 'ENSEIGNANT', '2016-08-29 14:53:43', 'Initiation à la programmation en C++', 'Bienvenue au forum sur Initiation à la programmation en C++'),
(204, 'ENSEIGNANT', '2016-08-29 14:58:05', 'Analyse numérique', 'Bienvenue au forum sur Analyse numérique'),
(205, 'ENSEIGNANT', '2016-08-29 14:59:15', 'Electronique', 'Bienvenue au forum sur Electronique'),
(206, 'ENSEIGNANT', '2016-08-29 15:01:49', 'Initiation à la programmation orientée objet en JAVA', 'Bienvenue au forum sur Initiation à la programmation orientée objet en JAVA'),
(207, 'ENSEIGNANT', '2016-08-29 15:03:39', 'Thermodynamique', 'Bienvenue au forum sur Thermodynamique'),
(208, 'ENSEIGNANT', '2016-08-30 18:04:20', 'ANGULARS COURSE', 'Bienvenue au forum sur ANGULARS COURSE');
*/
-- --------------------------------------------------------

--
-- Structure de la table `prof_cours`
--

CREATE TABLE IF NOT EXISTS `prof_cours` (
  `idpro` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prof_cours`
--
/*
INSERT INTO `prof_cours` (`idpro`, `id_cours`) VALUES
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9);
*/
-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `idquiz` int(11) NOT NULL AUTO_INCREMENT,
  `nomquiz` varchar(45) DEFAULT NULL,
  `idcours` int(21) NOT NULL,
  `numeroSemaine` int(11) DEFAULT NULL,
  PRIMARY KEY (`idquiz`,`idcours`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `quiz`
--
/*
INSERT INTO `quiz` (`idquiz`, `nomquiz`, `idcours`, `numeroSemaine`) VALUES
(17, 'exercice7948427595216661906.pdf', 30, 1);
*/
-- --------------------------------------------------------

--
-- Structure de la table `quiz_prof`
--

CREATE TABLE IF NOT EXISTS `quiz_prof` (
  `idquiz` int(11) NOT NULL,
  `idprof` varchar(45) NOT NULL,
  PRIMARY KEY (`idquiz`,`idprof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `quiz_prof`
--
/*
INSERT INTO `quiz_prof` (`idquiz`, `idprof`) VALUES
(18, '2');
*/
-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `idsession` int(11) NOT NULL AUTO_INCREMENT,
  `idEtudiant` int(11) NOT NULL,
  `tempsAlloue` bigint(255) DEFAULT NULL,
  `tempsRestant` bigint(255) DEFAULT NULL,
  `dateDebut` datetime DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `nombreJourRestant` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsession`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

--
-- Contenu de la table `session`
--
/*
INSERT INTO `session` (`idsession`, `idEtudiant`, `tempsAlloue`, `tempsRestant`, `dateDebut`, `dateFin`, `nombreJourRestant`) VALUES
(108, 17, 0, 0, '2016-08-22 14:17:11', '2016-08-22 14:17:11', 0),
(109, 0, 0, -1471872035084, '1970-01-01 01:00:00', '2016-08-22 14:20:35', 0),
(110, 18, 0, 0, '2016-08-22 14:21:04', '2016-08-22 14:21:04', 0),
(111, 0, 0, -1471872164177, '1970-01-01 01:00:00', '2016-08-22 14:22:44', 0),
(112, 19, 0, 0, '2016-08-23 10:59:01', '2016-08-23 10:59:01', 0),
(113, 0, 0, -1471946567407, '1970-01-01 01:00:00', '2016-08-23 11:02:47', 0),
(114, 20, 0, 0, '2016-08-23 13:14:47', '2016-08-23 13:14:47', 0),
(115, 21, 0, 0, '2016-08-23 13:15:49', '2016-08-23 13:15:49', 0),
(116, 0, 0, -1472207779175, '1970-01-01 01:00:00', '2016-08-26 11:36:19', 0),
(117, 0, 0, -1472208043677, '1970-01-01 01:00:00', '2016-08-26 11:40:43', 0),
(118, 0, 0, -1472231135167, '1970-01-01 01:00:00', '2016-08-26 18:05:35', 0),
(119, 22, 0, 0, '2016-08-27 18:58:42', '2016-08-27 18:58:42', 0),
(120, 23, 0, 0, '2016-08-27 19:10:08', '2016-08-27 19:10:08', 0),
(121, 24, 0, 0, '2016-08-27 19:14:10', '2016-08-27 19:14:10', 0),
(122, 25, 0, 0, '2016-08-27 19:15:43', '2016-08-27 19:15:43', 0),
(123, 26, 0, 0, '2016-08-27 19:17:28', '2016-08-27 19:17:28', 0),
(124, 27, 0, 0, '2016-08-27 19:18:28', '2016-08-27 19:18:28', 0),
(125, 28, 0, 0, '2016-08-27 19:22:50', '2016-08-27 19:22:50', 0),
(126, 29, 0, 0, '2016-08-27 19:25:37', '2016-08-27 19:25:37', 0),
(127, 30, 0, 0, '2016-08-27 19:27:35', '2016-08-27 19:27:35', 0),
(128, 31, 0, 0, '2016-08-27 19:31:52', '2016-08-27 19:31:52', 0),
(129, 32, 0, 0, '2016-08-27 19:35:03', '2016-08-27 19:35:03', 0),
(130, 33, 0, 0, '2016-08-27 19:43:48', '2016-08-27 19:43:48', 0),
(131, 0, 0, -1472323617609, '1970-01-01 01:00:00', '2016-08-27 19:46:57', 0),
(132, 34, 0, 0, '2016-08-27 19:48:58', '2016-08-27 19:48:58', 0),
(133, 0, 0, -1472323795314, '1970-01-01 01:00:00', '2016-08-27 19:49:55', 0),
(134, 0, 0, -1472485092902, '1970-01-01 01:00:00', '2016-08-29 16:38:12', 0),
(135, 0, 0, -1472489753872, '1970-01-01 01:00:00', '2016-08-29 17:55:53', 0),
(136, 0, 0, -1472490003506, '1970-01-01 01:00:00', '2016-08-29 18:00:03', 0),
(137, 0, 0, -1472749061781, '1970-01-01 01:00:00', '2016-09-01 17:57:41', 0),
(138, 0, 0, -1472823881424, '1970-01-01 01:00:00', '2016-09-02 14:44:41', 0),
(139, 0, 0, -1472825663403, '1970-01-01 01:00:00', '2016-09-02 15:14:23', 0),
(140, 35, 0, 0, '2011-09-11 19:29:29', '2011-09-11 19:29:29', 0),
(141, 0, 0, -1315765845894, '1970-01-01 01:00:00', '2011-09-11 19:30:45', 0);
*/
-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `semaine` int(11) NOT NULL,
  `video` varchar(1000) DEFAULT NULL,
  `id_cours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `devoir` (
`iddevoir` int(20) not null auto_increment,
`idcours` int(11) not null,
`idetudiant` int(11) not null,
`nomdevoir` varchar(45) default null,
`dateEnvoie` Timestamp default now(),
`note` varchar(10) default "",
`liendevoir` varchar(150) default "",
`vue` varchar(11) default 'false',
`etudiant` varchar(11) default 'true',
`enseignant` varchar(11) default 'true',
PRIMARY KEY(`iddevoir`),
foreign key(idcours) references cours(idcours),
foreign key(idetudiant) references etudiant(idetudiant)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `video`
--
/*
INSERT INTO `video` (`semaine`, `video`, `id_cours`) VALUES
(1, 'video946609803264758696.mp4', 1),
(1, 'video8435270079420702192.mp4', 1),
(1, 'video2079583259545812583.mp4', 1),
(1, 'video537544986342639010.mp4', 1),
(1, 'video543215347148699642.mp4', 1),
(1, 'video8667726068950329920.mp4', 1),
(1, 'video6572452748144509612.mp4', 1),
(1, 'video901182273175995059.mp4', 1),
(1, 'video5100900140810432194.mp4', 1),
(1, 'video7490120311068785303.mp4', 1),
(1, 'video2796361328177733136.mp4', 1),
(2, 'video3621650542310157937.mp4', 1),
(2, 'video8343148194135792547.mp4', 1),
(2, 'video3627408844795087827.mp4', 1),
(2, 'video8708484026303019994.mp4', 1),
(2, 'video5509396661421590163.mp4', 1),
(2, 'video3409350947262981514.mp4', 1),
(3, 'video1319117075628596710.mp4', 1),
(3, 'video753575999331065992.mp4', 1),
(3, 'video6404141225825074463.mp4', 1),
(3, 'video8929378880648418243.mp4', 1),
(3, 'video2562046843622957896.mp4', 1),
(3, 'video8352274512576784015.mp4', 1),
(4, 'video8446075028832032537.mp4', 1),
(4, 'video604828276473930127.mp4', 1),
(4, 'video5948064353657143497.mp4', 1),
(4, 'video4675682891502200850.mp4', 1),
(4, 'video1344637411845725403.mp4', 1),
(4, 'video6577926200973737585.mp4', 1),
(4, 'video1493086484793541337.mp4', 1),
(5, 'video2655592859779525646.mp4', 1),
(5, 'video8594200627567959902.mp4', 1),
(5, 'video3363378540089443358.mp4', 1),
(5, 'video3777085948078512562.mp4', 1),
(5, 'video4720918262854658687.mp4', 1),
(5, 'video7546050744166673641.mp4', 1),
(5, 'video7345177694183567944.mp4', 1),
(6, 'video7452836385209230038.mp4', 1),
(6, 'video818163646866716954.mp4', 1),
(6, 'video7282249075550821243.mp4', 1),
(6, 'video3644925909487905933.mp4', 1),
(6, 'video3858442847025184089.mp4', 1),
(6, 'video6002005119366269178.mp4', 1),
(7, 'video6256731066264865239.mp4', 1),
(7, 'video7314131556316662330.mp4', 1),
(7, 'video3628507450200506947.mp4', 1),
(7, 'video1937950529852417873.mp4', 1),
(7, 'video7388068144081120697.mp4', 1),
(1, 'video6310072085440590740.mp4', 3),
(1, 'video8861444846067325851.mp4', 3),
(1, 'video800021605311123911.mp4', 3),
(2, 'video6609474644579784868.mp4', 3),
(2, 'video1031771325171067744.mp4', 3),
(2, 'video7265132479399139598.mp4', 3),
(2, 'video1524354950036235977.mp4', 3),
(2, 'video4036025970260336838.mp4', 3),
(2, 'video2260747935615604164.mp4', 3),
(2, 'video8286297492130023383.mp4', 3),
(2, 'video3843907477796369743.mp4', 3),
(2, 'video8299417172955428513.mp4', 3),
(3, 'video3971973068425958897.mp4', 3),
(3, 'video6931281809127398876.mp4', 3),
(3, 'video3420590110842543541.mp4', 3),
(3, 'video172075819410730337.mp4', 3),
(3, 'video5297043904225782137.mp4', 3),
(3, 'video7092632830020501093.mp4', 3),
(3, 'video8018800624097075645.mp4', 3),
(4, 'video4824643481081382562.mp4', 3),
(4, 'video1319204796647635103.mp4', 3),
(4, 'video5994330488145602999.mp4', 3),
(4, 'video1990601672088118724.mp4', 3),
(4, 'video3757093227783840548.mp4', 3),
(4, 'video1584303416422019750.mp4', 3),
(4, 'video8588810963722945056.mp4', 3),
(4, 'video8686582284932548380.mp4', 3),
(4, 'video339631649404526781.mp4', 3),
(6, 'video9098976439224421082.mp4', 3),
(6, 'video3904340721222831648.mp4', 3),
(6, 'video2663073919280737666.mp4', 3),
(6, 'video4939254788314479997.mp4', 3),
(6, 'video2583465092310862467.mp4', 3),
(6, 'video3818805132243978118.mp4', 3),
(6, 'video1399189905110549602.mp4', 3),
(1, 'video5431433656904345932.mp4', 4),
(1, 'video8754155322311746076.mp4', 4),
(1, 'video1648468856047546199.mp4', 4),
(2, 'video7981358704759045585.mp4', 4),
(2, 'video305369670184562243.mp4', 4),
(2, 'video906650691143846453.mp4', 4),
(2, 'video7434914559884918912.mp4', 4),
(2, 'video4603406302151317233.mp4', 4),
(2, 'video5953709247076685073.mp4', 4),
(2, 'video269252792002495888.mp4', 4),
(2, 'video5228610725614835889.mp4', 4),
(2, 'video6459290403845005019.mp4', 4),
(3, 'video4559600960380955758.mp4', 4),
(3, 'video3360720204859954216.mp4', 4),
(3, 'video5547434813319369809.mp4', 4),
(3, 'video4968225977781422717.mp4', 4),
(3, 'video211673193473415692.mp4', 4),
(3, 'video8404416919805914931.mp4', 4),
(3, 'video6070378270292453325.mp4', 4),
(4, 'video4615280841079841483.mp4', 4),
(4, 'video5278141998735618577.mp4', 4),
(4, 'video1103930567409222858.mp4', 4),
(4, 'video2337037880842834459.mp4', 4),
(4, 'video7684944462878107300.mp4', 4),
(4, 'video4789159302633928590.mp4', 4),
(4, 'video7357938316707216207.mp4', 4),
(4, 'video2902024783698600027.mp4', 4),
(4, 'video1594592274278833549.mp4', 4),
(5, 'video8423736827793562614.mp4', 4),
(5, 'video3934005658131319639.mp4', 4),
(5, 'video1922643872633320337.mp4', 4),
(5, 'video8502594284874141778.mp4', 4),
(5, 'video5504887448749279950.mp4', 4),
(5, 'video5384239960330909423.mp4', 4),
(5, 'video4456092633438876492.mp4', 4),
(5, 'video2580076961897391245.mp4', 4),
(6, 'video4472677869215657463.mp4', 4),
(6, 'video218437396655259737.mp4', 4),
(6, 'video8956238410499698280.mp4', 4),
(6, 'video2693229201599606663.mp4', 4),
(6, 'video4617116330013248320.mp4', 4),
(6, 'video3755861534413835480.mp4', 4),
(6, 'video2758966041533955865.mp4', 4),
(1, 'video1331846465934414056.mp4', 5),
(1, 'video9187824471963525470.mp4', 5),
(1, 'video18991592099127846.mp4', 5),
(1, 'video7410695190891083245.mp4', 5),
(1, 'video1442470263902658960.mp4', 5),
(1, 'video2797536729923969710.mp4', 5),
(1, 'video1632406706336607694.mp4', 5),
(1, 'video6003974917921581658.mp4', 5),
(2, 'video3691165583741119297.mp4', 5),
(2, 'video4226871110235665646.mp4', 5),
(2, 'video3522037048447061481.mp4', 5),
(2, 'video5323330381740519290.mp4', 5),
(2, 'video3512965563587326153.mp4', 5),
(2, 'video3794586749376570241.mp4', 5),
(2, 'video1648909408059594430.mp4', 5),
(2, 'video8938497404876736746.mp4', 5),
(2, 'video3769471140326002164.mp4', 5),
(2, 'video4288353195160980240.mp4', 5),
(3, 'video7198053290616054872.mp4', 5),
(3, 'video5463867588832109721.mp4', 5),
(3, 'video5444905488483436838.mp4', 5),
(3, 'video3300239458313780909.mp4', 5),
(3, 'video3351584166935632080.mp4', 5),
(3, 'video6768352200593185459.mp4', 5),
(3, 'video1247827205453232010.mp4', 5),
(3, 'video7664668058220885381.mp4', 5),
(3, 'video2002935605927630756.mp4', 5),
(3, 'video2366363857989248471.mp4', 5),
(4, 'video1059017056952104828.mp4', 5),
(4, 'video6167031131093379976.mp4', 5),
(4, 'video3832252566768966369.mp4', 5),
(4, 'video5298693613770801571.mp4', 5),
(4, 'video9022376479814161835.mp4', 5),
(4, 'video898402455791578988.mp4', 5),
(4, 'video7902987554485515767.mp4', 5),
(4, 'video5352585818877100460.mp4', 5),
(8, 'video7271375230036637195.mp4', 5),
(8, 'video5478883046673841832.mp4', 5),
(8, 'video4007089069974652694.mp4', 5),
(8, 'video8255657922763870873.mp4', 5),
(8, 'video1424279311985323477.mp4', 5),
(8, 'video4051243500039073256.mp4', 5),
(8, 'video8201620255731666283.mp4', 5),
(8, 'video2470765509681809302.mp4', 5),
(8, 'video1657485463289073076.mp4', 5),
(8, 'video8703244979439137948.mp4', 5),
(9, 'video1995572832966431850.mp4', 5),
(9, 'video181639744792804945.mp4', 5),
(9, 'video1411992706487013519.mp4', 5),
(9, 'video4570316990035683814.mp4', 5),
(9, 'video11539697341735467.mp4', 5),
(9, 'video2020865529418337309.mp4', 5),
(9, 'video2481977604662417729.mp4', 5),
(9, 'video8958603980750496434.mp4', 5),
(9, 'video1317640058342244473.mp4', 5),
(10, 'video7597265271887328083.mp4', 5),
(10, 'video8953180219979134484.mp4', 5),
(10, 'video3128692569142479871.mp4', 5),
(10, 'video3969522469696548627.mp4', 5),
(10, 'video3851243930537137406.mp4', 5),
(10, 'video7257799908166812085.mp4', 5),
(10, 'video2938959605133418451.mp4', 5),
(1, 'video1883711539249503015.mp4', 6),
(2, 'video1708544773439973107.mp4', 6),
(2, 'video815229734075844375.mp4', 6),
(2, 'video8197893577191986133.mp4', 6),
(3, 'video3713363340457820364.mp4', 6),
(3, 'video4423450464563250841.mp4', 6),
(3, 'video5663747081343347952.mp4', 6),
(4, 'video6237468630742751484.mp4', 6),
(4, 'video6220378122276897379.mp4', 6),
(5, 'video437539368302464435.mp4', 6),
(5, 'video4910954103145830843.mp4', 6),
(5, 'video3002252698027840065.mp4', 6),
(6, 'video8397856495906721729.mp4', 6),
(6, 'video7974751321055371834.mp4', 6),
(6, 'video1770754652505798298.mp4', 6),
(7, 'video8183144726388498860.mp4', 6),
(7, 'video3521944343711538178.mp4', 6),
(7, 'video2927717225958785918.mp4', 6),
(8, 'video2281075959171210956.mp4', 6),
(8, 'video1581359050850257891.mp4', 6),
(8, 'video5170312916290418529.mp4', 6),
(8, 'video4447096683187929603.mp4', 6),
(1, 'video8508404547545305101.mp4', 7),
(1, 'video69188606610594255.mp4', 7),
(1, 'video4346947525385826563.mp4', 7),
(1, 'video6670393235830908427.mp4', 7),
(1, 'video3121889845763108711.mp4', 7),
(2, 'video5856455645229401941.mp4', 7),
(2, 'video2405550550228477999.mp4', 7),
(2, 'video8802585495738639035.mp4', 7),
(2, 'video6370187690349441366.mp4', 7),
(3, 'video6036179018552009659.mp4', 7),
(3, 'video8992028948317994052.mp4', 7),
(3, 'video4289657750147785179.mp4', 7),
(3, 'video6920680474064061368.mp4', 7),
(3, 'video746825405354972511.mp4', 7),
(4, 'video4634995360095058985.mp4', 7),
(4, 'video7613860904190816533.mp4', 7),
(4, 'video7308268637607368805.mp4', 7),
(5, 'video2814804988984288934.mp4', 7),
(5, 'video1812127804746580954.mp4', 7),
(5, 'video4985402397710553564.mp4', 7),
(6, 'video1677072603191743074.mp4', 7),
(6, 'video1668206178554842494.mp4', 7),
(6, 'video6765358123137237910.mp4', 7),
(7, 'video4736904893657028545.mp4', 7),
(7, 'video3094046796469975596.mp4', 7),
(7, 'video2402304268661636451.mp4', 7),
(7, 'video2610749947047508967.mp4', 7),
(7, 'video5917393166762884719.mp4', 7),
(1, 'video5900845675575969385.mp4', 8),
(1, 'video2908489231500547752.mp4', 8),
(1, 'video3422226410213100323.mp4', 8),
(1, 'video3530134835938834502.mp4', 8),
(1, 'video2427366118340203137.mp4', 8),
(2, 'video7805595726014953961.mp4', 8),
(2, 'video585867342654316795.mp4', 8),
(2, 'video3564074167769416480.mp4', 8),
(2, 'video7319212299096291769.mp4', 8),
(3, 'video2314542135907255249.mp4', 8),
(3, 'video4232987069816684013.mp4', 8),
(3, 'video6666530156613533046.mp4', 8),
(3, 'video1945071579535151336.mp4', 8),
(3, 'video5788579439729400998.mp4', 8),
(4, 'video3834532504731079113.mp4', 8),
(4, 'video5803985091093532912.mp4', 8),
(4, 'video120460368839153618.mp4', 8),
(4, 'video5498167235023827803.mp4', 8),
(4, 'video8338973163725498723.mp4', 8),
(4, 'video7279177722643913037.mp4', 8);*/

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
