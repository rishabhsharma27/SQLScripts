Update p
SET p.[payment_value] = vwOD.payment_value
from dbo.Payments as p 
join dbo.Temp as vwOD
on p.order_id = vwOD.order_id



