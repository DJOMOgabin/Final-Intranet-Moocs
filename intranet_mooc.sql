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


-- --------------------------------------------------------

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
(1, 'djobiii', '2078', 'admin', 'djobiii', 'M', 'Djobiii', 'iii', 'djobiii2079@gmail.com');
-- --------------------------------------------------------

--
-- Structure de la table `etd_cours`
--

CREATE TABLE IF NOT EXISTS `etd_cours` (
  `idcours` int(11) DEFAULT NULL,
  `idetudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `prof_cours`
--

CREATE TABLE IF NOT EXISTS `prof_cours` (
  `idpro` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `quiz_prof`
--

CREATE TABLE IF NOT EXISTS `quiz_prof` (
  `idquiz` int(11) NOT NULL,
  `idprof` int(11) NOT NULL,
  PRIMARY KEY (`idquiz`,`idprof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
