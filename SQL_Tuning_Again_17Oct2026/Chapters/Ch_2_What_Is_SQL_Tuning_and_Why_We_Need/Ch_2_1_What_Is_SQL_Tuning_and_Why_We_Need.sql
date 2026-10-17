/*

    WHAT IS SQL TUNING?
        Some people explain SQL tuning with some routes to achive a place. You can either go with a long way or with a shorter ways. Or by a 'CAR'
        or 'PLANE'.
        
        Oracle runs our query based on some execution plans. It means the ways or methods to run our query. Either using an index or reading
        multiple blocks at the same time etc.
        
        So you can show the database server a better way to run your query, so that it will able to return much faster. Some times your query will 
        take minutes or hour or some times it never return a result. This type of query will known as poor or bad performing query.
        
        Oracle is a very strong database. So, even if your query is bad, it will return the result in a short time.
        
        So, most of the time we don't realize that our SQL performs badly.
        ORACLE checks your query and try to optimize or tune it, by changing our query with another one that will return the same result. 
        *** BUT WILL PERFORM BETTER ***
        
        If you generate a report by SQL that will takes 1hr to produce data means in this area our query performs badly. this will be very bad
        for our job in the future.
        
        Here we should tune the query, we know database is a nothing  but a software and this software needs some hardware to run on it.
        We should know that HARDWARE are really expensive and when you use the database on more cores you will pay more to oracle.
        
        *** NO ONE WANTS TO PAY MORE TO DO THE SAME JOB ***
        
        So better performance on your queries will need less hardware and this will decrease the cost of your company.
        
        ************************************************************************************************************************************
        
        SQL tuning is the combination of some techniques that will improve the performance of your queries. It can be changing the index type,
        data type or creating the index in the correct way.
        
        SQL tuning techniques include the knowledge about the SYSTEM or ARCHITECTURE.

*/