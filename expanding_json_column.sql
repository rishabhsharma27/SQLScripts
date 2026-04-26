SELECT 
    o.order_id,
    j.item,
    j.count
--INTO dbo.shopping_cart
FROM [dbo].[Cart_Items_raw] o
CROSS APPLY OPENJSON(
    REPLACE(
        REPLACE(
           REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(o.shopping_cart, ' (', '@{ "item": '),
                    '[(', '[{ "item": '),
                    ', ', ', "count": '),
                    '''', '"'),
                    '@', ' ' ),
                    ')','}') 
)
WITH (
    item  VARCHAR(100) '$.item',
    [count] INT        '$.count'
) AS j;

--[
--  { "item": "item1", "count": 2 },{ "item": "item2", "count": 2 }
--]

--Checking if the replace is working correctly to the json format
--Select REPLACE(
--        REPLACE(
--           REPLACE(
--                REPLACE(
--                    REPLACE(
--                        REPLACE(o.shopping_cart, ' (', '@{ "item": '),
--                    '[(', '[{ "item": '),
--                    ', ', ', "count": '),
--                    '''', '"'),
--                    '@', ' ' ),
--                    ')','}')
--            AS json_format
--into dbo.shopping_cart_column_converted_to_json
--FROM [dbo].[Order_raw] o


