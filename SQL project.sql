drop database NIMC;

--create a NIMC database
create database NIMC

use NIMC

--create 4 tables: state, candidate details, LG details, Address.

create TABLE State (
	statecode int not null CONSTRAINT pk_State primary key,
	state_name varchar(25) not null
);

create TABLE Candidates (
	candidateID int not null IDENTITY(101,1) CONSTRAINT pk_Candidates primary key ,
	name varchar(255) not null,
	gender varchar(10) not null CONSTRAINT chk_gender check (gender IN ('male','female','others')),
	date_of_birth DATE not null,
	age_bracket varchar(15) not null CONSTRAINT chk_age CHECK(age_bracket IN ('child', 'teenager', 'young adult', 'mature adult', 'advanced', 'aged' )),
	state_of_origin varchar(25),
	lGA_of_origin varchar(25),
	addressID int ,
	occupation varchar(50),
	profession varchar(50),
);

create TABLE LG_Details (
	LG_code int not null CONSTRAINT pk_LG_Details primary key,
	LG_name varchar(25) not null
);

create TABLE Address (
	addressID int not null IDENTITY(1,1) CONSTRAINT pk_Address primary key,
	streetName varchar(100),
	bus_stop varchar(50),
	town varchar(25),
	LGA_code int,
	state_code int,
	constraint fk_LG foreign key (LGA_code) references LG_Details(LG_code),
	constraint fk_State foreign key (state_code) references State(statecode)
);

Alter table Candidates
ADD CONSTRAINT fk_candidatesAdd FOREIGN KEY (addressID)
REFERENCES Address(addressID);

---populating the tables with dummy data

INSERT INTO State (statecode, state_name) 
VALUES (900001, 'Abuja'),
		(100001, 'Lagos'),
		(920001, 'Niger'),
		(110001, 'Ogun'),
		(440001, 'Abia'),
		(830001, 'Sokoto'),
		(600001, 'Borno'),
		(320001, 'Delta'),
		(300001, 'Edo'),
		(340001, 'Ondo'), 
		(230001, 'Osun'),
		(200001, 'Oyo'),
		(930001, 'Plateau'), 
		(500001, 'Rivers'),
		(400001, 'Enugu'),
		(460001, 'Imo'),
		(720001, 'Jigawa'), 
		(700001, 'Kano'),
		(800001, 'Kaduna'), 
		(240001, 'Kwara'),
		(660001, 'Taraba'), 
		(310001, 'Yobe'),
		(840001, 'Ebonyi'), 
		(820001, 'Katsina'), 
		(860001, 'Kebbi');
	
select * from State;

INSERT INTO LG_Details (LG_code, LG_name) 
VALUES (601, 'Abadam'),
		(602, 'Bayo'),
		(901, 'Abaji'),
		(902, 'Bwari'),
		(841, 'Abakaliki'),
		(842, 'Ezza North'),
		(321, 'Ndokwa East'),
		(322, 'Oshimili North'),
		(301, 'Ovia North-East'),
		(302, 'Owan West'),
		(341, 'Akure South'),
		(342, 'Ifedore'),
		(231, 'Ifedayo'),
		(232, 'Egbedore'),
		(1001, 'Apapa'),
		(1002, 'Lagos Island');

select * from LG_Details;

Insert Into Address
Values ('Commercial Avenue', 'Sabo', 'Yaba', 1002, 100001),
		('davies street', 'abule oja', 'Yaba', 1001, 100001),
		('wemimo avenue', 'agbe', 'osita', 321, 320001),
		('ladipo street', 'odan', 'marina', 1002, 100001),
		('Broad street', 'odan', 'marina', 1002, 100001),
		('Allen Avenue', 'allen roundabout', 'ikeja', 342, 340001),
		('Toyin street', 'ogba', 'ikeja', 231, 230001),
		('Ademola Adetokunbo street', '', 'egbogbo', 322, 320001),
		('Ozumba Avenue', 'wemb', '', 321, 320001),
		('Adeola Odeku street', 'west', 'south', 321, 320001),
		('Ladoke', 'costain', 'Pencinema', 1002, 100001),
		('Abbey street', 'modern', 'murray', 1002, 100001),
		('Abbot avenue', 'agege', 'ikeja', 321, 320001),
		('Albert road', 'oja', 'ogba', 1002, 100001),
		('Alma avenue', '', 'victoria island', 322, 320001),
		('Baker street', 'mma', 'lekki', 1002, 100001),
		('Ann avenue', 'market', 'freemont', 321, 320001),
		('Bell yard street', 'freeridge', 'Yaba', 1001, 100001),
		('Burton street', 'isola', 'badagry', 322, 320001),
		('Bury court', '', 'calson', 1002, 100001),
		('Canal Bank', 'bank', 'st ives', 321, 320001),
		('Castle place', 'palace', 'North end', 1001, 100001),
		('Church avenue', 'church', 'upway', 322, 320001),
		('Clay street', 'clay', 'norman', 1001, 100001),
		('Cotten Grove', 'cotten', 'compton', 321, 320001),
		('Dan street', 'dan', 'theed', 1002, 100001),
		('Hope Lane', 'hope', 'Rhoda', 1002, 100001),
		('Market square', 'market', 'Pear', 901, 900001),
		('Nelsom place', 'barracks', 'Season', 1002, 100001),
		('Pheanix street', 'junction', 'oscar', 601, 600001),
		('Prince Road', 'palace', 'Fortune', 341, 340001),
		('Queens avenue', 'queen', 'oshogbo', 342, 340001),
		('Railway avenue', 'railway', 'ota', 601, 600001),
		('Victoria street', 'vi', 'ijesha', 322, 320001),
		('Willow park avenue', 'park', 'oyo', 842, 840001),
		('York mews street', 'york', 'uyo', 342, 340001),
		('winchester avenue', '', 'asaba', 322, 320001),
		('Union street', 'union', 'warri', 301, 300001),
		('Thomas avenue', 'tom', 'portharcourt', 902, 900001),
		('Town hall street', '', 'calabar', 902, 900001),
		('Star palace avenue', '', 'bauchi', 1001, 100001),
		('Richmond rd street', '', 'Yenogua', 342, 340001),
		('Rose middle place', 'rose', 'lafia', 321, 320001);

select * from address;

Insert into Candidates
Values ( 'Abiola Adeyinka', 'female', '05-05-98', 'young adult', 'Lagos', 'Lagos Island', 1, 'IT', 'self-employed'),
		( 'Ashley', 'female', '02-12-2010', 'Child', 'Lagos', 'Apapa', 2, '', 'Unemployed'),
		( 'Nick', 'male', '04-03-2002', 'teenager', 'Delta', 'Ndokwa East', 3, 'Student', 'Unemployed'),
		( 'Shannon', 'female', '07-22-1995', 'young adult', 'Abuja', 'Abaji', 4, 'Banker', 'Professional'),
		( 'Mark', 'male', '05-03-1977', 'mature adult', 'Borno', 'abadan', 5, 'Family Doctor', 'Professional'),
		( 'Adam', 'male', '05-05-1960', 'advanced', 'Delta', 'Ndokwa East', 6, 'Entrepreneur', 'Self-employed'),
		( 'Mellisa', 'female', '05-25-1930', 'aged', 'Edo', 'Owan West', 7, '', 'Retired'),
		( 'Jeff', 'male', '10-01-2018', 'child', 'Ondo', 'Akure south', 8, '', 'Unemployed'),
		( 'Rebecca', 'female', '07-02-2005', 'teenager', 'Osun', 'Egbedore', 9, 'Student', 'Unemployed'),
		( 'Tyler', 'male', '03-29-1994', 'young adult', 'Ebonyi', 'Abakaliki', 10, 'Security Analyst', 'Salaried'),
		( 'Mary', 'female', '04-16-1986', 'mature adult', 'Lagos', 'Lagos Island', 11, 'Developer', 'Salaried'),
		( 'Christina', 'female', '05-14-1973', 'advanced', 'Abuja', 'Bwari', 12, 'Lawyer', 'Professional'),
		( 'Travis', 'male', '06-20-1954', 'aged', 'Borno', 'Bayo', 13, '', 'Retired'),
		( 'Kelly', 'female', '07-15-2016', 'child', 'Delta', 'Oshimili North', 14, '', 'Unemployed'),
		( 'Frank', 'male', '08-22-2006', 'teenager', 'Edo', 'Ovia North-East', 15, 'Student', 'Unemployed'),
		( 'Victoria', 'female', '09-17-1992', 'young adult', 'Ondo', 'Ifedore', 16, 'Engineer', 'Salaried'),
		( 'Bradley', 'male', '11-10-1983', 'mature adult', 'Osun', 'Ifedayo', 17, 'software programmer', 'Self-employed'),
		( 'Stephanie', 'female', '06-11-1969', 'advanced', 'Ebonyi', 'Ezza North', 18, 'Muscian', 'Professional'),
		( 'Mike', 'male', '12-12-1952', 'aged', 'Lagos', 'Apapa', 19, '', 'Retired'),
		( 'Tiffany', 'female', '01-29-2008', 'child', 'Lagos', 'Lagos Island', 20, '', 'Unemployed'),
		( 'Scott', 'male', '11-02-2003', 'teenager', 'Delta', 'Ndokwa East', 21, 'Student', 'Unemployed'),
		( 'Elizabeth', 'female', '03-03-1993', 'young adult', 'Abuja', 'Bwari', 22, 'Actor', 'Professional'),
		( 'Eric', 'male', '04-22-1988', 'mature adult', 'Borno', 'Abadan', 23, 'Aeronautics engineering', 'Salaried'),
		( 'Lindsey', 'female', '05-30-1967', 'advanced', 'Delta', 'Ndokwa East', 24, 'solicitor', 'Self-employed'),
		( 'Ryan', 'male', '06-19-1953', 'aged', 'Delta', 'Ndokwa East', 25, '', 'Retired'),
		( 'Andrea', 'female', '09-07-2013', 'child', 'Lagos', 'Lagos Island', 26, '', 'Unemployed'),
		( 'Heather', 'female', '11-08-2001', 'teenager', 'Edo', 'Ovia North-East', 27, 'Student', 'Unemployed'),
		( 'Tommy', 'male', '08-03-98', 'young adult', 'Ebonyi', 'Ezza North', 28, 'neurosurgeon', 'Professional');

select * from Candidates;
 
--- Question 1: Count how many female candidates resides in lagos island local government
-- Solution

select COUNT(gender) as female_candidates_lagos_Island
FROM Candidates A join Address B 
On A.addressID = B.addressID
join LG_Details C ON B.LGA_code = C.LG_code
WHERE gender = 'Female' and LG_name = 'lagos Island';

--- Question 2: Count the aged people living in delta state 
-- Solution

select count(age_bracket) as aged_in_delta 
from Candidates A join Address B 
ON A.addressID = B.addressID
JOIN State C On B.state_code = C.statecode
WHERE age_bracket ='aged' and state_name = 'delta';

--- Question 3: What is the average age of people living in Lagos State
-- Solution


Select name, date_of_birth, age_bracket, 
CAST(DATEDIFF(DD, date_of_birth, GETDATE())/365.25 AS INT) AS [Age], addressID
INTO Candidates_age
FROM Candidates;

select * from Candidates_age;

select AVG(Age) as avg_age 
from Candidates_age A join Address B
ON A.addressID = B.addressID 
join State C on B.state_code = C.statecode
where state_name = 'Lagos';

--- BACKUP DATABASE NIMC
--- TO DISK ='D:\GoldTech Project\SQL project.sql'
--- ;