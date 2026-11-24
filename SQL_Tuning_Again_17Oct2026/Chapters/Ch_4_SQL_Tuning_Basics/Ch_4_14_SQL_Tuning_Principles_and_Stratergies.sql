/* 

    SQL TUNING PRINCIPLES : 
        1. IF your execute an query, the result takes more time to returns the result. So you blindly do not go to tune the query. May be
        slowness occurs due to network or database. So, you need to be sure that the problem is in query or databases.

        2. Once you confirm that the slowness is due to query then you need to clarify the details of the issue. Which table, indexes are used.
        where it is use, in an application or in batch process. when it slowdown, etc. SO, we need to find all the information about the
        problem.

        3. COLLECTING DATA
            There are lot of tools to collect data about your queries like SQL Performance analyzer, TKPROF, AWR Report, Operating System
            Report, etc.
        
        4. ANALYZE THE DATA
            If the statistics are uptodata, parameters are reasonable, optimizer mode is proper, appropriate hints are used, etc.
        
        5. Choose Appropriate Tuning Stratergy.

    SQL TUNING STRATERGIES : 
        1. PARSE TIME REDUCTION :
            If your query spends a lot of time on parsing, the you need to try to decrease the parsing time. Expecting in our query is, 
            parsing for once and executing it for many times. Some times, this will not work.

        2. PLAN COMPARISON STRATERGY :
            If you have a good execution plan for your query, you can compare it with the worst one. Because, the same query can have 
            different execution plans based on the choice of the Optimizer.
        
        3. Quick Solution Stratergy :
            If you dont have a time to analyze a problem with all the aspects. This stratergy is guiding the optimizer to create a better 
            execution plan. TO apply this, we need to check the basics, statistics. If no problem on this, you will just read the execution 
            plan and find the problem ad guide the optimizer to generate a better plan.
        
        4. Finding and Implementing a good plan :
            This is more detailed stratergy than the Quick Solution Stratergy. We can use the SQL TUNING ADVISOR in SQL DEVELOPER. SQL TUNING
            ADVISOR is a software that offers you some techniques to apply. But generally, the Developers do not have the previlage to access
            to it. DBA only have access for it. Or you can change the optimizer setting to generate better plans
        
        5. Quick Analysis Stratergy :
            This need some time and some efforts to apply. This give the best solution. We will see this more detail in next lecture.

*/