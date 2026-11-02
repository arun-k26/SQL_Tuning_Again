/* 

    The best approach is to tune the code while creating a new SQL code.

    HOW TO INCREASE THE PERFORMANCE :
        1. Tuning while creating the code.
            Because, you have executing a query for report it will take 1sec but even higher value query fetch in 1sec means your query is too
            high consuming. So, if you now tune the first query it will gain the performance.

        2. Tuning after the creation :
            Even if you tuned your query, you may need to tune them again. Because if the structure changes, or if a new index is created or
            dropped or even if a data amount changes in the table, the same query might work much slower.

        It is fast in the past, but you need to tune them again because of created new index.

    WHEN TO DECIDE TUNING :
        1 Some of the queries bank significantly more consuming than the others. Thse are top consuming queries. It consumes 80% of total 
        resources. We can easily find the top consuming queries. Oracle cares the statistics so much and continously creates and save so many
        statistics.

        2. BAD SQL. We will see in the future courses

        3. Complaints raised by the end user.

    REASON FOR PERFORMANCE LOSS :
        1. Structural Changes like creating or dropping index.
        2. Any change in the data volume.
        3. Application Changes
        4. Aged Statistics.
        5. DATA BASE UPGRADE
        6. DAtabase parameters Changes  -> Sometimes DBA changes the PGA and SGA size. during that time performance loss may occur too.


    ORACLE CREATES STATISTICS CONTIOUSLY, EXECUTION PLANS ARE CREATED BASED ON THESE STATISTICS...

*/