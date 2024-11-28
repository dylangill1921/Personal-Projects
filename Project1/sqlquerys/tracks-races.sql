/* formula 1 tables */
USE Formula1;

/* tracks table */
SELECT * FROM tracks;

INSERT INTO tracks (TrackID, trackName, city, numTurns, laps, fullRaceLength, lapLength, surfaceType, CountryID)
VALUES 
	(1, 'Bahrain International Circuit', 'Sakhir', 15, 57, 308.238, 5.412, 'Asphalt Quality Rating: 5/5 - High-Grip Desert Circuit Surface', 13),
	(2, 'Jeddah Corniche Circuit', 'Jeddah', 27, 50, 308.450, 6.174, 'Asphalt Quality Rating: 4/5 - High-Speed Street Circuit Surface', 151),
	(3, 'Melbourne Circuit', 'Melbourne', 14, 58, 306.124, 5.278, 'Asphalt Quality Rating: 5/5 - High-Grip Street Circuit with Freshly Resurfaced Track', 9),
	(4, 'Suzuka Circuit', 'Suzuka', 18, 53, 307.471, 5.807, 'Asphalt Quality Rating: 5/5 - High-Grip Dedicated Racing Circuit Surface', 84),
	(5, 'Shanghai International Circuit', 'Shanghai', 16, 56, 305.066, 5.451, 'Asphalt Quality Rating: 4/5 - Smooth High-Grip Circuit with Occasional Wear in Heavy Braking Zones', 36), 
	(6, 'Miami International Autodrome', 'Miami', 19, 57, 308.33, 5.41, 'Asphalt Quality Rating: 3/5 - New Street Circuit Surface with Variable Grip and Limited Rubbering', 185), 
	(7,	'Autodromo Enzo e Dino Ferrari', 'Imola', 19, 63, 309.049, 4.909, 'Asphalt Quality Rating: 4/5 - Well-Maintained Racing Circuit with High Grip and Mild Wear in Key Corners', 82),
	(8, 'Circuit de Monaco', 'Monte Carlo', 18, 78, 260.286, 3.337, 'Asphalt Quality Rating: 4/5 - Well-Maintained Racing Circuit with High Grip and Mild Wear in Key Corners', 32),
	(9, 'Circuit Gilles Villeneuve', 'Montreal', 14, 70, 305.270, 4.361, 'Asphalt Quality Rating: 4/5 - Smooth Street Circuit with Moderate Grip and Occasional Bumps', 114),
	(10, 'Circuit de Barcelona-Catalunya', 'Barcelona', 16, 66, 307.362, 4.657, 'Asphalt Quality Rating: 4/5 - High-Grip Circuit with Mild Surface Wear in Key Corners', 163),
	(11, 'Red Bull Ring', 'Spielberg', 10, 71, 306.452, 4.318, 'Asphalt Quality Rating: 5/5 - High-Grip Racing Circuit with Smooth and Consistent Surface', 10),
	(12, 'Silverstone Circuit', 'Silverstone', 18, 52, 306.198, 5.891, 'Asphalt Quality Rating: 4/5 - High-Grip Circuit with Some Wear in High-Stress Corners', 185),
	(13, 'Hungaroring', 'Budapest', 16, 70, 306.630, 4.014, 'Asphalt Quality Rating: 4/5 - High-Grip Circuit with Mild Wear in Tight Corners', 74),
	(14, 'Spa-Francorchamps', 'Spa-Francorchamps', 20, 44, 308.052, 7.004, 'Asphalt Quality Rating: 4/5 - Smooth High-Grip Circuit with Mild Wear in Long Corners', 17),
	(15, 'Circuit Zandovoort', 'Zandvoort', 14, 72, 306.648, 4.259, 'Asphalt Quality Rating: 4/5 - High-Grip Circuit with Smooth Surface and Some Degradation in High-Load Zones', 123),
	(16, 'Autodromo Nazionale Monza', 'Monza', 11, 53, 306.72, 5.793, 'Asphalt Quality Rating: 4/5 - Smooth High-Speed Circuit with Mild Wear in Braking Zones', 82),
	(17, 'Baku City Circuit', 'Baku', 20, 51, 306.049, 6.003, 'Asphalt Quality Rating: 3/5 - Street Circuit with Variable Grip and Frequent Surface Degradation', 11),
	(18, 'Marina Bay Street Circuit', 'Marina Bay', 19, 61, 308.706, 5.063, 'Asphalt Quality Rating: 3/5 - Street Circuit with Variable Grip and Frequent Surface Degradation', 156),
	(19, 'Circuit of the Americas', 'Austin', 20, 56, 308.405, 5.513, 'Asphalt Quality Rating: 4/5 - High-Grip Circuit with Some Wear in Heavy Braking Zones', 186),
	(20, 'Autódromo Hermanos Rodríguez', 'Mexico City', 17, 71, 305.354, 4.304, 'Asphalt Quality Rating: 4/5 - Smooth Circuit with High Grip and Mild Wear in Key Corners', 111), 
	(21, 'Autódromo José Carlos Pace',  'São Paulo', 15, 71, 305.879, 4.309, 'Asphalt Quality Rating: 4/5 - Well-Maintained Circuit with High Grip and Mild Wear in Heavy Braking Zones', 24), 
	(22, 'Las Vegas Street Circuit', 'Paradise', 17, 50, 309.958, 6.201, 'Asphalt Quality Rating: 3/5 - New Street Circuit with Variable Grip and Early Surface Degradation', 186),
	(23, 'Losail Circuit', 'Doha', 16, 57, 308.611, 5.419, 'Asphalt Quality Rating: 4/5 - Smooth, High-Grip Circuit with Mild Wear in High-Speed Sections', 141),
	(24, 'Yas Marina Circuit', 'Abu Dhabi', 21, 58, 306.183, 5.554, 'Asphalt Quality Rating: 4/5 - Smooth, High-Grip Circuit with Mild Wear in Key Braking Zones', 184);

SELECT * FROM tracks;
ALTER TABLE tracks
ALTER COLUMN surfaceType VARCHAR(150);

/* races table */
SELECT * FROM races;

INSERT INTO races (RaceID, raceName, startDateTime, endDateTime, weatherConditions, surfaceType, tireBrand, tireCompound, sprintRaceRecord, singleLapRecord, topSpeedRecord, prevDriverWin, prevConstructorWin, DriverID, TeamID, TrackID)
VALUES
	(1, 'BAHRAIN GRAND PRIX', '2024-03-02 10:00:00', '2024-03-02 1:00:00', 'Hot Sunny Day!', 'Graywacke Aggregate', 'Pirelli', 'C1(hard), C2(medium), C3(soft)',  NULL, '00:01:27.260', 329.3, NULL, NULL, NULL, NULL, 1),
	(2, 'SAUDI ARABIAN GRAND PRIX', '2024-03-09 12:00:00', '2024-03-09 15:00:00', 'Sunny and dry all day.', 'Ashphalt', 'Pirelli', 'C1(hard), C2(medium), C3(soft)', NULL, '00:01:27.472', 342.7, NULL, NULL, NULL, NULL, 2),
	(3, 'AUSTRALIAN GRAND PRIX', '2024-03-24 00:00:00', '2024-03-24 03:00:00', 'Slightly cloudy...', 'Asphalt', 'Pirelli', 'C1(hard), C2(medium), C3(soft)', NULL, '00:01:15.915', 372.5, NULL, NULL, NULL, NULL, 3),
	(4, 'JAPANESE GRAND PRIX', '2024-04-07 01:00:00', '2024-04-07 04:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:26.06', 315.0, NULL, NULL, NULL, NULL, 4),
	(5, 'CHINESE GRAND PRIX', '2024-04-21 03:00:00', '2024-04-21 06:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:31.095', 340.0, NULL, NULL, NULL, NULL, 5),
	(6, 'MIAMI GRAND PRIX', '2024-05-05 16:00:00', '2024-05-05 19:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:26.841', 348.0, NULL, NULL, NULL, NULL, 6),
	(7, 'EMILIA ROMAGNA GRAND PRIX', '2024-05-19 09:00:00', '2024-05-19 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:13.609', 297.9, NULL, NULL, NULL, NULL, 7),
	(8, 'MONACO GRAND PRIX', '2024-05-26 09:00:00', '2024-05-26 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:10.166', 290.0, NULL, NULL, NULL, NULL, 8),
	(9, 'CANADIAN GRAND PRIX', '2024-06-09 14:00:00', '2024-06-09 17:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:1:10.078', 343.0, NULL, NULL, NULL, NULL, 9),
	(10, 'SPANISH GRAND PRIX', '2024-06-23 09:00:00', '2024-06-23 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:15.406', 337.3, NULL, NULL, NULL, NULL, 10),
	(11, 'AUSTRIAN GRAND PRIX', '2024-06-30 09:00:00', '2024-06-30 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:02.939', 320.4, NULL, NULL, NULL, NULL, 11),
	(12, 'BRITISH GRAND PRIX', '2024-07-07 10:00:00', '2024-07-07 13:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:27.097', 327.2, NULL, NULL, NULL, NULL, 12),
	(13, 'HUNGARIAN GRAND PRIX', '2024-07-21 09:00:00', '2024-07-21 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:13.45', 308.7, NULL, NULL, NULL, NULL, 13),
	(14, 'BELGIAN GRAND PRIX', '2024-07-28 09:00:00', '2024-07-28 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:41:252', 313.4, NULL, NULL, NULL, NULL, 14),
	(15, 'DUTCH GRAND PRIX', '2024-08-25 09:00:00', '2024-08-25 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:10.567', 328.6, NULL, NULL, NULL, NULL, 15),
	(16, 'ITALIAN GRAND PRIX', '2024-09-01 09:00:00', '2024-09-01 12:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:18.887', 359.0, NULL, NULL, NULL, NULL, 16),
	(17, 'AZERBAIJAN GRAND PRIX', '2024-09-15 07:00:00', '2024-09-15 10:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:40.203', 335.0, NULL, NULL, NULL, NULL, 17),
	(18, 'SINGAPORE GRAND PRIX', '2024-09-22 08:00:00', '2024-09-22 11:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:30.984', 303.8, NULL, NULL, NULL, NULL, 18),
	(19, 'UNITED STATES GRAND PRIX', '2024-10-20 15:00:00', '2024-10-20 18:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:32.03', 330.3, NULL, NULL, NULL, NULL, 19),
	(20, 'MEXICAN GRAND PRIX', '2024-10-27 16:00:00', '2024-10-27 19:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:14.76', 372.5, NULL, NULL, NULL, NULL, 20),
	(21, 'BRAZILIAN GRAND PRIX', '2024-11-03 12:00:00', '2024-11-03 15:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:07.28', 339.0, NULL, NULL, NULL, NULL, 21),
	(22, 'LAS VEGAS GRAND PRIX', '2024-11-24 01:00:00', '2024-11-24 04:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:32.726', 366.0, NULL, NULL, NULL, NULL, 22),
	(23, 'QATAR GRAND PRIX', '2024-12-01 12:00:00', '2024-12-01 15:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:23.319', 342.6, NULL, NULL, NULL, NULL, 23),
	(24, 'ABU DHABI GRAND PRIX', '2024-12-08 08:00:00', '2024-12-08 11:00:00', NULL, 'Asphalt', 'Pirelli', NULL, NULL, '00:01:26.103', 330, NULL, NULL, NULL, NULL, 24);