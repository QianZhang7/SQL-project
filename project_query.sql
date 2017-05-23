/*a.*/
SELECT s.name, h.telNo, h.name
FROM Staff s, Hall h
WHERE s.staffNo = h.managerNo;

/*b.*/
SELECT s.name, s.bannerNo, l.*
FROM Student s, lease l
WHERE s.bannerNo = l.bannerNo;

/*c.*/
SELECT *
FROM Lease
WHERE duration = 3;

/*d.*/
SELECT SUM(i.paydue)
FROM Invoice i, Lease l, Student s
WHERE i.leaseNo =l.leaseNo AND l.bannerNo =s.bannerNo AND s.Name='Mickey Mouse';

/*e.*/
SELECT distinct s.name, s.bannerNo
FROM Student s, Invoice i, Lease l
WHERE s.bannerNo NOT IN(
SELECT l.bannerNo
FROM lease l, invoice i
WHERE i.leaseNo =l.leaseNo AND i.paydate <= '2013-12-01') and s.curstatus = 'placed';

/*f.*/
SELECT *
FROM Inspection
WHERE indication = 'n';

/*g.*/
SELECT s.name, s.bannerNo
FROM Student s, Lease l, Hall h, Room r
WHERE r.placeNo = l.placeNo AND h.hallNo = r.hallNo AND h.name = "Hodges Hall" AND l.bannerNo = s.bannerNo;

/*h.*/
SELECT *
FROM Student
WHERE curstatus = "waiting";

/*i.*/
SELECT category, COUNT(*) AS cnt
FROM Student
GROUP BY category;

/*j.*/
SELECT s.name, s.bannerNo
FROM Student s
WHERE s.bannerNo NOT IN (
SELECT n.bannerNo
FROM NextToKin n);

/*k.*/
SELECT a.name, a.internalTelNo
FROM Advisor a, Student s
WHERE a.advisorNo = s.advisorNo AND s.name = "Mickey Mouse";

/*l.*/
SELECT r.hallNo,h.name, MIN(r.rentRate), MAX(r.rentRate), AVG(r.rentRate)
FROM Room r,Hall h
WHERE r.hallNo =h.hallNo
GROUP BY hallNo;

/*m.*/
SELECT r.hallNo,h.name, COUNT(r.roomNo) AS placecnt
FROM Room r, Hall h
WHERE r.hallNo =h.hallNo AND r.hallNo IS NOT NULL
GROUP BY r.hallNo;

/*n.*/
SELECT staffNo, name, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age,location
FROM staff
WHERE TIMESTAMPDIFF(YEAR, DOB, CURDATE()) >= 60;

/*1678 Cardiff Rd*/
SELECT s.name, f.flatNo, r.roomNo
FROM Student s, Flat f, Room r, Lease l
WHERE s.bannerNo = l.bannerNo AND l.placeNo =r.placeNo AND CURDATE() >= l.dateFrom AND (CURDATE() <= l.dateTo OR l.dateTo IS NULL) AND r.flatNo=f.flatNo AND f.address ='1678 Cardiff Rd';