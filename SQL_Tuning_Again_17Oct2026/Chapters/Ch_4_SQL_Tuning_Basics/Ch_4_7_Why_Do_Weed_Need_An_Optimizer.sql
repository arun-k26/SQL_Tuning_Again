/* 

    How our query is being executed is specified by the Optimizer. And if the optimizer creates an bad execution plan then we will have a 
    poorly performing query or bad sql query. To handle, that we need to guide optimizer to b able to generate a better execution plan.

    WHY DO WE NEED AN OPTIMIZER ? 
        By the developing technology, the data volumne in the database increase so fast. If we have a very big database also if the query is 
        not efficient then it consumes lot of memory. SO, then we need to add extra space for our database. This leads to high cost for the 
        hardware. We need to optimize our query executions and oracle does that automatically by using the OPTIMIZER.

    Optimizer is the software that is dedicated to finding the best execution plan as quickly as possible. Better execution plan will be 100
    times fater runing query. So, this reduce the hardware cost.

        Query A     -> 1 sec
        Query B     -> 1 min
        Query C     -> 1 hr
        Query D     -> 10 sec

    So, query A, B, C, D these are different way of query producting the same output but different performance rate. So, optimizer for the 
    fastest one which returns in 1sec.

    FOR EXAMPLE : select * From products where prod_category = 'Electronics';
    
    1. The first thing optimizer does is, checking the schema information. that means, is there any index are there, what kind og index are 
    there, etc.
    
    2. Based on the schema information, it generates possible access path. How can i read the table ?
        It does not check the performance in here, finds all the possible ways of reading the table.

    3. Now it found, this table has an index on the prod_category column, it can read the table by using the index.

    4. Second option, is reading the whole table. There might be many different access path. Especialy, when we join the table, it will have so
    many different access path. now, its the time to pick one. To choose it precisely, it needs to check the statistics.

        As we know, oracle creates many statistics for our table, indexes, etc. Now here, it checks the statistics of the products table 
        for the prod_category column if our column is select or not

        WHAT DOES THAT MEAN SELECTIVE OR NOT ? 
            If result of our query forms only 1% of the table, that means, our query is pretty selective. SO, we can use our index. 1% is an
            example to say.
            The optimizer decides it. But what if the result is more than 25% of the table rows of the table ? THis time the optimizer knows 
            that, using index is not the efficient way. SO, it prefers full table scan.

*/