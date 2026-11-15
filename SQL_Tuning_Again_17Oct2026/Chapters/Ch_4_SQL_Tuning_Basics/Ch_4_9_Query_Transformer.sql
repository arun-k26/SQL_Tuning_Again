/* 

    REFER : D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_4_SQL_Tuning_Basics\Ch_4_9_Query_Transformer


    We know that same query can be returned by many different queries.
    Query transformer transforms the query into a better performing one but semantically equivalent to it. Oracle gathered all therese and created a query transformer component to transform our query into a better one. Oracle will not change on query all the time query transformer prepare the query internally if it is not a better one compared to original one using the query cost. then it uses the original one.

    To transform our query, Oracle has several methods to apply to our queries. Query transformer may not have decided the best plan. It has a stricted time to decide and it decides based on the statistics.

    So, the statistics may be old and will not be able to decide as good as a developer who knows tuning well.

    SEVER QUERY TRANSFORMING METHODS : 
    
    1. OR EXPANSION : 
        We know that using index will be much faster than a full table scan if the table is big and the query is selective enough. But if you use the OR OPERATOR in the where clause, the indexes will not be used.    
        So, we should delete the OR OPERATOR and use the AND OPERATOR after deleting it the it uses the indexes.

        FOR EXAMPLE : select * from sales where prod_id = 14 or promo_id = 33;
                SALES TABLE contains 1,00,00,000 records.

        Even if we have indexes also for these both columns, the optimizer does not use any of them and simply reads the whole table normally.
        
        So, inorder to increase the performance, the optmizer transforms the query to the better one by chaning the query internally.

        TO BETTER ONE : 
            select * from sales where prod_id = 14
            union all
            select * from sales where promo_id = 33 and prod_id <> 14;
        
        So, ORACLE uses the indexes new. Since, the total cost of the query will be much lesser than the original one. So, OPTIMIZER transforms the original query into new one using the query transformer and new optimizer send this one to the estimator.

        Optimizer not always transforms the query. It will calculate the cost of these two queries original one and the transformed one which is having the less cost, the optimizer choses the lesser one. If not means it will use the original one.

    
    2. SUB-QUERY UNNESTING : 
        The Optimizer transforms the nested query into a join statement.
        FOR EXAMPLE : select * from sales where cust_id in (select cust_id from customers);

        Most of us. using the above type of code in our most of the times. Normally, if the optimizer would not transform it, this would be a costly operation. WHY ? WHAT IS THE PROBLEM IN THIS SUBQUERY ? 
        
        Even if we want only the sales done by a real customer, our query returns all the sales first, and then compare them all by the list of customers retrieved by the SUBQUERY. So, better performance, Query transformer transforms into better one, like 

            select sales.* from sales, customers where sales.cusid = customers.cusid;

        Here, it joined the tables, in this way, since there is an index in the CUST_ID column in customers table, we could use it.
        Besides, unlike the previous one, we did not read all the data into the memory. We got only the mutual one.

        SO, HOW THIS IMPROVES THE PERFORMANCE ????

            It depends on many things like data volume, the selectivity of the columns, etc. The transformer compares cost of these two queries and selects the better one. Several methods that the transformer transforms our query like COMPLEX VIEW MERGING, IN TO EXISTS, FILTER PUSH DOWN, etc.   **REFER ORACLE DOCUMENTATION FOR MORE DETAILS**

        Sometimes, Optimizer also fails to transform the query to better one and it works on the cost estimation based on the statistics.


*/