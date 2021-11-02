-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: mysql5
-- Generation Time: Mar 16, 2020 at 03:20 PM
-- Server version: 10.1.44-MariaDB-0+deb9u1
-- PHP Version: 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fet16018686`
--

-- --------------------------------------------------------

--
-- Table structure for table `City`
--

CREATE TABLE `City` (
  `city_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `website` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `City`
--

INSERT INTO `City` (`city_id`, `name`, `country`, `population`, `latitude`, `longitude`, `description`, `currency`, `website`) VALUES
(1, 'Manchester', 'England', 547627, 53.484, -2.24464, 'Manchester is a major city in the northwest of England with a rich industrial heritage. The Castlefield conservation area 18th-century canal system recalls the citys days as a textile powerhouse, and visitors can trace this history at the interactive Museum of Science and Industry. The revitalised Salford Quays dockyards now house the Daniel Libeskind-designed Imperial War Museum North and the Lowry cultural centre.', 'Pound Sterling', 'https://www.visitmanchester.com/'),
(2, 'Saint Petersburg', 'Russia', 5427000, 59.9375, 30.3086, 'St. Petersburg is a Russian port city on the Baltic Sea. It was the imperial capital for 2 centuries, having been founded in 1703 by Peter the Great, subject of the city iconic Bronze Horseman statue. It remains Russia cultural center, with venues such as the Mariinsky Theatre hosting opera and ballet, and the State Russian Museum showcasing Russian art, from Orthodox icon paintings to Kandinsky works.', 'Russian Rouble', 'http://www.visit-petersburg.ru/en_saintpetersburg/');

-- --------------------------------------------------------

--
-- Table structure for table `Flicker`
--

CREATE TABLE `Flicker` (
  `url` varchar(300) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Photos`
--

CREATE TABLE `Photos` (
  `photo_id` int(11) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `poi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Photos`
--

INSERT INTO `Photos` (`photo_id`, `url`, `poi_id`) VALUES
(1, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Old%20trafford/oldtrafford1.jpg', 1),
(2, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Old%20trafford/oldtrafford2.jpg', 1),
(3, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Old%20trafford/oldtrafford3.jpg', 1),
(4, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Etihad/etihad1.jpg', 2),
(5, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Etihad/etihad2.jpg', 2),
(6, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Etihad/etihad3.jpg', 2),
(7, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/HardRock/hardrock1.jpg', 3),
(8, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/HardRock/hardrock2.jpg', 3),
(9, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/HardRock/hardrock3.jpg', 3),
(10, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Warehouse%20project/WareHouse1.jpg', 4),
(11, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Warehouse%20project/WareHouse2.jpg', 4),
(12, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Warehouse%20project/WareHouse3.jpg', 4),
(13, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Science%20and%20Industry/Sand2.jpg', 5),
(14, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Science%20and%20Industry/SandI1.jpg', 5),
(15, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Science%20and%20Industry/SandI3.jpg', 5),
(16, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Albert%20Hall/AlbertHall1.jpg', 6),
(17, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Albert%20Hall/AlbertHall2.jpg', 6),
(18, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Albert%20Hall/AlbertHall3.jpg', 6),
(19, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Nevsky%20Prospekt/nevsky-prospect1.jpg', 7),
(20, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Nevsky%20Prospekt/nevsky-prospect2.jpg', 7),
(21, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Nevsky%20Prospekt/nevsky-prospect3.jpg', 7),
(22, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Grand%20Peterhof%20Palace/grand-peterhof-palace1.jpg', 8),
(23, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Grand%20Peterhof%20Palace/grand-peterhof-palace2.jpg', 8),
(24, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Grand%20Peterhof%20Palace/grand-peterhof-palace3.jpg', 8),
(25, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Great%20Mariinsky%20Theatre/MariinskyTheatre1.jpg', 9),
(26, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Great%20Mariinsky%20Theatre/MariinskyTheatre2.jpg', 9),
(27, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Great%20Mariinsky%20Theatre/MariinskyTheatre3.jpg', 9),
(28, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Russian%20Railway%20Musuem/RRM1.jpg', 10),
(29, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Russian%20Railway%20Musuem/RRM2.jpg', 10),
(30, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Russian%20Railway%20Musuem/RRM3.jpg', 10),
(31, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/KrestovskyStadium/KrestovskyStadium1.jpg', 11),
(32, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/KrestovskyStadium/KrestovskyStadium2.jpg', 11),
(33, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/KrestovskyStadium/KrestovskyStadium3.jpg', 11),
(34, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Art-Caviar/art-caviar1.jpg', 12),
(35, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Art-Caviar/art-caviar2.jpg', 12),
(36, 'https://fetstudy.uwe.ac.uk/~ej2-grealish/dsa/assignment/images/Art-Caviar/art-caviar3.jpg', 12);

-- --------------------------------------------------------

--
-- Table structure for table `Poi`
--

CREATE TABLE `Poi` (
  `poi_id` int(11) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Link` varchar(300) DEFAULT NULL,
  `Rating` varchar(100) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Poi`
--

INSERT INTO `Poi` (`poi_id`, `Name`, `Latitude`, `Longitude`, `Description`, `Link`, `Rating`, `city_id`) VALUES
(1, 'Old Trafford', 53.4623, -2.2914, 'Old Trafford is a football stadium in Old Trafford, Greater Manchester, England, and the home of Manchester United. With a capacity of 74,879, it is the largest club football stadium (and second largest football stadium overall after Wembley Stadium) in the United Kingdom, and the eleventh-largest in Europe.      It is about 0.5 miles (800 m) from Old Trafford Cricket Ground and the adjacent tram stop.', 'https://www.oldtraffordtour.com/stadium-museum-tour', 'The TripAdvisor Rating for this place is 4.5', 1),
(2, 'Etihad', 53.4801, -2.2409, 'The City of Manchester Stadium in Manchester, England, currently known as the Etihad Stadium for sponsorship reasons, is the home of Manchester City and, with a domestic football capacity of 55,097, the sixth-largest in the Premier League and tenth-largest in the United Kingdom.', 'https://www.mancity.com/ticket-information/visiting-the-campus/visiting-the-etihad-stadium', ' The TripAdvisor Rating for this place is 4.5', 1),
(3, 'Hard Rock Cafe', 53.4795, -2.2451, 'Located in the centre of the city, the UKs second largest Hard Rock Cafe will rock your senses serving what can only be described as \"The Official Food of Rock\", generous drinks and an awe-inspiring collection of rock memorabilia. Priceless pieces from legends The Beatles, Red Hot Chilli Peppers, Oasis, and Elvis Presley grace the cafe walls along with more contemporary items including stage costumes worn by Natasha Bedingfield and the Arctic Monkeys.', 'https://www.hardrockcafe.com/location/manchester/', 'The TripAdvisor Rating for this place is 4', 1),
(4, 'Warehouse Project', 53.4795, -2.2451, 'The Warehouse Project is a series of club nights organised in Greater Manchester, England, since 2006. Unlike most other clubs, it has a limited seasonal approach rather than running all year. Each year season runs from September through to New Years Day, plus occasional one off dates such as Bank Holiday weekends. This period corresponds with the busiest time of the year and the student calendar.', 'https://www.thewarehouseproject.com/', 'The TripAdvisor Rating for this place is 4', 1),
(5, 'Science Museum', 53.4774, -2.255, 'The Science and Industry Museum (formerly known as the Museum of Science and Industry) in Manchester, England, is a large museum devoted to the development of science, technology and industry with emphasis on the citys achievements in these fields. The museum is part of the Science Museum Group, a non-departmental public body of the Department for Culture, Media and Sport, having merged with the National Science Museum in 2012.', 'https://www.scienceandindustrymuseum.org.uk/', 'The TripAdvisor Rating for this place is 4.5', 1),
(6, 'Albert Hall', 53.4782, -2.2478, 'The Albert Hall is a music venue in Manchester, England. Built as a Methodist central hall in 1908 by the architect William James Morley of Bradford and built by J. Gerrard and Sons Ltd of Swinton, it has been designated by English Heritage as a Grade II listed building.[3] The main floor was used as a nightclub from 1999 to 2011. The second floor, the Chapel Hall, unused since 1969, was renovated in 2012 to 2014 for music concerts.', 'https://www.alberthallmanchester.com/', 'The TripAdvisor Rating for this place is 4', 1),
(7, 'Nevesky Prospect', 59.9308, 30.3669, 'Nevsky Prospect is the main street in the city of St. Petersburg in Russia. It takes its name from the Alexander Nevsky Lavra, the monastery which stands at the eastern end of the street, and which in turn commemorates the Russian hero Prince Saint Alexander Nevsky (1221-1263). Following his founding of Saint Petersburg in 1703, Tsar Peter I planned the course of the street as the beginning of the road to Novgorod and Moscow.', 'http://www.saint-petersburg.com/virtual-tour/nevsky-prospect/', 'The TripAdvisor Rating for this place is 4.5', 2),
(8, 'Grand Peterhof Palace', 59.8863, 29.9086, 'The Peterhof Palace is a series of palaces and gardens located in Petergof, Saint Petersburg, Russia, commissioned by Peter the Great as a direct response to the Palace of Versailles by Louis XIV of France. Originally intending it in 1709 for country habitation, Peter the Great sought to expand the property as a result of his visit to the French royal court in 1717, inspiring the nickname used by tourists of \"The Russian Versailles\".', 'http://www.saint-petersburg.com/peterhof/', 'The TripAdvisor Rating for this place is 4.5', 2),
(9, 'Great Mariinsky Theatre', 59.9256, 30.296, 'The Mariinsky Theatre is a historic theatre of opera and ballet in Saint Petersburg, Russia. Opened in 1860, it became the preeminent music theatre of late 19th-century Russia, where many of the stage masterpieces of Tchaikovsky, Mussorgsky, and Rimsky-Korsakov received their premieres. Through most of the Soviet era, it was known as the Kirov Theatre. Today, the Mariinsky Theatre is home to the Mariinsky Ballet, Mariinsky Opera and Mariinsky Orchestra.', 'https://www.mariinsky-theatre.com/', 'The TripAdvisor Rating for this place is 4.5', 2),
(10, 'Russian Railway Museum', 59.9076, 30.2961, 'The Russian Railway Museum is situated next to Baltiysky railway station in Saint Petersburg.The museum was established in 1978, its current site and exhibition opened to public on November 1, 2017. The museum utilizes the nineteenth century locomotive shed of the Peterhof Railway built in 1857 to 1858, however a large second exhibition building and open exhibition areas have been added.', 'https://rzd-museum.ru/en', 'The TripAdvisor Rating for this place is 4.5', 2),
(11, 'Krestovsky Stadium', 59.9727, 30.2214, 'Krestovsky Stadium, known as Gazprom Arena for sponsorship reasons, is a retractable roof stadium with a retractable pitch in the western portion of Krestovsky Island in Saint Petersburg, Russia, which serves as home for FC Zenit Saint Petersburg. The stadium was opened in 2017 for the FIFA Confederations Cup. It was called Saint Petersburg Stadium during the 2017 FIFA Confederations Cup and 2018 FIFA World Cup.', 'https://gazprom-arena.com/', 'The Google Review Rating for this place is 4.6', 2),
(12, 'Art-Caviar', 59.9377, 30.3235, 'In the boutique you can not only buy delicacies for every taste, but also learn interesting facts about the history of caviar in Russia, about the features of each variety of caviar, its specifics, the rules of compatibility. Exhibits for the collection of the Art-Caviar boutique are selected with special attention. Among other things, the Boutique presents antique items and modern accessories, which can be called a work of art.', 'https://en.artcaviar.ru/', ' The TripAdvisor Rating for this place is 5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Tweets`
--

CREATE TABLE `Tweets` (
  `tweet_id` int(11) NOT NULL,
  `tweet` varchar(280) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `screen_name` varchar(60) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `Flicker`
--
ALTER TABLE `Flicker`
  ADD PRIMARY KEY (`url`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `Photos`
--
ALTER TABLE `Photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `poi_id` (`poi_id`);

--
-- Indexes for table `Poi`
--
ALTER TABLE `Poi`
  ADD PRIMARY KEY (`poi_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `Tweets`
--
ALTER TABLE `Tweets`
  ADD PRIMARY KEY (`tweet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `City`
--
ALTER TABLE `City`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Photos`
--
ALTER TABLE `Photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `Poi`
--
ALTER TABLE `Poi`
  MODIFY `poi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Flicker`
--
ALTER TABLE `Flicker`
  ADD CONSTRAINT `Flicker_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`);

--
-- Constraints for table `Photos`
--
ALTER TABLE `Photos`
  ADD CONSTRAINT `Photos_ibfk_1` FOREIGN KEY (`poi_id`) REFERENCES `Poi` (`poi_id`);

--
-- Constraints for table `Poi`
--
ALTER TABLE `Poi`
  ADD CONSTRAINT `Poi_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
