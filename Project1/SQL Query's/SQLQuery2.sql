/* formula 1 tables */

USE formula1_database;

PRINT '-- Users Table --';
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	UserID				INT				PRIMARY KEY, -- Unique identifier for each user
	firstName			VARCHAR(50)		NOT NULL, -- First name of the user
	lastName			VARCHAR(50)		NOT NULL, -- Last name of the user
	userName			VARCHAR(50)		NOT NULL UNIQUE, -- Username chosen by the user
	password			VARCHAR(255)	NOT NULL, -- Password chosen by the user
	email				VARCHAR(100)	NOT NULL, -- Email address of the user
	phoneNumber			VARCHAR(20)		NOT NULL, -- Phone number of the user
	subscriptionStatus	VARCHAR(20)		NOT NULL, -- Subscription status of the user
	dateOfBirth			DATE			NOT NULL, -- Date of birth of the user
	country				CHAR(3)			NOT NULL, -- Country of the user
);

PRINT '-- Drivers Table --';
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
	DriverID			INT				PRIMARY KEY, -- Unique identifier for each driver
	firstName			VARCHAR(50)		NOT NULL, -- First name of the driver
	lastName			VARCHAR(50)		NOT NULL,
	nationality			VARCHAR(30)		NOT NULL,
	dateOfBirth			DATE			NOT NULL,
	born				VARCHAR(100)	NOT NULL,
	helmutColour		VARCHAR(10)		NOT NULL,
	number				INT				NOT NULL,
	TeamID				INT,
	CONSTRAINT CHK_Number_Range CHECK (number >= 1 AND number <= 99),
);

PRINT '-- Constructors Table --';
DROP TABLE IF EXISTS constructors;
CREATE TABLE constructors (
	TeamID				INT				PRIMARY KEY,
	teamName			VARCHAR(100)	NOT NULL,
	headquarters		VARCHAR(100)	NOT NULL,
	principal			VARCHAR(50)		NOT NULL,
	engineSupplier		VARCHAR(50)		NOT NULL,
	CONSTRAINT CHK_Constructor_Seasons_Positive CHECK (seasonsInF1 >= 0)
);

CREATE TABLE seasonsWithConstructor (
    DriverID INT,
    TeamID INT,
    EntryYear INT,
    ExitYear INT,
    PRIMARY KEY (DriverID, TeamID, EntryYear),
    FOREIGN KEY (DriverID) REFERENCES drivers(DriverID),
    FOREIGN KEY (TeamID) REFERENCES constructors(TeamID)
);

PRINT '-- Race table --';
DROP TABLE IF EXISTS races;
CREATE TABLE races (
	RaceID				INT				PRIMARY KEY,
	raceName			VARCHAR(100)	NOT NULL,
	startDateTime		DATETIME		NOT NULL,
	endDateTime			DATETIME		NOT NULL,
	weatherConditions	VARCHAR(30)		NULL,
	surfaceType			VARCHAR(50)		NOT NULL,
	tireBrand			VARCHAR(20)		NOT NULL,
	tireCompound		VARCHAR(50)		NULL,
	sprintRaceRecord	TIME			NULL,
	singleLapRecord		TIME			NULL,
	topSpeedRecord		DECIMAL(8, 3)	NULL,
	prevDriverWin		VARCHAR(50)		NULL,
	prevConstructorWin	VARCHAR(100)	NULL,
	DriverID			INT,
	TeamID				INT,
	TrackID				INT,
	CONSTRAINT FK_Prev_Driver_Winner FOREIGN KEY (DriverID) REFERENCES drivers(DriverID),
	CONSTRAINT FK_Prev_Team_Winner FOREIGN KEY (TeamID) REFERENCES constructors(TeamID),
	CONSTRAINT FK_Info_On_Races	FOREIGN KEY (trackID)	REFERENCES tracks (TrackID),
	CONSTRAINT CHK_EndDateTime_GreaterThan_StartDateTime CHECK (endDateTime > startDateTime)
);

ALTER TABLE races
DROP COLUMN raceTimeRecord;

PRINT '-- Result Table --';
DROP TABLE IF EXISTS result;
CREATE TABLE result (
	ResultID			INT				PRIMARY KEY,
	seasonYear			INT				NOT NULL,
	position			INT				NOT NULL,
	points				INT				NOT NULL,
	raceTime			VARCHAR(50),
	qualTime			TIME,
	fp1Time				TIME,
	fp2Time				TIME,
	fp3Time				TIME,
	sprintTime			TIME,
	fastestLap			TIME,
	fastestPitStop		TIME,
	timeElapsed			TIME,
	raceStatus			VARCHAR(50),
	RaceID				INT				NOT NULL,
	DriverID			INT				NOT NULL,
	TeamID				INT				NOT NULL,
	CONSTRAINT	FK_Result_Race FOREIGN KEY (RaceID) REFERENCES races(RaceID),
	CONSTRAINT FK_Result_Driver FOREIGN KEY (DriverID) REFERENCES drivers(DriverID),
	CONSTRAINT FK_Result_Team FOREIGN KEY (TeamID) REFERENCES constructors(TeamID),
	CONSTRAINT CHK_Position_NonNegative CHECK (position >= 0),
	CONSTRAINT CHK_Points_NonNegative CHECK (points >= 0)
);

PRINT '-- Standings Table --';
DROP TABLE IF EXISTS standings;
CREATE TABLE standings (
    StandingID			INT				PRIMARY KEY, 
    seasonYear			INT				NOT NULL, 
    DriverID			INT				NOT NULL, 
    TeamID				INT				NOT NULL, 
    position			INT				NOT NULL, 
    points				INT				NOT NULL,
    wins				INT				NOT NULL, 
    podiums				INT				NOT NULL, 
    poles				INT				NOT NULL, 
    fastestLaps			INT				NOT NULL, 
    CONSTRAINT FK_Standings_Driver FOREIGN KEY (DriverID) REFERENCES drivers(DriverID), 
    CONSTRAINT FK_Standings_Team FOREIGN KEY (TeamID) REFERENCES constructors(TeamID) 
);

PRINT '-- Driver Stats Table --';
DROP TABLE IF EXISTS driverStats;
CREATE TABLE driverStats (
	ID					INT				PRIMARY KEY,
	seasonYear			INT				NOT NULL,
	DriverID			INT				NOT NULL,
	TeamID				INT				NOT NULL, 
    racesWon			INT				NOT NULL DEFAULT 0, 
    poles				INT				NOT NULL DEFAULT 0,
    fastestLaps			INT				NOT NULL DEFAULT 0, 
    CONSTRAINT FK_Championships_Driver FOREIGN KEY (DriverID) REFERENCES drivers(DriverID), 
    CONSTRAINT FK_Championships_Team FOREIGN KEY (TeamID) REFERENCES constructors(TeamID)
);

PRINT '-- Season Participants Table --';
DROP TABLE IF EXISTS seasonParticipants;
CREATE TABLE seasonParticipants (
    SeasonID			INT				PRIMARY KEY, 
    seasonYear			INT				NOT NULL, 
    DriverID			INT				NOT NULL,
    TeamID				INT				NOT NULL, 
    CONSTRAINT FK_SeasonParticipants_Driver FOREIGN KEY (DriverID) REFERENCES drivers(DriverID), 
    CONSTRAINT FK_SeasonParticipants_Team FOREIGN KEY (TeamID) REFERENCES constructors(TeamID) 
);

PRINT '-- Articles Table --';
DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
    ArticleID			INT				PRIMARY KEY, 
    title				VARCHAR(255)	NOT NULL, 
    content				TEXT			NOT NULL, 
    author				VARCHAR(100)	NOT NULL, 
    publishedDate		DATE			NOT NULL, 
    category			VARCHAR(50)		NOT NULL, 
    tags				VARCHAR(255) 
);

PRINT '-- Tracks Table --';
DROP TABLE IF EXISTS tracks;
CREATE TABLE tracks (
    TrackID				INT				PRIMARY KEY, 
    trackName			VARCHAR(100)	NOT NULL, 
    location			VARCHAR(100)	NOT NULL, 
    country				VARCHAR(50)		NOT NULL, 
    city				VARCHAR(50)		NOT NULL,  
    numTurns			INT				NOT NULL,
	laps				INT				NOT NULL,
	fullRaceLength		DECIMAL(8, 3)	NOT NULL,
	lapLength			DECIMAL(8, 3)	NOT NULL
);


ALTER TABLE constructors
ADD entryYear INT;

ALTER TABLE constructors
ADD championshipsWon INT;

ALTER TABLE constructors
ADD wins INT;

ALTER TABLE constructors
ADD poles INT;

ALTER TABLE constructors
ADD fastestLaps INT;

ALTER TABLE users
ADD favouriteDriver VARCHAR(100);

ALTER TABLE users
ADD favouriteConstructor VARCHAR(100);

ALTER TABLE drivers
DROP COLUMN favouriteConstructor;

ALTER TABLE drivers
DROP COLUMN favouriteDriver;

ALTER TABLE drivers
DROP COLUMN teamYears;
    
ALTER TABLE drivers
ADD seasonsInF1			INT				NOT NULL DEFAULT 0;

ALTER TABLE drivers
ALTER COLUMN firstName VARCHAR(50) NULL;

ALTER TABLE drivers
ALTER COLUMN lastName VARCHAR(50) NULL;

ALTER TABLE drivers
ALTER COLUMN nationality VARCHAR(30) NULL;

ALTER TABLE drivers
ALTER COLUMN dateOfBirth DATE NULL;

ALTER TABLE drivers
ALTER COLUMN born VARCHAR(100) NULL;

ALTER TABLE drivers
ALTER COLUMN helmutColour VARCHAR(10) NULL;

ALTER TABLE drivers
ALTER COLUMN number INT NULL;

ALTER TABLE races
ADD seasonYear			INT				NOT NULL;

ALTER TABLE drivers
DROP CONSTRAINT DF__drivers__teamYea__3B40CD36;

ALTER TABLE drivers
DROP COLUMN teamYears;

ALTER TABLE constructors
ADD seasonsF1 INT NOT NULL DEFAULT 0;

ALTER TABLE tracks
DROP COLUMN location;

ALTER TABLE tracks
ADD lengthPerLap INT;

ALTER TABLE tracks
ADD laps INT;

ALTER TABLE tracks
DROP COLUMN length;

ALTER TABLE tracks
DROP COLUMN lengthPerLap;

ALTER TABLE tracks
ADD fullRaceLength DECIMAL(8, 3);

ALTER TABLE tracks
ADD lapLength DECIMAL(8, 3);

ALTER TABLE tracks
DROP COLUMN location;

IF OBJECT_ID('races', 'U') IS NOT NULL
    DROP TABLE races;

ALTER TABLE races DROP CONSTRAINT CHK_EndDateTime_GreaterThan_StartDateTime;

ALTER TABLE result DROP CONSTRAINT FK_Result_Race;

ALTER TABLE result
ADD CONSTRAINT FK_Result_Race FOREIGN KEY (RaceID) REFERENCES races(RaceID);

ALTER TABLE races
DROP COLUMN country;

ALTER TABLE races ALTER COLUMN tireCompound VARCHAR(50) NULL;