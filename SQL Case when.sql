USE [3 HOUR CODE]
Select * from employeeposition
select * from EMPLOYEINFO

--Case when ---
SELECT E.EmpFname AS NAME,E.EmpLname AS SURNAME, EP.Salary,
	CASE 
	   WHEN E.PROJECT='P1' THEN EP.SALARY+ 0.2* EP.Salary
	   WHEN E.PROJECT='P2' THEN EP.SALARY+ 0.25* EP.Salary
	   WHEN E.PROJECT='P3' THEN EP.SALARY+ 0.30* EP.Salary
	END AS NEW_SALARY
FROM EMPLOYEEPOSITION EP INNER JOIN EMPLOYEINFO E ON EP.EmpID=E.EmpID


--Update by Case when---
begin transaction
update EMPLOYEINFO 
set EMPFNAME= case
			when EmpFname= 'Durgesh' then 'shyam' ELSE EmpFname
		end
from EMPLOYEINFO
rollback transaction

SELECT * FROM EMPLOYEINFO

--UPDATE EMPLOYEINFO SET EmpFname = CASE
--WHEN EmpID=5 THEN 'Raju'
--when EmpID=4 then 'sangita'
--when EmpID=3 then 'ghanshyam'
--when empid = 2 then 'Mohan'
--else EmpFname
--end
--from EMPLOYEINFO

---simple case when--
select * from EMPLOYEINFO

select *,
case when Gender = 'M' then 'Male'
	else 'female'
	end as Final_gender
from employeinfo

---comparisonal operator with case when
Select *,
 CASE
WHEN Salary >=300000 AND Salary <=500000 THEN 'Director'
WHEN Salary >=70000 AND Salary <90000 THEN 'Senior Consultant'
Else 'Director-Assistant'
END AS Designation
from EMPLOYEEPOSITION

---Case Statement with Order by clause
Select *
 from EMPLOYEEPOSITION EP JOIN EMPLOYEINFO EI ON  EP.EMPID=EI.EmpID
  ORDER BY  CASE Gender
WHEN 'M' THEN Salary End ,
Case WHEN Gender='F' THEN Salary
END DESC


----Case Statement in SQL with Group by clause

Select 
 CASE
WHEN Salary >=300000 AND Salary <=500000 THEN 'Director'
WHEN Salary >=70000 AND Salary <90000 THEN 'Senior Consultant'
Else 'Assistant-Director'
END AS Designation,
Min(salary) as MinimumSalary,
Max(Salary) as MaximumSalary
from EMPLOYEEPOSITION EP JOIN EMPLOYEINFO EI ON  EP.EMPID=EI.EmpID
Group By
CASE
WHEN Salary >=300000 AND Salary <=500000 THEN 'Director'
WHEN Salary >=70000 AND Salary <90000 THEN 'Senior Consultant'
Else 'Assistant-Director'
END
