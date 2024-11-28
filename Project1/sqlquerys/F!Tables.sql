USE Formula1;

/* Formula 1 Tables */

USE formula1_database;

PRINT '-- Users Table --';
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    UserID INT PRIMARY KEY, -- Unique identifier for each user
    StatusID INT,
    firstName VARCHAR(50) NOT NULL, -- First name of the user
    lastName VARCHAR(50) NOT NULL, -- Last name of the user
    userName VARCHAR(50) NOT NULL UNIQUE, -- Username chosen by the user
    password VARCHAR(255) NOT NULL, -- Password chosen by the user
    email VARCHAR(255) NOT NULL, -- Email address of the user
    phoneNumber VARCHAR(20) NOT NULL, -- Phone number of the user
    subscriptionStatus VARCHAR(20) NOT NULL, -- Subscription status of the user
    dateOfBirth DATE NOT NULL, -- Date of birth of the user
    country CHAR(3) NOT NULL, -- Country of the user
    favouriteDriver VARCHAR(100) NOT NULL,
    favouriteConstructor VARCHAR(100) NOT NULL,
    CONSTRAINT FK_SubscriptionStatus FOREIGN KEY (StatusID) REFERENCES subscriptions(StatusID)
);

PRINT '-- Subscriptions Table --';
DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions (
    StatusID INT PRIMARY KEY, -- Unique identifier for each status
    statusName VARCHAR(50) NOT NULL UNIQUE -- Name of the subscription status
);

PRINT '-- Drivers Table --';
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
    DriverID INT PRIMARY KEY,
    TeamID INT, -- Unique identifier for each driver
    firstName VARCHAR(50) NOT NULL, -- First name of the driver
    lastName VARCHAR(50) NOT NULL, -- Last name of the driver
    nationality VARCHAR(30) NOT NULL, -- Nationality of the driver
    dateOfBirth DATE NOT NULL, -- Date of birth
    born VARCHAR(100) NOT NULL, -- Where the driver was born
    helmutColour VARCHAR(10) NOT NULL, -- Helmet color
    number INT NOT NULL, -- Number of the driver
    CONSTRAINT CHK_Number_Range CHECK (number >= 1 AND number <= 99) -- Ensure drivers number is between 1-99
);

PRINT '-- Constructors Table --';
DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
    TeamID INT PRIMARY KEY, -- Unique identifier
    teamName VARCHAR(100) NOT NULL, -- Team name
    headquarters VARCHAR(100) NOT NULL, -- Headquarters location
    principal VARCHAR(50) NOT NULL, -- Principal of the team
    engineSupplier VARCHAR(50) NOT NULL, -- Engine supplier of the team
    startYear DATE NOT NULL, -- Year they started in F1
    constructorTitles INT NOT NULL, -- Number of constructor titles won
    wins INT NULL, -- Number of wins
    poles INT NULL, -- Number of pole positions
    fastestLaps INT NULL -- Number of fastest laps
);

PRINT '-- Seasons With Constructor Table --';
DROP TABLE IF EXISTS seasonsWithConstructors;
CREATE TABLE seasonsWithConstructors (
    DriverID INT, -- Driver's unique ID
    TeamID INT, -- Constructor's unique ID
    entryYear INT NOT NULL, -- Year driver joined the team
    exitYear INT, -- Year driver left the team (can be NULL if still active)
    PRIMARY KEY (DriverID, TeamID, EntryYear), -- Composite primary key
    FOREIGN KEY (DriverID) REFERENCES drivers(DriverID),
    FOREIGN KEY (TeamID) REFERENCES constructors(TeamID),
    CONSTRAINT CHK_endYear_After_entryYear CHECK (exitYear >= entryYear)
);

PRINT '-- Races Table --';
DROP TABLE IF EXISTS races;
CREATE TABLE races (
    RaceID INT PRIMARY KEY,
    TrackID INT NOT NULL, -- Foreign Key to Tracks
    raceName VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL, -- Start of the race weekend
    endDate DATE NOT NULL, -- End of the race weekend
    weatherConditions VARCHAR(30) NULL,
    CONSTRAINT CHK_EndDate_After_StartDate CHECK (endDate >= startDate), -- Ensures end date is not before the start date
    CONSTRAINT FK_Race_Track FOREIGN KEY (TrackID) REFERENCES tracks(TrackID) -- Establishes relationship with Tracks table
);

PRINT '-- Race Stats Table --';
DROP TABLE IF EXISTS raceStats;
CREATE TABLE raceStats (
    RaceStatsID INT PRIMARY KEY,
    RaceID INT NOT NULL,
    TrackID INT NOT NULL, -- Foreign Key to Tracks
    sprintRaceRecord TIME NULL,
    singleLapRecord TIME NULL,
    topSpeedRecord DECIMAL(8, 3) NULL,
    prevDriverWin INT,
    prevConstructorWin INT,
    CONSTRAINT FK_Race_Stats FOREIGN KEY (RaceID) REFERENCES races(RaceID), -- Establishes relationship with Races table
    CONSTRAINT FK_RaceStats_Track FOREIGN KEY (TrackID) REFERENCES tracks(TrackID), -- Establishes relationship with Tracks table 
    CONSTRAINT fk_prevDriverWin FOREIGN KEY (prevDriverWin) REFERENCES drivers(DriverID),
    CONSTRAINT fk_prevConstructorWin FOREIGN KEY (prevConstructorWin) REFERENCES constructors(TeamID)
);

PRINT '-- Tracks Table --';
DROP TABLE IF EXISTS tracks;
CREATE TABLE tracks (
    TrackID INT PRIMARY KEY, 
    trackName VARCHAR(100) NOT NULL, 
    CountryID INT, 
    city VARCHAR(50) NOT NULL,  
    numTurns INT NOT NULL,
    laps INT NOT NULL,
    fullRaceLength DECIMAL(8, 3) NOT NULL,
    lapLength DECIMAL(8, 3) NOT NULL,
    surfaceType VARCHAR(50) NOT NULL,
    tireBrand VARCHAR(20) NOT NULL,
    tireCompound VARCHAR(50) NOT NULL,
    CONSTRAINT fk_country FOREIGN KEY (CountryID) REFERENCES countries(CountryID)
);

PRINT '-- Articles Table --';
DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
    ArticleID INT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    content TEXT NOT NULL, 
    author VARCHAR(100) NOT NULL, 
    publishedDate DATE NOT NULL, 
    category VARCHAR(50) NOT NULL, 
    tags VARCHAR(255) 
);

PRINT '-- Countries Table --';
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
    CountryID   INT PRIMARY KEY,      -- Unique identifier for each country
    CountryName VARCHAR(100) NOT NULL UNIQUE  -- Name of the country
);

/* Tire */
PRINT '-- Tires Table --';
DROP TABLE IF EXISTS tires;
CREATE TABLE Tires (
	TireID				INT				PRIMARY KEY AUTO_INCREMENT, -- Unique identifier
	tireType			VARCHAR(20)		NULL -- Name of the tire
);

/* Compounds */
PRINT '-- Compounds Table --';
DROP TABLE IF EXISTS compounds;
CREATE TABLE compounds (
	CompoundID			INT				PRIMARY KEY, -- Compound unique identifier
	TireID				INT,
	compoundType		VARCHAR(20)		NOT NULL, -- C1, C2, C3, C4, C5
	CONSTRAINT FK_TireID FOREIGN KEY (TireID) REFERENCES TireType(TireID)
);