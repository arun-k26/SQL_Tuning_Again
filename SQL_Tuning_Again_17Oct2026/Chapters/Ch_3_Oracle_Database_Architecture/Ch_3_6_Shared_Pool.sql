/* 

    The shared pool is the one of the SGA components. SHA has some components that shared by all the sessions.

    DATA DICTIONARY CACHE : 
         example : select * from employees;

            When you run a select query, the database needs to know if there is any employees table in the database, or which column should
            I return when I use (*) keyword, etc.

            SO, the defenition of the tables are stored in this cache, and the server decides if our query is right or wrong by, making the
            check from the DATA DICTIONARY CACHE. The data in this memory area is read from the database tablespace, it means data dictionary
            views but inorder to increase the performance, they are copied here for faster access.


    ************************************************************************************************************************************


    RESULT CACHE :
        If you run a query first time, it will take some time to return a value, if you the same query again, it returns immediately, 
        first time it tooks 5sec. Now it took only 3s. How is it possible?? This is done by the RESULT CACHE.

        If the same statement is executed again and again by the same or different user, it will be much better to keep the data into a 
        memory area and return it to the next user. Because, executing a query is not a simple task. It needs lot of disc reads and 
        CPU cycles and reading from the disc is very costly operation. it takes too much time based on the size of your table.

        WITH STORING THE RESULT IN THE RESULT CACHE, WE ELIMINATE THSE OIPERATIONS FOR THE NEXT CALLS. This increases the performance so 
        much.

        WHAT HAPPENS IF THE DATA IN THE ORIGINAL TABLE CHANGES ? 
            The data will not be the same in the result cache. Because the same query now returns the different result. But, we have the
            different result of the same query in our result cache. At that time, the stored result in the result cache is FLUSHED.

            But with the first call after the changesm the new result is stored in the result cache and returned to the next calls
            immediately untill the data in the related tables changes again.

            ALL THE QUERY RESULTS ARE NOT STORED IN HERE.


    ************************************************************************************************************************************


    LIBRARY CACHE : 
        Shared SQL Area in the library cache including the SQL Statement process information in them. Library cache as the container of the 
        shared SQL area. It manages the size of these shared SQL areas, if somehow the memory is not enough for the shared areas may be because 
        of a small shared pool size or small SGA size, etc.

        SO, the library cache arranges the memory of the shared SQL area by deleting the mose unused one and creating a new one or maybe 
        increasing the size of them. In the shared pool area, there are other memory areas, they area not need to focus on that.

        ***************************************

        The library cache stores the procedures and packages in it and stores the control structure like locks, etc.


        SO, THE SHARED POOL CHECKS THE DICTIONARY CACHE IF THE QUERY IS SUITABLE OR NOT AND CHECKS THE LIBRARY CACH IF THERE ARE ANY 
        EXECUTION PLAN WAS CREATED BEFORE EXECUTE THE QUERY. IF YES, IT USES THE PLAN DIRECTLY FROM THE LIBRARY CACHE AND CHECK THE RESULT
        PRESENTED IN THE RESULT CACHE FOR THIS QUERY. IF YES, IT RETURNS THAT RESULT DIRECTLY, AND IF NOT IT GOES TO THE DISC OR BUFFER
        CACHE BASED ON THE EXECUTION PLAN.

        IF THERE IS NOT EXECUTION PLAN IN THE LIBRARY CACHE, IT CREATES A NEW ONE AND GOES TO THE DISC OR BUFFER CACHE WITH THE NEW PLAN.

*/