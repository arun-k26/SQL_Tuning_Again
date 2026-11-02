/* 

    If you two differenet SQL queries providing the same result but different performance rates. These kind of queries are called as 
    BAD SQL or POOR PERFORMING SQL.

    4 MAJOR REASON THAT AFFECTS THE PERFORMANCE OF OUR QUERIES :
        1. Unnecessary  Parse Time :
            When we run a query, the first thing that the database serves does is "PARSING" it.

            PARSING MEANS THAT CHECKING YOUR QUERY IS VALID, THEN ALLOCATING A PRIVATE SQL AREA (PGA) FOR THIS STATEMENT, AND THEN 
            GENERATING THE EXECUTION PLAN. 
            we will see parsing more detail in upcoming lecture. If our query using more parsing that is a BAD SQL.
        
        2. Unnecessary I/O Operation :
            I/O Operation is reading data from the disk. Sometimes you read 1000 blocks to read only 1 row, sometimes you read 1block to get it.
            It depends how you created your query, or if there are index, etc.

            So if your query reads too much data blocks to get the data, that means your query have excessive I/O Operation.
        
        3. Unnecessary CPU Time :
            If you make some join, sorts, calculations etc these operations are done by the CPU and memory. SO, if you make an unnecessary join
            or sort operations, etc. your query will consume too much CPU cycles then it could use.
        
        4. Unnecessary Waits :
            When you run the query, there might be a lot of wait times until your recieving the result. The database it used by multiple users.
            A single CPU handles hundred of users at a time. Because of this, your query may wait for the other users queries for some time.


    When our query reaches to the database server, there are 2 major thing that from the overall time.

        1. Time on Wait (CPU)
        2. Time on Execution

    Time on Wait (CPU) + Time on Execution = DATABASE TIME

    We need to try to decrease the load on these. SO, you may need your SYSTEM or NETWORK tooooo.

*/