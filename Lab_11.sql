CREATE TABLE STU_INFO(
	RNO INT PRIMARY KEY,
	NAME VARCHAR(10),
	BRANCH VARCHAR(10)
);

SELECT * FROM STU_INFO;

INSERT INTO STU_INFO VALUES(101 , 'RAJU' , 'CE');
INSERT INTO STU_INFO VALUES(102 , 'AMIT' , 'CE');
INSERT INTO STU_INFO VALUES(103 , 'SANJAY' , 'ME');
INSERT INTO STU_INFO VALUES(104 , 'NEHA' , 'EC');
INSERT INTO STU_INFO VALUES(105 , 'MEERA' , 'EE');
INSERT INTO STU_INFO VALUES(106 , 'MAHESH' , 'ME');

CREATE TABLE RESULT(
	RNO INT,
	SPI DECIMAL(6,2)
);

SELECT * FROM RESULT;

INSERT INTO RESULT VALUES(101 , 8.8);
INSERT INTO RESULT VALUES(102 , 9.2);
INSERT INTO RESULT VALUES(103 , 7.6);
INSERT INTO RESULT VALUES(104 , 8.2);
INSERT INTO RESULT VALUES(105 , 7.0);
INSERT INTO RESULT VALUES(107 , 8.9);

CREATE TABLE EMPLOYEE_MASTER1(
	EMPLOYEENO VARCHAR(7),
	NAME VARCHAR(10),
	MANAGERNO VARCHAR(7)
);

--DROP TABLE EMPLOYEE_MASTER;

SELECT * FROM EMPLOYEE_MASTER1;

INSERT INTO EMPLOYEE_MASTER1 VALUES('E01' , 'TARUN' , NULL);
INSERT INTO EMPLOYEE_MASTER1 VALUES('E02' , 'ROHAN' , 'E02');
INSERT INTO EMPLOYEE_MASTER1 VALUES('E03' , 'PRIYA' , 'E01');
INSERT INTO EMPLOYEE_MASTER1 VALUES('E04' , 'MILAN' , 'E03');
INSERT INTO EMPLOYEE_MASTER1 VALUES('E05' , 'JAY' , 'E01');
INSERT INTO EMPLOYEE_MASTER1 VALUES('E06' , 'ANJANA' , 'E04');

--Part � A:

--1.Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO, RESULT;

--2.Perform inner join on Student and Result tables.
SELECT S.RNO, S.NAME, S.BRANCH, R.SPI FROM STU_INFO S
JOIN RESULT R
ON S.RNO = R.RNO;

--3.Perform the left outer join on Student and Result tables.
SELECT S.RNO, S.NAME, S.BRANCH, R.SPI FROM STU_INFO S
LEFT JOIN RESULT R
ON S.RNO = R.RNO;

--4.Perform the right outer join on Student and Result tables.
SELECT S.RNO, S.NAME, S.BRANCH, R.SPI FROM STU_INFO S
RIGHT JOIN RESULT R
ON S.RNO = R.RNO;

--5.Perform the full outer join on Student and Result tables.
SELECT S.RNO, S.NAME, S.BRANCH, R.SPI FROM STU_INFO S
FULL JOIN RESULT R
ON S.RNO = R.RNO;

--6.Display Rno, Name, Branch and SPI of all students.
SELECT S.RNO , S.NAME , S.BRANCH , R.SPI
FROM STU_INFO S JOIN RESULT R
ON  S.RNO = R.RNO;

--7.Display Rno, Name, Branch and SPI of CE branch�s student only.
SELECT STU_INFO.RNO , STU_INFO.NAME , STU_INFO.BRANCH , RESULT.SPI
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH = 'CE';

--8.Display Rno, Name, Branch and SPI of other than EC branch�s student only.
SELECT STU_INFO.RNO , STU_INFO.NAME , STU_INFO.BRANCH , RESULT.SPI
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.BRANCH != 'EC';

--9.Display average result of each branch.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) AS AVG_RESULT
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH;

--10.Display average result of CE and ME branch.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) AS AVG_RESULT
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
HAVING STU_INFO.BRANCH IN ('CE' , 'ME');


--Part � B:

--1.Display average result of each branch and sort them in ascending order by SPI.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) AS AVG_RESULT
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH , RESULT.SPI
ORDER BY RESULT.SPI;

--2.Display highest SPI from each branch and sort them in descending order.
SELECT STU_INFO.BRANCH , MAX(RESULT.SPI) AS MAX_RESULT 
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH , RESULT.SPI
ORDER BY RESULT.SPI DESC;

--Part � C:

--1.Retrieve the names of employee along with their manager�s name from the Employee table.
SELECT e1.NAME AS EmployeeName, e2.NAME AS ManagerName
FROM EMPLOYEE_MASTER1 e1
JOIN EMPLOYEE_MASTER1 e2 ON e1.MANAGERNO = e2.EMPLOYEENO;


SELECT * FROM EMPLOYEE_MASTER1;