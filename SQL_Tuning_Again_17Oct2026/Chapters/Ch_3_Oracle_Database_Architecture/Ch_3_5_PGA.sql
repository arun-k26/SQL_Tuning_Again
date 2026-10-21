/* 

    ***     
        
        REFER ARCHITECTURE DIAGRAM location : 
        
        D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_3_Oracle_Database_Architecture\
        Ch_3_5_PGA.png
        
    ***

    It is a memory area that contains a couple sub-areas in it. PGA is a private memry area for each users. No others can see or access other 
    PGA.

    SESSION MEMORY AREA : 
        When the user connects to the databse creates a session for that user.
        This session information is stored in this area. This area stores the session variables, login information, session status. SO, you 
        need to close all the connections when you are done with them.

    
    PRIVATE SQL AREA : 
        1. PERSISTENT AREA : 
            It contains the bind variable values of a cursor. We know that each query turned to a cursor in the database. Either you create an
            explicit or implicit cursor. SO, the bind variables used in cirsors, are stired in here and released when the cursor is closed.
        
        2. RUNTIME AREA : 
            This area stores the information of the cursor.

    SQL WORK AREA : 
        This area is used to operate the data returns from the disck. The data is read from the disk its memory order.

        1. SORT AREA : 
            The data read from the disk are sorted because of order by, group by roll ups or window commands of our queries.
        
        HASH JOIN AREA, BITMAP CREATE AREA, BITMAP CREATE AREA these will seee in the future. All the session specific operations are stored in
        PGA. Ifyou assign less memoty for PGA it will decrease the performance and if you assign more memory for PGA and this will increase the 
        performance.


 */