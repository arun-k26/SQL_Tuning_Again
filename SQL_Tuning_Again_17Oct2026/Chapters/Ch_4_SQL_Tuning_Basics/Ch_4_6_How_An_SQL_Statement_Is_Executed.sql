/* 

    Oracle follows  some steps before executing your statement:

    REFER D:\VS Code 03-05-2025\VS 
    CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_4_SQL_Tuning_Basics\Ch_4_6_How_An_SQL_Statement_Is_Executed.png

    1. Checking the syntax of the query.
    2. Semantic Check: 
        It means , if your query table is in the database, which columns will be there if you used select *. AS you remember, this is stored 
        in the dictionary cache. So, it gets information from them.

    3. PRIVILEGE CHECK :
        If the user who runs the query they have a privilege to run or not. This is also store in the data dictionary block. If the user does 
        not have the privilege, it returns the error go to the backwardss and finish the execution.

    4. ALLOCATE PRIVATE SQL AREA :
        We will process a query and store it in the memory. for handling with a cursor, it creates a private SQL Area in the users PGA. The 
        result of  a query will stored in here for a while.

    5. FINDING AN EXECUTION PLAN :
        We know that if the similar query is executed before, its execution plan is stored in the shared SQL area in the shared pool server
        checks any execution plan, if YES, we will directly execute our query.

        If the first 3 steps are processed, and our query is found in the shared pool, then this is called as SOFT PARSE or LIBRARY CACHE HIT.

        We will always try to parse our queries with a SOFT PARSE in tuning approaches. Because this increases the performance significantly.
        I need to explain another thing. Since the memory of the shared SQL area is finite, Oracle does not store the statement directly.
        Instead it creates a hash value in the library cache. Once you run your query, the hash value is created for it and this hash value is
        stored as the key for the execution plan in the shared SQL Area.

        But the text of your query is important. Because, since a hash value is created for the query text each line is important.
            FOR EXAMPLE :
                LHS : select f_name, l_name from employees;
                RHS : select l_name, f_name from employees; 

                        LHS != RHS while creating the hash value.

        If the execution plan is not found in the shared pool, then the server will continues for the query, that kind of parsing process is 
        callef HARD PARSE.

    6. ALLOCATED SHARED SQL AREA :
        The first step of hard parsing is allocating some memory in the shared SQL Area. BEcause, the new execution plan will be written in here.
        This allocation can be little time taking because if the shared SQL area is full, it will delete an aged one and cleared the space for
        the new one.

    7. OPTIMIZATION : 
        Optimization is the most important thing in the performance tuning process. The optimized is nothing but a software that get our query as
        an input and retunrns the best execution plan.

        A query can be executed with so many different ways. But the optimizer is for selecting the best execution plan amoung so many ways 
        of doing it. Generally, Optimizerneed to calculate several execution plan and select one of them in 1 second.

        So, the optimizer can calculate for some more time and it can return a better execution plan.   

        FOR EXAMPLE : 
            select * from employees;

            When you run this query, there is only one way of doing it. Reading all the table. But, if you use the where clause or joined with
            mny tables, there will be so many ways of reading it. But generally the optimizer finds a best execution plan under a second.
            If we set this to a higher value, this will be a lot of load on the CPU.
            While the optimizer creates an execution plan it simply tries to find an another SQL that returns the result in a faster way, then
            it decides in which way of reading data will be faster like making a full tbale scan or index scan.

            This stage is for finding how to improve the performance of the query. Once the execution plan is created then the row source 
            generator starts.

    8. ROW SOURCE GENERATOE : 
        Once it got the execution plan and generates the step of the execution. Basically it finds  out how to get from the tables and how to 
        operate with the data, etc.

        Once the row source is generated, which using exactly the steps, the statement is execution and the result is returned to the user.

        SO, the execution of the SQL query is simply like that. When you execute the same query again and again after tje first time, it 
        execution plan is stored in the library cache inside of shared SQL and the rowid of that execution plan also stored in the private SQL 
        Area.

        

*/