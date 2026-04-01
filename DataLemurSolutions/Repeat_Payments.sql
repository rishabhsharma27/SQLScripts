--CREATE TABLE Repeat_payment_transaction(
--	transaction_id	int,
--	merchant_id	int,
--	credit_card_id	int,
--	transaction_timestamp	datetime,
--	amount	int

--)

--INSERT INTO Repeat_payment_transaction(transaction_id,  merchant_id	, credit_card_id, transaction_timestamp , amount )
--Values(1,	101,	1	,'2022-09-25 12:00:00',	100),
--(2,	101,	1,	'2022-09-25 12:08:00',	100),
--(3,	101,	1,	'2022-09-25 12:28:00',	100),
--(5,	101,	1,	'2022-09-25 13:37:00',	100),
--(4,	101,	2,	'2022-09-25 12:20:00',	300),
--(6,	102,	2,	'2022-09-25 14:00:00',	400),
--(7,	102,	3,	'2022-09-26 10:00:00',	300),
--(8,	102,	3,	'2022-09-26 10:10:00',	300),
--(9,	102,	3,	'2022-09-26 10:14:00',	300),
--(10,	103,	4	,'2022-09-27 12:00:00',	50),
--(11, 103,	4,	'2022-09-27 12:09:00',	50),
--(12,	103,	4	,'2022-09-27 22:00:00',	50),
--(14,	105,	6	,'2022-09-27 12:10:00',	100),
--(13,	105,	6	,'2022-09-27 12:00:00',	200);

--Sometimes, payment transactions are repeated by accident; it could be due to user error, 
--API failure or a retry error that causes a credit card to be charged twice.

--Using the transactions table, identify any payments made at the same merchant with the same 
--credit card for the same amount within 10 minutes of each other. Count such repeated payments.

--Assumptions:

--The first transaction of such payments should not be counted as a repeated payment. This means,
--if there are two transactions performed by a merchant with the same credit card and for the same 
--amount within 10 minutes, there will only be 1 repeated payment.

CREATE VIEW Repeat_payment_transaction_solution AS
SELECT * 
from( 
	SELECT *,
		lag(transaction_timestamp) over (
			partition by merchant_id, credit_card_id, amount
			order by transaction_timestamp
		) AS pre_transaction_timestamp
	from Repeat_payment_transaction AS trans
--order by transaction_id
) as sub
where DATEdiff(MINUTE,pre_transaction_timestamp,transaction_timestamp) <= 10


-- the below gives the count of Repeat_payments
--Select count(*) AS repeat_payment
--from cte
--where DATEdiff(MINUTE,pre_transaction_timestamp,transaction_timestamp) <= 10
