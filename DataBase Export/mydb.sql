-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2021 at 12:54 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `directori`
--

CREATE TABLE `directori` (
  `idDirectori` int(11) NOT NULL,
  `Nume` varchar(45) NOT NULL,
  `Despre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `directori`
--

INSERT INTO `directori` (`idDirectori`, `Nume`, `Despre`) VALUES
(1, 'Francis Ford Coppola', 'Baiat bun. Bine crescut'),
(2, 'Al Pacino', 'Si asta e baiat bine crescut!'),
(3, 'sylvester stallone', 'Asta e baiat rau.Bate pe toti!'),
(10, 'Christopher Nolan', 'Sincer imi place mult despre el'),
(11, 'James Cameron', 'E smecher ce sa zic'),
(12, 'Ridley Scott', 'E super tipul face filme bune'),
(13, 'Baz Luhrmann', 'Nu stiu nimic');

-- --------------------------------------------------------

--
-- Table structure for table `filme`
--

CREATE TABLE `filme` (
  `idFilme` int(11) NOT NULL,
  `Titlu` varchar(45) NOT NULL,
  `An` int(11) DEFAULT NULL,
  `Descriere` varchar(500) DEFAULT NULL,
  `url` text NOT NULL,
  `Tara_idTara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filme`
--

INSERT INTO `filme` (`idFilme`, `Titlu`, `An`, `Descriere`, `url`, `Tara_idTara`) VALUES
(2, 'Nasul', 1972, 'The aging patriarch of an organized crime dyn', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY268_CR3,0,182,268_AL_.jpg', 1),
(3, 'Rocky', 1976, 'Merge filmul. e bun', 'https://m.media-amazon.com/images/M/MV5BMTY5MDMzODUyOF5BMl5BanBnXkFtZTcwMTQ3NTMyNA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 1),
(5, 'Rambo ', 2008, 'Rambo este un film de acțiune american din an', 'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 1),
(6, 'Creed II', 2018, 'Under the tutelage of Rocky Balboa,', 'https://m.media-amazon.com/images/M/MV5BYmEyNWZhM2YtZDAyNi00ZjYzLWI2ZWMtOWM4ZmI1MDE0OWNmXkEyXkFqcGdeQXVyMjMwNDgzNjc@._V1_UX182_CR0,0,182,268_AL_.jpg', 3),
(14, 'Tenet', 2020, 'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time. ', 'https://m.media-amazon.com/images/M/MV5BYzg0NGM2NjAtNmIxOC00MDJmLTg5ZmYtYzM0MTE4NWE2NzlhXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_UX182_CR0,0,182,268_AL_.jpg', 1),
(16, 'Titanic', 1997, 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic. ', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UX182_CR0,0,182,268_AL_.jpg', 1),
(17, 'The Martian', 2015, 'An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive. ', 'https://m.media-amazon.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@._V1_UX182_CR0,0,182,268_AL_.jpg', 4),
(18, 'Romeo + Juliet', 1998, 'Shakespeare famous play is updated to the hip modern suburb of Verona still retaining its original dialogue. ', 'https://m.media-amazon.com/images/M/MV5BMGU4YmI1ZGQtZjExYi00M2E0LTgyYTAtNzQ5ZmVlMTk4NzUzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `filme_directori`
--

CREATE TABLE `filme_directori` (
  `Filme_idFilme` int(11) NOT NULL,
  `Directori_idDirectori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filme_directori`
--

INSERT INTO `filme_directori` (`Filme_idFilme`, `Directori_idDirectori`) VALUES
(2, 1),
(3, 3),
(5, 2),
(5, 3),
(14, 10),
(16, 11),
(17, 12),
(18, 13);

-- --------------------------------------------------------

--
-- Table structure for table `filme_genuri`
--

CREATE TABLE `filme_genuri` (
  `Filme_idFilme` int(11) NOT NULL,
  `Genuri_idGenuri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filme_genuri`
--

INSERT INTO `filme_genuri` (`Filme_idFilme`, `Genuri_idGenuri`) VALUES
(2, 1),
(2, 3),
(3, 1),
(5, 1),
(5, 2),
(5, 3),
(14, 1),
(16, 2),
(17, 2),
(18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filme_stele`
--

CREATE TABLE `filme_stele` (
  `Filme_idFilme` int(11) NOT NULL,
  `Stele_idStele` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filme_stele`
--

INSERT INTO `filme_stele` (`Filme_idFilme`, `Stele_idStele`) VALUES
(2, 4),
(3, 1),
(3, 3),
(5, 1),
(5, 2),
(5, 3),
(5, 7),
(5, 8),
(6, 6),
(14, 18),
(16, 18),
(17, 18),
(17, 19),
(18, 18),
(18, 20);

-- --------------------------------------------------------

--
-- Table structure for table `genuri`
--

CREATE TABLE `genuri` (
  `idGenuri` int(11) NOT NULL,
  `nume` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genuri`
--

INSERT INTO `genuri` (`idGenuri`, `nume`) VALUES
(1, 'Actiune'),
(2, 'Drama'),
(3, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `Code` text NOT NULL,
  `Speakers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stele`
--

CREATE TABLE `stele` (
  `idStele` int(11) NOT NULL,
  `Nume` varchar(45) NOT NULL,
  `Despre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stele`
--

INSERT INTO `stele` (`idStele`, `Nume`, `Despre`) VALUES
(1, '5', 'Mi-a placut foarte mult!'),
(2, '4', 'A fost bun dar se putea si mai bine'),
(3, '2', 'A fost plictisitor!'),
(4, '3', 'Nu ma mai uit nicioadata!'),
(6, '10', 'Mai bine invatam SQL decat sa pierdem timpu.'),
(7, '10', 'incercare conectare la db'),
(8, '9', 'A doua incercare de conectarea la db'),
(18, '2', NULL),
(19, '10', 'Cred ca este un film bun chiar daca e sci-fi'),
(20, '1', 'Nu imi place romeo si julieta');

-- --------------------------------------------------------

--
-- Table structure for table `tara`
--

CREATE TABLE `tara` (
  `idTara` int(11) NOT NULL,
  `nume` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tara`
--

INSERT INTO `tara` (`idTara`, `nume`) VALUES
(6, 'France'),
(3, 'Israel'),
(4, 'Marte'),
(1, 'US');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directori`
--
ALTER TABLE `directori`
  ADD PRIMARY KEY (`idDirectori`),
  ADD UNIQUE KEY `Nume_UNIQUE` (`Nume`);

--
-- Indexes for table `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`idFilme`) USING BTREE,
  ADD UNIQUE KEY `Titlu_UNIQUE` (`Titlu`),
  ADD KEY `fk_Filme_Tara1_idx` (`Tara_idTara`);

--
-- Indexes for table `filme_directori`
--
ALTER TABLE `filme_directori`
  ADD PRIMARY KEY (`Filme_idFilme`,`Directori_idDirectori`),
  ADD KEY `fk_Filme_has_Directori_Directori1_idx` (`Directori_idDirectori`),
  ADD KEY `fk_Filme_has_Directori_Filme_idx` (`Filme_idFilme`);

--
-- Indexes for table `filme_genuri`
--
ALTER TABLE `filme_genuri`
  ADD PRIMARY KEY (`Filme_idFilme`,`Genuri_idGenuri`),
  ADD KEY `fk_Filme_has_Genuri_Genuri1_idx` (`Genuri_idGenuri`),
  ADD KEY `fk_Filme_has_Genuri_Filme1_idx` (`Filme_idFilme`);

--
-- Indexes for table `filme_stele`
--
ALTER TABLE `filme_stele`
  ADD PRIMARY KEY (`Filme_idFilme`,`Stele_idStele`),
  ADD KEY `fk_Filme_has_Stele_Stele1_idx` (`Stele_idStele`),
  ADD KEY `fk_Filme_has_Stele_Filme1_idx` (`Filme_idFilme`);

--
-- Indexes for table `genuri`
--
ALTER TABLE `genuri`
  ADD PRIMARY KEY (`idGenuri`),
  ADD UNIQUE KEY `nume_UNIQUE` (`nume`);

--
-- Indexes for table `stele`
--
ALTER TABLE `stele`
  ADD PRIMARY KEY (`idStele`);

--
-- Indexes for table `tara`
--
ALTER TABLE `tara`
  ADD PRIMARY KEY (`idTara`),
  ADD UNIQUE KEY `nume_UNIQUE` (`nume`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directori`
--
ALTER TABLE `directori`
  MODIFY `idDirectori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `filme`
--
ALTER TABLE `filme`
  MODIFY `idFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `genuri`
--
ALTER TABLE `genuri`
  MODIFY `idGenuri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stele`
--
ALTER TABLE `stele`
  MODIFY `idStele` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tara`
--
ALTER TABLE `tara`
  MODIFY `idTara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `fk_Filme_Tara1` FOREIGN KEY (`Tara_idTara`) REFERENCES `tara` (`idTara`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `filme_directori`
--
ALTER TABLE `filme_directori`
  ADD CONSTRAINT `fk_Filme_has_Directori_Directori1` FOREIGN KEY (`Directori_idDirectori`) REFERENCES `directori` (`idDirectori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filme_has_Directori_Filme` FOREIGN KEY (`Filme_idFilme`) REFERENCES `filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `filme_genuri`
--
ALTER TABLE `filme_genuri`
  ADD CONSTRAINT `fk_Filme_has_Genuri_Filme1` FOREIGN KEY (`Filme_idFilme`) REFERENCES `filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filme_has_Genuri_Genuri1` FOREIGN KEY (`Genuri_idGenuri`) REFERENCES `genuri` (`idGenuri`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `filme_stele`
--
ALTER TABLE `filme_stele`
  ADD CONSTRAINT `fk_Filme_has_Stele_Filme1` FOREIGN KEY (`Filme_idFilme`) REFERENCES `filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filme_has_Stele_Stele1` FOREIGN KEY (`Stele_idStele`) REFERENCES `stele` (`idStele`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
