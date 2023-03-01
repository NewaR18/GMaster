create table TblWardDetails
(
Ward_Id int identity(1,1) PRIMARY KEY,
Ward_Name nvarchar(10),
Ward_No int,
Ward_Email nvarchar(75),
Ward_Phone nvarchar(75),
Ward_Location nvarchar(75),
Ward_Population nvarchar(10),
Ward_Chief_Name nvarchar(50),
Ward_Chief_Phone nvarchar(20));
insert into TblWardDetails(Ward_Name,Ward_No,Ward_Email,Ward_Phone,Ward_Location,Ward_Population,Ward_Chief_Name,Ward_Chief_Phone) values 
('Ward 1',1,'ward1@kathmandu.gov.np','4534592','Naksal','8008','Bharat Lal Shrestha','9851279901');
use GarbageMaster;
insert into TblWardDetails(Ward_Name,Ward_No,Ward_Email,Ward_Phone,Ward_Location,Ward_Population,Ward_Chief_Name,Ward_Chief_Phone) values 
('Ward 2',2,'ward2@kathmandu.gov.np','4414171','Lazimpat','13448','Rajendra Kumar Shrestha','9851279902'),
('Ward 3',3,'ward3@kathmandu.gov.np','4410885','Maharajgunj','34866','Prem Thapa','9851046149'),
('Ward 4',4,'ward4@kathmandu.gov.np','4416752','Baluwatar','47362','Dinesh Maharjan','9851279904'),
('Ward 5',5,'ward5@kathmandu.gov.np','4531066','Hadigaun','18320','Birendra Prajapati','9851032481'),
('Ward 6',6,'ward6@kathmandu.gov.np','4474001','Bouddha','60334','Bhuwan Lama','9808588388'),
('Ward 7',7,'ward7@kathmandu.gov.np','4470479','Mitrapark','51581','Bimal Kumar Hoda','9841305739'),
('Ward 8',8,'ward8@kathmandu.gov.np','5241058','Jayabageshwori','51581','Aasaman Sangat','9851096303'),
('Ward 9',9,'ward9@kathmandu.gov.np','4474643','Gaushala','40371','Ramji Bhandari','9851191673'),
('Ward 10',10,'ward10@kathmandu.gov.np','5172146','Baneshwor','39820','Ramkumar Kc','9851279910'),
('Ward 11',11,'ward11@kathmandu.gov.np','4261791','Tripureshwor','17765','Hiralal Tandukar','9851279911'),
('Ward 12',12,'ward12@kathmandu.gov.np','5362190','Teku','13262','Bal Krishna Maharjan','9851011226'),
('Ward 13',13,'ward13@kathmandu.gov.np','5372185','Kalimati','40456','Dhurba Narayan Manandhar','9851279913'),
('Ward 14',14,'ward14@kathmandu.gov.np','4235164','Kalanki','58495','Suman Shrestha','9841294775'),
('Ward 15',15,'ward15@kathmandu.gov.np','4277133','Dallu','54476','Ishworman Dangol','9851279915'),
('Ward 16',16,'ward16@kathmandu.gov.np','4381653','Sorakhuttey','84441','Mukunda Rijal','9851279916'),
('Ward 17',17,'ward17@kathmandu.gov.np','4252037','Chhetrapati','25926','Nabin Manandhar','9851279917'),
('Ward 18',18,'ward18@kathmandu.gov.np','4255465','Nardevi','10746','Nhuchhe Kaji Maharjan','9851279918'),
('Ward 19',19,'ward19@kathmandu.gov.np','4257979','Damaitol','10711','Rajesh Kumar Shrestha','9851279919'),
('Ward 20',20,'ward20@kathmandu.gov.np','5353967','Bhimsensthan','10968','Rajendra Manandhar','9851279920'),
('Ward 21',21,'ward21@kathmandu.gov.np','5353838','Jawalakhel','13727','Udaya Chudamani Bajracharya','9851279921'),
('Ward 22',22,'ward22@kathmandu.gov.np','5713644','Tewahal','9187','Chini Kaji Maharjan','9851279922'),
('Ward 23',23,'ward23@kathmandu.gov.np','4260480','Ombahal','8357','Macharaja Maharjan','9851279923'),
('Ward 24',24,'ward24@kathmandu.gov.np','4248664','Makhan','7619','Binod Kumar Raj Bhandari','9841200094'),
('Ward 25',25,'ward25@kathmandu.gov.np','5356607','Masangalli','13203','Rajesh Dangol','9851279925'),
('Ward 26',26,'ward26@kathmandu.gov.np','4416913','Lainchaur','45052','Khyamraj Tiwari','9851279926'),
('Ward 27',27,'ward27@kathmandu.gov.np','5915553','Mahabouddha','8563','Yogesh Kumar Khadgi','9841243566'),
('Ward 28',28,'ward28@kathmandu.gov.np','4225610','Old Buspark','16211','Bhairam Khadki','9851279928'),
('Ward 29',29,'ward29@kathmandu.gov.np','4419979','Dillibazar Pipalbot','33316','Kush Dhakal','9851279929'),
('Ward 30',30,'ward30@kathmandu.gov.np','4417918','Gyaneshwor','25694','Dal Bahadur Karki','9851279930'),
('Ward 31',31,'ward31@kathmandu.gov.np','4473899','Bhimsengola','66121','Saroj Dhakal','9808104976'),
('Ward 32',32,'ward32@kathmandu.gov.np','4990856','Koteshwor','76299','Nawaraj Parajuli','9851279932');

use GarbageMaster;
create table TblWasteDetails
(
	Waste_Id int identity(1,1) PRIMARY KEY,
	UsernameW nvarchar(50),
	Waste_Data int,
	WardNo int,
	DateReviewed SmallDatetime,
	FOREIGN KEY(UsernameW) References Users(Username),
	FOREIGN KEY(WardNo) References TblWardDetails(Ward_Id),
	);
	drop table TblWasteDetails;
	drop table TblWasteHistory;
create table TblWasteHistory(
	Waste_Id int identity(1,1) PRIMARY KEY,
	UsernameWH nvarchar(50),
	Waste_Data_History int,
	WardNoWH int,
	DateReviewedWH SmallDatetime,
	FOREIGN KEY(UsernameWH) References Users(Username),
	FOREIGN KEY(WardNoWH) References TblWardDetails(Ward_Id));


insert into TblWasteDetails(UsernameW, WardNo) values ('NewaR1894',17);
insert into TblWasteHistory values ('Khum',97,18);
delete from TblWasteHistory
delete from extrauserdata where id>1;
delete from users where id>1;

select* from [dbo].[TblWasteDetails];
select* from TblWasteHistory
select* from Users;

create or alter procedure displaywarddetails(@username nvarchar(100))
as
select Ward_Location,Ward_No,Ward_Email,Ward_Phone,Ward_Chief_Name,Ward_Chief_Phone from Users inner join TblWardDetails on Users.Ward=TblWardDetails.Ward_Id where Username=@username;
go

exec displaywarddetails 'PawanWarrior'