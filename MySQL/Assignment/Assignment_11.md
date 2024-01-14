## DBMS Assignment - 11 ()
---

####  Table Info:
- Customer (Id, Name, City, Discount)
- Agent (Id, Name, City Commission_per)
- Produce (Id, Name, City, Quantity, Price)
- Orders (Ord_No, Month, Cid, Aid, Pid, Quantity, Total_Price)

#### Assignment List

Define all the integrity constraints and execute the following queries:
1. Get the product names order by the customer(s) based in Delhi, through the agent(s) based in Kanpur.
2. Find customer who have the largest discount. The customer list must be  in a sorted order.
3. Find out the agent names who place order for all the products ordered by Customer 'C014'.
   The agents' names must be in a sorted order.
4. Get the names of the agents with names begin with 'M', who didn't place any order for any product in Kolkata.
5. Find out the total number of product quantities ordered in the months of January and December.