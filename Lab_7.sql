CREATE TABLE EMP(
	EID INT,
	ENAME VARCHAR(25),
	DEPARTMENT VARCHAR(12),
	SALARY DECIMAL(8,2),
	JoiningDate DATETIME,
	CITY VARCHAR(15)
);

INSERT INTO EMP VALUES(101 , 'RAHUL', 'ADMIN', 56000, '1990-JAN-01', 'RAJKOT');
INSERT INTO EMP VALUES(102 , 'HARDIK', 'IT', 18000, '1990-SEP-25', 'AHMEDABAD');
INSERT INTO EMP VALUES(103 , 'BHAVIN', 'HR', 25000, '1991-MAY-14', 'BARODA');
INSERT INTO EMP VALUES(104 , 'BHOOMI', 'ADMIN', 39000, '1991-FEB-08', 'RAJKOT');
INSERT INTO EMP VALUES(105 , 'ROHIT', 'IT', 17000, '1990-JUL-23', 'JAMNAGAR');
INSERT INTO EMP VALUES(106 , 'PRIYA', 'IT', 9000, '1990-OCT-18', 'AHMEDABAD');
INSERT INTO EMP VALUES(107 , 'BHOOMI', 'HR', 34000, '1991-DEC-25', 'RAJKOT');

SELECT * FROM EMP;

--Part – A:
--Create table and inset records as per below.

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select Max(SALARY) as Maximun, Min(SALARY) as Minimun from Emp
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
select sum(salary) as Total_Sal, avg(salary) as Average_Sal from emp 
--3. Find total number of employees of EMPLOYEE table.
select count(ename) from emp
--4. Find highest salary from Rajkot city.
select max(salary) as Max_Sal from emp where city='rajkot'
--5. Give maximum salary from IT department.
select max(salary) as Max_Sal from emp where DEPARTMENT='it'
--6. Count employee whose joining date is after 8-feb-91.
select count(ename) as Emp_after_8feb from emp where JoiningDate>'8-feb-91'
--7. Display average salary of Admin department.
select avg(salary) as Admin_Sal from emp where DEPARTMENT='Admin'
--8. Display total salary of HR department.
select sum(salary) as Total_SAl from emp where DEPARTMENT='hr'
--9. Count total number of cities of employee without duplication.
select count(distinct city) from emp 
--10. Count unique departments.
select count(distinct department) from emp
--11. Give minimum salary of employee who belongs to Ahmedabad.
select min(salary) from emp where city='AHMEDABAD'
--12. Find city wise highest salary.
select max(salary) as Max_Sal from emp group by city
--13. Find department wise lowest salary.
select department, min(salary) as Min_Sal from emp group by DEPARTMENT
--14. Display city with the total number of employees belonging to each city.
select city, count(ename) as No_of_Emp from emp group by city
--15. Give total salary of each department of EMP table.
select department, sum(salary) as Total_Sal from emp group by DEPARTMENT
--16. Give average salary of each department of EMP table without displaying the respective department
--name.
select department, avg(salary) as Avg_Sal from emp group by DEPARTMENT

--Part – B:

--1.Count the number of employees living in Rajkot.
SELECT COUNT(EID) AS EMPLOYEE_FROM_RAJKOT FROM EMP WHERE CITY = 'RAJKOT';
--2.Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY) - MIN(SALARY) FROM EMP AS DIFFRENCE 
--3.Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(EID) AS TOAL_NO_OF_EMPLOYEE FROM EMP WHERE JOININGDATE>'1991-JAN-01';


--Part – C:

--1.Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(EID) AS TOAL_NO_OF_EMPLOYEE FROM EMP WHERE CITY IN ('RAJKOT' , 'BARODA');
--2.Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(EID) AS TOAL_NO_OF_EMPLOYEE FROM EMP WHERE JOININGDATE>'1991-JAN-01' AND DEPARTMENT = 'IT';
--3.Find the Joining Date wise Total Salaries.
SELECT SUM(SALARY) AS DATE_WISE_SALARIES FROM EMP GROUP BY JOININGDATE;
--4.Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(SALARY) AS MAXIMUM_SALARY_WHOSE_NAME_START_WITH_R FROM EMP WHERE ENAME LIKE 'R%' GROUP BY DEPARTMENT,CITY;