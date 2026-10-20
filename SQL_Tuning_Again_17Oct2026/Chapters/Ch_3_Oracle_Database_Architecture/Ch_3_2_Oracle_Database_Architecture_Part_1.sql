/* 

    CHAPTETR 3.1 : 
        Oracle is not an simple application, it is a very complex and structured combination of software and hardware. Oracle DB is a relational 
        database. So, it enables the programmers or DBA to control it many aspects. Most of the system do not let the developer or DBA to many 
        any changes inorder to keep the stability of the system. Oracle allows us to change the critical areas as per our wish. But before doing
        that we should know the BTS for the changes.

    
    
    
    CHAPTER 3.2 :
        We don't need to know the entire architecture of ORACLE SQL. That i DBA's job to know that will take upto months or years.

        Our job is only with the memory. we need to focus on the memory area of the architecture. SO, 
        
        *** 
        
        REFER ARCHITECTURE DIAGRAM location : 
        
        D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_3_Oracle_Database_Architecture\
        Ch_3_2_Oracle_Database_Architecture_Memory_Area.png
        
        ***

        This architecture diagram is mainly about the memory. Because, even if our data is stored in the disc. 

        Oracle first returns it to the memory, make some operations like sort, join, etc then handles the data to the users. Oracle is a multi 
        user database, millions of user can connect to the same database without any problem. User sends some SQL commands to the database and
        get some data from the server if they need. User sends the SQK cinnabd to the server then server takes the control then pushes the 
        statement to the PGA (PROGRAM OR PRIVATE GLOBAL AREA).

        PGA is a dedicated memory area for a single user. Each user has its own PGA. When our code is interpretting, our session specific data is 
        stored in PGA nad this PGA can only read by its owner.

        As i said before, every SQL tatement is executed with its execution plan. Execution plan are the ways or techniques of how our code to be
        executed. SO, before running your query, the execution plan of our SQL code needs to be created. At this time tuning issue starts.

        Because, the same SQL query can be executed by same user or many different users for many times, and generating the execution plan is
        the costly operation. So, the developers of ORACLE DB thought to tune this issue. Inorder to do that they store the execution plan in the
        shared SQL area.

        If someone wants to run the same SQL query again and again, instead of trying to create same execution plan again. The ORACLE servers 
        uses the shared SQL Area which stored the existing execution plan. It takes the plan from the SHARED SQL AREA and handle it to the 
        users PGA. This increase the performance.

        TWO IMPORTANT MEMORY AREAS IN ORACLE DATABASE : 
            1. PGA  -> PRIVATE OR PROGRAM GLOBAL AREA.
            2. SGA  -> SHARED OR SYSTEM GLOBAL AREA.

        WE CAN CALL THESE AS MEMORY CACHE.


        These are individually divided into smaller pieces used for different purpose. These cache areas are used to improving the performance.
        If some session use the same data again and again instead of writing the data into the disc and trying to get from the disc again and 
        again, you simply store it in some memory and return them that memory. Memory is much faster than the PHYSICAL DISC. This will increase 
        the performance.

        SGA     ->  is the memory which is shared by all the users.
        PGA     ->  is the memory which is shared by its own user alone. Each user has its own PGA.

        Private or session specific data is stored in PGA. The common or sharable data is stored in SGA. In these memory areas have some 
        sub-memory areas. We generally call them as CACHES. SGA is almost 80% bigger than PGA. SO, we store the huge amount of data in the SGA. But the 
        end, they are simple memory areas dedicated for different purposes.

        SO, to improve the performance ORACLE has many caches like BUFFER CACHE, LIBRARY CACHE, REDOLOG BUFFER, SHARED POOL, etc.

        


        SHARED POOL :

        ***     
        
        REFER ARCHITECTURE DIAGRAM location : 
        
        D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_3_Oracle_Database_Architecture\
        Ch_3_2_Oracle_Database_Architecture_Memory_Area.png
        
        ***

            DATA DICTIONARY CACHE : 
                example : select * from employees;

                When you run a select query, the database needs to know if there is any employees table in the database, or which column should
                I return when I use (*) keyword, etc.

                SO, the defenition of the tables are stored in this cache, and the server decides if our query is right or wrong by, making the
                check from the DATA DICTIONARY CACHE. The data in this memory area is read from the database tablespace, it means data dictionary
                views but inorder to increase the performance, they are copied here for faster access.

            
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





 */