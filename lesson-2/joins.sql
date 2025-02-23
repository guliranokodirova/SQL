---1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

select * from [W3Resource].[Inventory].[Salesman]
select * from [W3Resource].[Inventory].[Customer]

select name, cust_name, Salesman.city  from [W3Resource].[Inventory].[Salesman]
join [W3Resource].[Inventory].[Customer] on Salesman.city = Customer.city


---2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

select * from [W3Resource].[Inventory].[Salesman]
select * from [W3Resource].[Inventory].[Orders]

select a.ord_no, a.purch_amt, b.name, b.city  
from [W3Resource].[Inventory].[Orders] a, 
 [W3Resource].[Inventory].[Salesman] b where  a.salesman_id = b.salesman_id and purch_amt between 500 and 2000


 ---3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.


select * from [W3Resource].[Inventory].[Salesman]
select * from [W3Resource].[Inventory].[Customer]


select a.name, a.city, a.commission, b.cust_name from [W3Resource].[Inventory].[Salesman] as a inner join 
                                                 [W3Resource].[Inventory].[Customer] as b on a.salesman_id = b.salesman_id

----4. From the following tables write a SQL query to find salespeople who received commissions of more 
---than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

select a.cust_name, a.city, b.name, b.commission from  [W3Resource].[Inventory].[Salesman] as b inner join 
  [W3Resource].[Inventory].[Customer] as a on a.salesman_id = b.salesman_id
  where b.commission > 0.12 
								
----5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers 
---live and have received a commission of more than 12% from the company.
---Return Customer Name, customer city, Salesman, salesman city, commission. 						
select a.cust_name, a.city, b.name, b.commission from [W3Resource].[Inventory].[Customer] as a 
                                           inner join [W3Resource].[Inventory].[Salesman] as b
										   on a.salesman_id = b.salesman_id
										  where a.city <> b.city and b.commission > 0.12 


----6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 
 

select a.ord_no, a.ord_date, a.purch_amt, b.cust_name, b.grade, c.name, c.commission
from [W3Resource].[Inventory].[Orders] as a inner join [W3Resource].[Inventory].[Customer] as b on a.customer_id = b.customer_id
  left join  [W3Resource].[Inventory].[Salesman] as c on b.salesman_id = c.salesman_id

---7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
select a.ord_no, a.ord_date, a.purch_amt, b.cust_name, b.grade, c.name, c.commission
from [W3Resource].[Inventory].[Orders] as a inner join [W3Resource].[Inventory].[Customer] as b on a.customer_id = b.customer_id
  left join  [W3Resource].[Inventory].[Salesman] as c on b.salesman_id = c.salesman_id


  ----8. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id. 
  select a.cust_name, a.city, a.grade, b.name, b.city from [W3Resource].[Inventory].[Customer] as a 
                                                      join [W3Resource].[Inventory].[Salesman] as b on a.salesman_id = b.salesman_id
													  order by a.customer_id asc

---9. From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, 
---customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.


select a.cust_name, a.city, a.grade, b.name, b.city from [W3Resource].[Inventory].[Customer] as a 
                                     join [W3Resource].[Inventory].[Salesman] as b on a.salesman_id = b.salesman_id
									 where a.grade < 300
									 order by customer_id

----10. Write a SQL statement to make a report with customer name, city, order number, order date,
----and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.

select a.cust_name, a.city, b.ord_no, b.ord_date, b.purch_amt from  [W3Resource].[Inventory].[Customer] as  a
               join  [W3Resource].[Inventory].[Orders] as b on a.customer_id = b.customer_id
			 order by b.ord_date asc 
								
----12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.


select * from [W3Resource].[Inventory].[Salesman]
select * from [W3Resource].[Inventory].[Customer]


select s.salesman_id, s.name, s.city, c.cust_name, c.customer_id, c.grade from  [W3Resource].[Inventory].[Salesman] as s 
                                                                  join 
												                            [W3Resource].[Inventory].[Customer]  as c on s.salesman_id = c.salesman_id 
																			order by s.salesman_id asc 


----13. From the following tables write a  SQL query to list all salespersons along with customer name, city, grade, order number, date,
----and amount. Condition for selecting list of salesmen : 
---1. Salesmen who works for one or more customer or,
---2. Salesmen who not yet join under any customer, Condition for selecting list of customer :
---3. placed one or more orders, or 
---4. no order placed to their salesman.

select * from [W3Resource].[Inventory].[Salesman]
select * from [W3Resource].[Inventory].[Customer]
select * from [W3Resource].[Inventory].[Orders] 

select  a.salesman_id, b.customer_id, b.city, b.grade , c.ord_no, c.ord_date, c.purch_amt from 
                                                                      [W3Resource].[Inventory].[Salesman] as a 
													left 		join
																	  [W3Resource].[Inventory].[Customer] as b on a.salesman_id = b.salesman_id
														    left join 
																	  [W3Resource].[Inventory].[Orders] as c on b.customer_id = c.customer_id
																	  ----where 
																	  ----( b.salesman_id is not null and c.ord_no is not null)
																	  ----or
																	  ----( b.salesman_id is null and c.ord_no is null) 
																	  order by a.salesman_id, b.customer_id 
															
																	  
																	 
	
	- ---
---14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or 
---yet to join any of the customer. The customer may have placed, either one or more orders on , or above order 
---amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.



select  a.salesman_id, b.customer_id, b.city, b.grade , c.ord_no, c.ord_date, c.purch_amt from 
                                                                      [W3Resource].[Inventory].[Customer]  as b
												           left   join
																	  [W3Resource].[Inventory].[Salesman]  as a on a.salesman_id = b.salesman_id
														    left join 
																	  [W3Resource].[Inventory].[Orders] as c on b.customer_id = c.customer_id
																	  where 
																	  ( b.salesman_id is not null and c.ord_no is not null)
																	  or
																	  ( b.salesman_id is null and c.ord_no is null)
																	  or
																	  (c.purch_amt > 2000 and  b.grade is not null
																	
																	  

																	  order by a.salesman_id, b.customer_id 


-----15.For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
----create a report containing the customer name, city, order number, order date, and purchase amount

select a.cust_name, a.city, b.ord_no, b.ord_date, b.purch_amt from  [W3Resource].[Inventory].[Customer] as a 
                                                        right join   [W3Resource].[Inventory].[Orders] as b on a.customer_id = b.customer_id 
														order by a.cust_name 
											
select * from  [W3Resource].[Inventory].[Customer] 
select * from  [W3Resource].[Inventory].[orders] 
																	 

																	
															

																	  



