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

