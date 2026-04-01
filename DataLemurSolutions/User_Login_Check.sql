--user_id	login_date
--123	02/22/2022 12:00:00
--112	03/15/2022 12:00:00
--245	03/28/2022 12:00:00
--123	05/01/2022 12:00:00
--725	05/25/2022 12:00:00

--CREATE TABLE user_ids(
--	user_id INT,
--	login_date DATE
--); 


--INSERT INTO user_ids (user_id,login_date )
--values(123,	'02/22/2022 12:00:00'),
--		(112,	'03/15/2022 12:00:00'),
--		(245,	'03/28/2022 12:00:00'),
--		(123,	'05/01/2022 12:00:00'),
--		(725,	'05/25/2022 12:00:00');


--This is the same question as problem #31 in the SQL Chapter of Ace the Data Science Interview!

--Imagine you're provided with a table containing information about user logins on Facebook in 2022. 
--Write a query that determines the number of reactivated users for a given month. 
--Reactivated users are those who were inactive the previous month but logged in during the current month.

--Output the month in numerical format along with the count of reactivated users.

--Here's some important assumptions to consider:

--The user_logins table only contains data for the year 2022 and there are no missing dates within that period.
--For instance, if a user whose first login date is on 3 March 2022, we assume that they had previously logged in during the year 2021. Although the data for their previous logins is not present in the user_logins table, we consider these users as reactivated users.
--As of Aug 4th, 2023, we have carefully reviewed the feedback received and made necessary updates to the solution.


SELECT *
FROM user_ids AS curr_month -- 1
WHERE NOT EXISTS (
  SELECT * 
  FROM user_ids AS last_month -- 2
  WHERE DATEPART(Month,last_month.login_date) = 
    DATEPART(Month,DATEADD(month,1, login_date))) -- 3


--SELECT 
--    DATEADD(month,1, login_date),
--    login_date
--FROM user_ids