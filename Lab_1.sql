
CREATE TABLE DEPOSIT
(
ACTNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2),
ADATE DATETIME
)

--INSERT DATA INTO TABLE USING QUERY

--INSERT INTO table_name (col_name1, col_name2, ...)
--VALUES
--(value1, value2, ...)
INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(101,'ANIL', 'VRCE', 1000.00, '1-MAR-95')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(102,'SUNIL','AJNI',5000.00,'4-JAN-96')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(103, 'MEHUL', 'KAROLBAGH', 3500.00,'17-NOV-95')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(104, 'MADHURI', 'CHANDI', 1200.00, '17-DEC-95')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(105, 'PRMOD','M.G. ROAD',3000.00,'27-MAR-96')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(106,'SANDIP', 'ANDHERI',2000.00, '31-MAR-96')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(107, 'SHIVANI', 'VIRAR', 1000.00, '5-9-95')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(108, 'KRANTI', 'NEHRU PLACE', 5000.00, '2-7-95')

INSERT INTO DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
VALUES
(109, 'MINU', 'POWAI', 7000.00, '10-8-95')

SELECT * FROM DEPOSIT



--BRANCH TABLE

CREATE TABLE BRANCH
(
BNAME VARCHAR(50),
CITY VARCHAR(50)
)

--INSERT INTO table_name
--VALUES
--(value1, value2, value3)

INSERT INTO BRANCH
VALUES
('VRCE', 'NAGPUR')

INSERT INTO BRANCH
VALUES
('AJNI', 'NAGPUR')

INSERT INTO BRANCH
VALUES
('KAROLBAGH','DELHI')

INSERT INTO BRANCH
VALUES
('CHANDI', 'DELHI')

INSERT INTO BRANCH
VALUES
('DHARAMPETH','NAGPUR')

INSERT INTO BRANCH
VALUES
('M.G. ROAD', 'BANGLORE')

INSERT INTO BRANCH
VALUES
('ANDHERI','BOMBAY')

INSERT INTO BRANCH
VALUES
('VIRAR','BOMBAY')

INSERT INTO BRANCH
VALUES
('NEHRU PLACE','DELHI')

INSERT INTO BRANCH
VALUES
('POWAI','BOMBAY')

SELECT * FROM BRANCH


--CUSTOMERS

CREATE TABLE CUSTOMERS
(
CNAME VARCHAR(50),
    CITY VARCHAR(50)
)

--INSERT INTO table_name
--VALUES
--('value1','value2')
--('value3','value4')


INSERT INTO CUSTOMERS
VALUES
('ANIL', 'CALCUTTA'),
('SUNIL', 'DELHI'),
('MEHUL', 'BARODA'),
('MANDAR', 'PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','BOMBAY'),
('KRANTI', 'BOMBAY'),
('NAREN', 'BOMBAY')

SELECT * FROM CUSTOMERS


--BORROW

CREATE TABLE BORROW
(
LOANNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2)
)


INSERT INTO BORROW
VALUES
(201, 'ANIL', 'VRCE', 1000.00),
(206,'MEHUL', 'AJNI', 5000.00),
(311,'SUNIL', 'DHARAMPETH', 3000.00),
(321,'MADHURI', 'ANDHERI' ,2000.00),
(375,'PRMOD', 'VIRAR' ,8000.00),
(481,'KRANTI', 'NEHRU PLACE', 3000.00)

SELECT * FROM BORROW