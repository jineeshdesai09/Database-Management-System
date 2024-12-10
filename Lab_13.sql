--Lab13
---PartA
--Advanced level Joins --
CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

SELECT * FROM CITY;
CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);
SELECT * FROM Village;

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

--1.Display all the villages of Rajkot city.
SELECT 
	v.Name as Village,
	c.Name as City
from City c 
join Village v 
on c.CityID=v.CityID 
where c.Name='Rajkot';

--2. Display city along with their villages & pin code.
SELECT 
	c.Name as City_Name,
	v.Name as Village_Name,
	c.Pincode 
from City c 
join Village v 
on c.CityID=v.CityID; 

--3.Display the city having more than one village.
SELECT 
	c.Name as City_Name,
	count(v.CityId) as No_Village
from City c 
join Village v 
on c.CityID=v.CityID 
group by c.Name having count(v.CityId)>1;

--4.Display the city having no village.
select 
	c.Name as City_Name,
	count(v.CityId) as NO_Village
from City c 
full outer join Village v 
on c.CityID=v.CityID 
group by c.Name 
having count(v.CityId)=0;

--5.Count the total number of villages in each city.
select 
	c.Name as City_Name,
	count(v.CityId) as No_Village 
from City c 
full outer join Village v 
on c.CityID=v.CityID 
group by c.Name;

--6.Count the number of cities having more than one village.
select 
	count(c.CityID) as No_City 
from City c 
left outer join Village v 
on c.CityID=v.CityID 
group by c.Name having count(v.CityId)>1;	 

--Create below table with following constraints
--Do not allow SPI more than 10
--Do not allow Bklog less than 0.
Create table STU_MASTER(
Rno int primary key,
Name varchar(50),
Branch varchar(50) Default 'General',
Spi decimal(8,2) check (Spi<=10 and Spi>=0),
Bklog int Check (Bklog>=0)
);
 

select * from STU_MASTER
--Enter the default value as ‘General’ in branch to all new records IF no other value is specified.
Insert into STU_MASTER values(101,'Raju','CE',8.80,0),
(102,'Amit','CE',2.20,3),
(103,'Sanjay','ME',1.50,6),
(104,'Neha','EC',7.65,0),
(105,'Meera','EE',5.52,2),
(106,'Mahesh',default,4.50,3)

--Try to update SPI of Raju from 8.80 to 12.
update STU_MASTER set Spi=12 where Name='Raju'

--Try to update Bklog of Neha from 0 to -1.
update STU_MASTER set Bklog=-1 where Name='Neha'

---Part B


--Create table as per following schema with proper validation and try to insert data which violate your validation.
--Emp(Eid, Ename, Did, Cid, Salary, Experience)
--Dept(Did, Dname)
--City(Cid, Cname)

CREATE TABLE Dept_DETAILS (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_DETAILS(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp_DETAILS (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0), 
    FOREIGN KEY (Did) REFERENCES Dept_DETAILS(Did),
    FOREIGN KEY (Cid) REFERENCES City_DETAILS(Cid)
);

INSERT INTO Dept_DETAILS(Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

INSERT INTO City_DETAILS(Cid, Cname) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago');

INSERT INTO Emp_DETAILS(Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3);

---Part C

--Create table as per following schema with proper validation and try to insert data which violate your validation.
--1.	Emp(Eid, Ename, Did, Cid, Salary, Experience)
--		Dept(Did, Dname)
--		City(Cid, Cname, Did))
--		District(Did, Dname, Sid)
--		State(Sid, Sname, Cid)
--		Country(Cid, Cname)


CREATE TABLE Country_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State_INFO (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country_INFO(Cid)
);

CREATE TABLE District_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State_INFO(Sid)
);

CREATE TABLE Dept_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District_INFO(Did)
);

CREATE TABLE Emp_INFO (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0), -- Salary must be positive
    Experience INT CHECK (Experience >= 0),  -- Experience cannot be negative
    FOREIGN KEY (Did) REFERENCES Dept_INFO(Did),
    FOREIGN KEY (Cid) REFERENCES City_INFO(Cid)
);

INSERT INTO Country_INFO (Cid, Cname) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'UK'),
(4, 'Australia'),
(5, 'India');

INSERT INTO State_INFO (Sid, Sname, Cid) VALUES
(1, 'California', 1),
(2, 'Ontario', 2),
(3, 'London', 3),
(4, 'New South Wales', 4),
(5, 'Gujarat', 5);

INSERT INTO District_INFO (Did, Dname, Sid) VALUES
(1, 'Los Angeles', 1),
(2, 'Toronto', 2),
(3, 'Westminster', 3),
(4, 'Sydney', 4),
(5, 'Ahmedabad', 5);

INSERT INTO Dept_INFO (Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

INSERT INTO City_INFO (Cid, Cname, Did) VALUES
(1, 'Los Angeles City', 1),
(2, 'Toronto City', 2),
(3, 'London City', 3),
(4, 'Sydney City', 4),
(5, 'Ahmedabad City', 5);

INSERT INTO Emp_INFO (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3),
(4, 'Alice Brown', 4, 4, 45000.00, 2),
(5, 'Bob Green', 5, 5, 40000.00, 4);

