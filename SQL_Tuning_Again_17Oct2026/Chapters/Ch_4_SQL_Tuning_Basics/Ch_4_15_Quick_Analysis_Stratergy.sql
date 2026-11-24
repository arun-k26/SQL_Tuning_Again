/* 

    WHEN WE USE THIS STRATERGY :
        1. Quick Tuning Stratergies did not work and we have time to work on this problem.
        2. Query can be modified.
        3. Determine the underlying cause.


    WHAT TO DO IN THIS STRATERGY ?
        1. Statistics ad Parameters 
            Statistics are up-to-date and Parameters are reasonable.
        
        2. Query Structure :
            Performance issue comes because of some bad SQL. So we will mostly need to change the queries to perform better.
            
        3. Changing Access Paths :
            We mostly change the access path by changing the query. But sometimes we can do some other ways like hints to change the access
            path or we may change the structure somtimes.
        
        4. Chaning Join Orders and Join Methods :
            This is the most expensive operation in the databse is JOINS. So, wrong type of join orders or join methods can cause huge cost.
        
        5. Others :
            Some other thing to change like parallelism or partition pruning, etc.
        
    
    WHAT IS THE STRATERFY ? 
        1. Execution plan

        2. Information of objects in the query like which or what type of indexes are used, which columns are used, what are their types, 
        etc.

        3. STATISTICS : 
            Collecy object statistics and the system statistics. Object statistics will helps to create a better execution plan. System 
            statistics are also important. Because sometimes the CPU resources are used so much with some other queries or batch processes or
            another application, etc.
        
        4. HISTOGRAMS : 
            With checking the histogram and the values being search in the query, the optimizer will create a better execution plan. SO, we 
            need to check ig there are any histograms for columns used in our query.
        
        5. PARAMETER SETTING :
            This is controlled by the DBA Most of the time.
        
        6. Available tools like (SQLT, DBMS_STATS, TKPROF, AWR Report, etc).

    
    PRE-ANALYSING OF THE QUERY :    
        1. Chek the volume of resulting data returning 100 datas only not to fetch unwanted or entire results.
        2. Check the predicates.
        3. Check the problematic constructs.
    

    ANALYSING THE EXECUTION PLAN :
        Tool to get the execution plan (SQL Trace, TKPROF, V%_SQL_PLAN, DBMS_MONITOR, AWRSQRPT.sql, etc).

    
    HOW TO READ THE EXECUTION PLAN :
        1. Check the access path. It is reading an full table scan, using index, is it an appropriate access path, etc.

        2. Checking the Join Order and Join Type :
            Changing Join Order or join type to make to run faster.
        
        3. Comparing the Actual number of rows and estimated number of rows :
            As we know, the Optimizer creates the execution plan based on the estimates. But estimators are estimates. So, we dont expect them
            to accurate. IF the statistics are not up-to-date then the estimates will not be accurate. Based on comparing actual and estimated 
            number of rows and the actual number of rows, we can find out that the selectivity is not calculated right. Therefore, Statistics
            are not up-to-date

        4. Find the steps where cost and logical reads are different siginificantly :
            We assume that cost must be proportionally to be logical reads. If there is a large difference on these two, then there is a
            problem.


    FIND POSSIBLE SOLUTION : 
        1. Updating Statistics
        2. Using Dynamic Statistics
        3. Droping or Recreating Indexes
        4. Using Hints
        5. OThers

*/