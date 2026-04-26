
--ALTER TABLE [dbo].[Payments] 
--ADD payment_id VARCHAR(50) NULL;

Update pay
SET pay.payment_id = o.payment_id
FROM [dbo].[Payments] as pay
JOIN [dbo].temp as o
ON o.order_id = pay.order_id 


--WITH X AS (
--    SELECT o.order_id,
--        o.[order_status],
--        [order_purchase_timestamp] as order_date,
--           ROW_NUMBER() OVER (ORDER BY [order_purchase_timestamp]) AS rn,
--    CASE 
--        WHEN pay.payment_type = 'credit_card' THEN 'CC'
--        WHEN pay.payment_type = 'debit_card' THEN 'DC'
--        WHEN pay.payment_type = 'voucher' THEN 'VC'
--        WHEN pay.payment_type = 'wallet' THEN 'WC'
--    END as pay_t
--    FROM dbo.Orders as o
--    LEFT JOIN [dbo].[Payments] as pay
--    ON o.order_id = pay.order_id 
--)


--SELECT order_id,
--concat(FORMAT(rn, '000000'),pay_t,datepart(DAYOFYEAR,order_date),substring(convert(varchar(4),datepart(YEAR,order_date)),3,2)) AS payment_id
--INTO temp
--from X


