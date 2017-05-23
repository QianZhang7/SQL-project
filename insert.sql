insert into Department values('001','electrical engineer');
insert into Department values('002','computer science');

insert into Advisor values ('002','Brad Vander Zanden',NULL,'001','111-222-3333',NULL,'MK111');

insert into Advisor values ('004','Mike Smith',NULL,'002','222-222-3333',NULL,'MK112');

insert into Course values ('1401','002','programming','2014');
insert into Course values ('1501','002','programming','2015');
insert into Course values ('1402','004','database','2014');

insert into Flat values ('1678','1678 Cardiff Rd','3');

insert into Flat values ('2014','2014 Cardiff Rd','4');

insert into Staff values ('777','Renee Frank','rf@gmail.com',NULL,NULL,'f','manager','100 Lowwood, Knoxville');

insert into Staff values ('888','Dave Smith','ds@gmail.com',NULL,NULL,'m','manager','200 Lowwood, Knoxville');

insert into Staff values ('999','Dave MM','dm@gmail.com',NULL,'1940-01-01','m','manager','209 Lowwood, Knoxville');

insert into Hall values ('210', 'Hodges Hall', '210 Hodges Rd, Knoxville', '303-123-4567','777');
insert into Hall values ('310', 'Jamess Hall', '310 Jamess Rd, Knoxville', '303-123-4568','888');

insert into Room values ('12345','001','600','210',NULL);
insert into Room values ('12346','002','500',NULL,'2014');
insert into Room values ('12347','002','500',NULL,'1678');

insert into Inspection values('777', '12345','2014-11-17','n',NULL);


insert into Student values ('001','Mickey Mouse','210 Highwood, Konxville','123-234-3456','mk@gmail.com','1990-1-1','f','undergraduate','US',NULL,NULL,'placed','001','ee',NULL,'002');
insert into Student values ('003','Vivian Mouse','211 Highwood, Konxville','123-234-3457','vk@gmail.com','1990-1-2','f','undergraduate','US',NULL,NULL,'placed','001','ee',NULL,'002');

insert into Student values ('002','Mike Cross','110 Highwood, Konxville','123-234-3457','mc@gmail.com','1991-1-1','m','undergraduate','US',NULL,NULL,'waiting','001','ee',NULL,'002');
insert into lease values ('370101','001','12345','3','2013-08-01','2014-08-01');
insert into lease values ('370102','003','12347','3','2014-08-01','2015-08-01');
insert into invoice values ('200300100','370101','1','3000','2014-08-01','check',NULL,NULL);
insert into invoice values ('200300101','370101','2','3000','2014-01-01',NULL,NULL,NULL);
insert into invoice values ('200300102','370101','3','1200','2014-06-01',NULL,NULL,NULL);

insert into nexttokin values('001','Minnie Mouse', 'sister', '100 Disney, Orlando','100-200-300');
