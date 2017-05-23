CREATE DATABASE IF NOT EXISTS Housing; USE Housing;
CREATE TABLE IF NOT EXISTS Student(
 bannerNo INT(10) NOT NULL,
 name VARCHAR(50) NOT NULL,
 homeAdd VARCHAR(255) DEFAULT NULL,
 mobile VARCHAR(15) DEFAULT NULL,
 email VARCHAR(50) DEFAULT NULL,
 DOB DATE DEFAULT NULL,
 gender VARCHAR(1) NOT NULL,
 category VARCHAR(50) DEFAULT NULL,
 nationality VARCHAR(50) DEFAULT NULL,
 specialNeeds TEXT,
 comments TEXT, 
 curstatus VARCHAR(50) NOT NULL,
 departmentNo INT(10) NOT NULL, 
 major VARCHAR(50) DEFAULT NULL,
 minor VARCHAR(50) DEFAULT NULL,
 advisorNo INT(10) NOT NULL, PRIMARY KEY (bannerNo), CHECK (gender IN ('m','f')),CHECK (curstatus IN ('placed','waiting'))
);
CREATE TABLE IF NOT EXISTS Advisor(
 advisorNo INT(10) NOT NULL,
 name VARCHAR(50) NOT NULL, 
 `position` VARCHAR(50) DEFAULT NULL,
 departmentNo INT(10) NOT NULL,
 internalTelNo VARCHAR(15) DEFAULT NULL,
 email VARCHAR(50) DEFAULT NULL,
 roomNo VARCHAR(50) DEFAULT NULL, PRIMARY KEY (advisorNo)
);
CREATE TABLE IF NOT EXISTS Department (
departmentNo INT(10) NOT NULL,
name VARCHAR(50) NOT NULL, PRIMARY KEY (departmentNo)
);
CREATE TABLE IF NOT EXISTS Hall (
hallNo INT(10) NOT NULL,
name VARCHAR(50) NOT NULL,
address VARCHAR(255) NOT NULL,
telNo VARCHAR(15) DEFAULT NULL,
managerNo INT(10) NOT NULL, PRIMARY KEY (hallNo));
CREATE TABLE IF NOT EXISTS Flat (
flatNo INT(10) NOT NULL,
address VARCHAR(255) NOT NULL,
availableBed INT (1) NOT NULL, PRIMARY KEY (flatNo), CHECK (availableBed BETWEEN 3 AND 5)
);
CREATE TABLE IF NOT EXISTS Room (
placeNo INT(10) NOT NULL,
roomNo INT(10) NOT NULL,
rentRate FLOAT NOT NULL,
hallNo INT(10) DEFAULT NULL,
flatNo INT(10) DEFAULT NULL, PRIMARY KEY (placeNo), CHECK ((hallNo IS NOT NULL AND flatNo IS NULL) OR (hallNo IS NULL AND flatNo IS NOT NULL))
);
CREATE TABLE IF NOT EXISTS Lease (
leaseNo INT(10) NOT NULL,
bannerNo INT(10) NOT NULL,
placeNo INT(10) NOT NULL,
duration INT(1) NOT NULL,
dateFrom DATE NOT NULL,
dateTo DATE NOT NULL, PRIMARY KEY (leaseNo), CHECK (duration BETWEEN 1 AND 3)
);
CREATE TABLE IF NOT EXISTS invoice (
invoiceNo INT(10) NOT NULL,
leaseNo INT(10) NOT NULL,
semester VARCHAR(15) NOT NULL,
payDue FLOAT NOT NULL,
paydate DATE DEFAULT NULL,
paymethod VARCHAR(15) DEFAULT NULL,
firstReminder DATE DEFAULT NULL,
secondReminder DATE DEFAULT NULL, PRIMARY KEY (invoiceNo)
);
CREATE TABLE IF NOT EXISTS Inspection (
staffNo INT(10) NOT NULL,
placeNo INT(10) NOT NULL,
`date` DATE NOT NULL,
indication VARCHAR (5) NOT NULL,
comments TEXT DEFAULT NULL, PRIMARY KEY (placeNo,`date`), CHECK (indication IN ('y','n'))
);
CREATE TABLE IF NOT EXISTS Staff (
staffNo INT(10) NOT NULL,
name VARCHAR (50) NOT NULL,
email VARCHAR (50) DEFAULT NULL,
home VARCHAR (255) DEFAULT NULL,
DOB DATE DEFAULT NULL,
gender VARCHAR(1) DEFAULT NULL,
`position` VARCHAR (50) NOT NULL,
location VARCHAR (50) NOT NULL, PRIMARY KEY (staffNo), CHECK (gender IN ('m','f', NULL))
);
CREATE TABLE IF NOT EXISTS Course (
courseNo INT(10) NOT NULL,
advisorNo INT(10) NOT NULL,
title VARCHAR(50) NOT NULL,
`year` VARCHAR(4) NOT NULL, PRIMARY KEY (courseNo)
);
CREATE TABLE IF NOT EXISTS NextToKin (
bannerNo INT(10) NOT NULL,
name VARCHAR(50) NOT NULL,
relationship VARCHAR(50) NOT NULL,
address VARCHAR(255) DEFAULT NULL,
telNo VARCHAR(15) NOT NULL, PRIMARY KEY (bannerNo, name)
); 


ALTER TABLE `student`
	ADD CONSTRAINT `FK_student_advisor` FOREIGN KEY (`advisorNo`) REFERENCES `advisor` (`advisorNo`);
ALTER TABLE `student`
	ADD CONSTRAINT `FK_student_department` FOREIGN KEY (`departmentNo`) REFERENCES `department` (`departmentNo`);
ALTER TABLE `advisor`
	ADD CONSTRAINT `FK_advisor_department` FOREIGN KEY (`departmentNo`) REFERENCES `department` (`departmentNo`);	
ALTER TABLE `hall`
	ADD CONSTRAINT `FK_hall_staff` FOREIGN KEY (`managerNo`) REFERENCES `staff` (`staffNo`);
ALTER TABLE `room`
	ADD CONSTRAINT `FK_room_hall` FOREIGN KEY (`hallNo`) REFERENCES `hall` (`hallNo`),
	ADD CONSTRAINT `FK_room_flat` FOREIGN KEY (`flatNo`) REFERENCES `flat` (`flatNo`);	
ALTER TABLE `lease`
	ADD CONSTRAINT `FK_lease_student` FOREIGN KEY (`bannerNo`) REFERENCES `student` (`bannerNo`),
	ADD CONSTRAINT `FK_lease_room` FOREIGN KEY (`placeNo`) REFERENCES `room` (`placeNo`);
ALTER TABLE `invoice`
	ADD CONSTRAINT `FK_invoice_lease` FOREIGN KEY (`leaseNo`) REFERENCES `lease` (`leaseNo`);
ALTER TABLE `inspection`
	ADD CONSTRAINT `FK_inspection_room` FOREIGN KEY (`placeNo`) REFERENCES `room` (`placeNo`),
	ADD CONSTRAINT `FK_inspection_staff` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`);
ALTER TABLE `course`
	ADD CONSTRAINT `FK_course_advisor` FOREIGN KEY (`advisorNo`) REFERENCES `advisor` (`advisorNo`);	
ALTER TABLE `nexttokin`
	ADD CONSTRAINT `FK_nexttokin_student` FOREIGN KEY (`bannerNo`) REFERENCES `student` (`bannerNo`);	



