UPDATE drivers SET TeamID = 1 WHERE DriverID = 1;
UPDATE drivers SET TeamID = 1 WHERE DriverID = 2;
UPDATE drivers SET TeamID = 2 WHERE DriverID = 5;
UPDATE drivers SET TeamID = 2 WHERE DriverID = 9;
UPDATE drivers SET TeamID = 3 WHERE DriverID = 3;
UPDATE drivers SET TeamID = 3 WHERE DriverID = 4;
UPDATE drivers SET TeamID = 3 WHERE DriverID = 21;
UPDATE drivers SET TeamID = 4 WHERE DriverID = 8;
UPDATE drivers SET TeamID = 4 WHERE DriverID = 11;
UPDATE drivers SET TeamID = 5 WHERE DriverID = 20;
UPDATE drivers SET TeamID = 5 WHERE DriverID = 13;
UPDATE drivers SET TeamID = 6 WHERE DriverID = 11;
UPDATE drivers SET TeamID = 6 WHERE DriverID = 10;
UPDATE drivers SET TeamID = 7 WHERE DriverID = 7;
UPDATE drivers SET TeamID = 7 WHERE DriverID = 14;
UPDATE drivers SET TeamID = 7 WHERE DriverID = 859;
UPDATE drivers SET TeamID = 8 WHERE DriverID = 6;
UPDATE drivers SET TeamID = 8 WHERE DriverID = 17;
UPDATE drivers SET TeamID = 9 WHERE DriverID = 19;
UPDATE drivers SET TeamID = 9 WHERE DriverID = 15;
UPDATE drivers SET TeamID = 9 WHERE DriverID = 21;
UPDATE drivers SET TeamID = 10 WHERE DriverID = 18;
UPDATE drivers SET TeamID = 10 WHERE DriverID = 16;
UPDATE drivers SET TeamID = 10 WHERE DriverID = 860;

SELECT 
    d.DriverID,
    d.firstName,
    d.lastName,
    d.dateOfBirth,
    d.born,
    d.number,
    c.teamName
FROM drivers d
INNER JOIN constructors c ON d.TeamID = c.TeamID
ORDER BY c.teamName;

SELECT * FROM drivers;
SELECT * FROM tracks; 
SELECT * FROM races;