SELECT 
  cart.order_id,
  j.item,
  j.count
FROM [dbo].[Json_shopping_cart] AS cart
CROSS APPLY OPENJSON(cart.shopping_cart)
WITH (
    item  VARCHAR(100) '$.item',
    count INT          '$.count'
) AS j;
