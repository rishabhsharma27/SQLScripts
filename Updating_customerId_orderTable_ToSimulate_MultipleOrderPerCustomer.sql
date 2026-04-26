SET NOCOUNT ON;
DECLARE @num INT;
Declare @count INT;
Declare @temp_order Varchar(1);
Declare @temp_cust Varchar(1);
Declare @temp_id Varchar(15);
SET @count = 1000
SET @num = 6

While @count >0
BEGIN
	
	if @count % 50 = 0
	begin
		--SET @temp_order = substring(convert(varchar,datepart(MICROSECOND,GETUTCDATE())),2,1)

		SET @temp_cust =
			(SELECT top 1 substring(order_id,@num,1)
				from [dbo].[Orders]
				WHERE substring(order_id,@num+1,1) =  substring(convert(varchar,datepart(MICROSECOND,GETUTCDATE())),2,1)
				ORDER BY NEWID())

		SET @temp_order		=
			(SELECT top 1 order_id
				from [dbo].[Orders]
				WHERE substring(order_id,@num,1) =  substring(convert(varchar,datepart(MICROSECOND,GETUTCDATE())),2,1)
				ORDER BY NEWID())

		SET @temp_id =
			(SELECT top 1 customer_id
				from [dbo].[Orders]
				WHERE substring(customer_id,@num-2,1) =@temp_cust 
				ORDER BY NEWID())

		print(@temp_order + ' '  + @temp_cust + ' ' + @temp_id )

		Select count(*) 
		from [dbo].[Orders]
		WHERE order_id LIKE Concat('%',@temp_order) 
		and customer_id LIKE Concat('%',@temp_cust) 

		UPDATE [dbo].[Orders]
		SET customer_id = @temp_id
		where customer_id is null
		--WHERE order_id LIKE Concat('%',@temp_order) 
		--and customer_id LIKE Concat('%',@temp_cust) 
	end
	SET @count = @count - 1
END


