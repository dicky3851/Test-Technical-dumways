SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `query4A1` ()  BEGIN 
	SELECT v.*, c.* FROM video_tb AS v
    INNER JOIN category_tb AS c ON c.id = v.category_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `query4A2` ()  BEGIN 
SELECT * FROM video_tb as v
INNER JOIN category_tb as c ON v.category_id = c.id
ORDER BY c.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `query4A3` ()  NO SQL
BEGIN 
	SELECT v.*, c.* FROM video_tb AS v
    INNER JOIN category_tb AS c ON c.id = v.category_id;
END$$

DELIMITER ;



CREATE TABLE `category_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `category_tb` (`id`, `name`) VALUES
(1, 'Komedi'),
(2, 'Otomotif'),
(3, 'Nature'),
(4, 'Music'),
(5, 'Horor');



CREATE TABLE `video_tb` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `attache` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `video_tb` (`id`, `title`, `category_id`, `attache`, `thumbnail`) VALUES
(9, 'Indra Jegel Penasaran', 1, 'komedi1.mp4', 'komedi1.jpg'),
(10, 'Ini Bisnis Yang Bikin Crazy Rich', 1, 'komedi2.mp4', 'komedi2.jpg'),
(11, 'Pingin Siaran - Episode 13', 1, 'komedi3.mp4', 'komedi3.jpg'),
(12, 'Seri Baru Ferari', 2, 'otomotif1.mp4', 'otomotif1.jpg'),
(13, 'Lathi - Weird Genius', 4, 'musik1.mp4', 'musik1.jpg'),
(14, 'Wild Amazon Documenter', 3, 'nature1.mp4', 'nature1.jpg'),
(15, 'DPS - Weird Genius', 4, 'musik2.mp4', 'musik2.jpg'),
(16, 'Roasting Katana Bavecabita', 2, 'otomotif2.mp4', 'otomotif2.jpg'),
(17, 'KKN Desa Penari', 5, 'horor1.mp4', 'horor1.jpg');


ALTER TABLE `category_tb`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `video_tb`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `category_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `video_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `video_tb`
  ADD CONSTRAINT `video_tb_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_tb` (`id`);
COMMIT;