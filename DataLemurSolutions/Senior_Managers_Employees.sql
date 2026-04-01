--CREATE TABLE Senior_Managers_Employees(
--	emp_id	INT,
--	manager_id INT,
--	manager_name VArchar(50)
--);

--INSERT INTO Senior_Managers_Employees(emp_id,	manager_id,	manager_name)
--Values (1,	101,	'Duyen'),
--(101,	1001,	'Rick'),
--(103,	1001,	'Rick'),
--(1001,	NULL,	NULL),
--(2,	    102,	'Delton'),
--(102,	1002,	'Jason'),
--(8,	    107,	'Tina'),
--(107,	1004,	'Tom'),
--(1004,	1002,	'Jason'),
--(1004,	1014,	'Brandon'),
--(125,	1004,	'Tom'),
--(126,	1004,	'Tom'),
--(127,	1004,	'Tom'),
--(128,	1004,	'Tom'),
--(129,	1004,	'Tom'),
--(12,	150,	'Raman'),
--(150,	1001,	'Rick');


--Assume we have a table of Google employees with their corresponding managers.

--A manager is an employee with a direct report. A senior manager is an employee
--who manages at least one manager, but none of their direct reports is senior 
--managers themselves. Write a query to find the senior managers and their direct reports.

--Output the senior manager's name and the count of their direct reports. The senior
--manager with the most direct reports should be the first result.

--Assumption:

--An employee can report to two senior managers.

--Example Output:
--manager_name	direct_reportees
--Rick	1
--Rick is a senior manager who has one manager directly reporting to him, which is employee id 101.

--The dataset you are querying against may have different input & output - this is just an example!

Create OR ALTER VIEW Senior_Managers_Employees_Solution AS
SELECT Distinct(Manager_Name_ID_level2),
Count(Manager_ID_level1) over (
	partition by Manager_Name_ID_level2
) AS direct_reportees
FROM(
	SELECT Emp.emp_id AS Employee_ID,	
		Emp.manager_id AS Manager_ID_level1,
		Emp.manager_name AS Manager_Name_ID_level1,
		Man.manager_id AS Manager_ID_level2,
		Man.manager_name AS Manager_Name_ID_level2
	from Senior_Managers_Employees AS Emp
	Inner JOIN Senior_Managers_Employees AS Man
	ON Emp.manager_id = Man.emp_id
	where Man.emp_id IN (SELECT DISTINCT manager_id  FROM Senior_Managers_Employees)
	--order by Man.manager_id
) as sub 
Where Manager_Name_ID_level2 IS NOT NULL
--order by Manager_Name_ID_level2