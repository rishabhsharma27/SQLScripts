Select REPLACE(
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
            AS json_format
into dbo.shopping_cart_column_converted_to_json
FROM [dbo].[Order_raw] o

--Json_format_reference
--[
--  { "item": "item1", "count": 2 },{ "item": "item2", "count": 2 }
--]