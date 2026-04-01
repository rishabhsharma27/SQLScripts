
--------------------------------------Step 1: --------------------------------------------------- 
--* Need to make sure the chosen column has only unique values

--WITH CTE AS 
--(	Select *
--	from
--	(SELECT *,
--	row_number() over (
--		partition by ID
--		order by ID
--	) as rn
--	from [table_name] as A) as sub
--	where rn = 2
--)


--SELECT * 
--from [table_name] as a
--Inner join CTE as c
--on c.[column_name] = a.[column_name]

WITH CTE AS 
(	Select *
	from
	(SELECT *,
	row_number() over (
		partition by ID
		order by ID
	) as rn
	from [dbo].[RawSalesData] as A) as sub
	where rn = 2
)

SELECT * 
from [dbo].[RawSalesData] as a
Inner join CTE as c
on c.ID = a.ID

--------------------------------------Step 2: ---------------------------------------------------

--* Need to change the defalut value to Not null for that column
--Alter Table [table_name] Alter Column [column_name] INT NOT NULL;
Alter Table [dbo].[NoDuplicteSalesDataCopy] Alter Column [ID] INT NOT NULL;


--------------------------------------Step 3: ---------------------------------------------------

--Alter Table [table_name] Add Constraint PK_ID primary key([column_name])
Alter Table [dbo].[NoDuplicteSalesDataCopy] Add Constraint PK_ID primary key(ID)