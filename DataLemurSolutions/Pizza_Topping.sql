--CREATE TABLE pizza_topping(
--	topping_name VArchar(255),
--	ingredient_cost	decimal(10,2)
--);


--INSERT INTO pizza_topping(ingredient_cost, topping_name)
--Values(0.50	,'Pepperoni'),
--(0.70	,'Sausage'),
--(0.55	,'Chicken'),
--(0.40	,'Extra Cheese'),
--(0.25	,'Mushrooms'),
--(0.20	,'Green Peppers'),
--(0.15	,'Onions'),
--(0.25	,'Pineapple'),
--(0.30	,'Spinach'),
--(0.20  ,'Jalapenos');


--You’re a consultant for a major pizza chain that will be running a promotion where all 
--3-topping pizzas will be sold for a fixed price, and are trying to understand the costs involved.

--Given a list of pizza toppings, consider all the possible 3-topping pizzas, 
--and print out the total cost of those 3 toppings. Sort the results with the 
--highest total cost on the top followed by pizza toppings in ascending order.

--Break ties by listing the ingredients in alphabetical order, starting from the first 
--ingredient, followed by the second and third.

--P.S. Be careful with the spacing (or lack of) between each ingredient. Refer to our Example Output.

--Notes:

--Do not display pizzas where a topping is repeated. 
--For example, ‘Pepperoni,Pepperoni,Onion Pizza’.
--Ingredients must be listed in alphabetical order. 
--For example, 'Chicken,Onions,Sausage'. 'Onion,Sausage,Chicken' is not acceptable.

CREATE OR ALTER VIEW pizza_topping_Solution AS 
SELECT 
	Concat(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS Ingredients,
	(p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost) AS Total_cost,
	Concat(p1.ingredient_cost, ' / ', p2.ingredient_cost, ' / ' , p3.ingredient_cost) AS Ingredient_cost
from pizza_topping as p1
cross join pizza_topping as p2,
			pizza_topping as p3
where p1.topping_name <  p2.topping_name
and p2.topping_name < p3.topping_name
--order by p1.topping_name;