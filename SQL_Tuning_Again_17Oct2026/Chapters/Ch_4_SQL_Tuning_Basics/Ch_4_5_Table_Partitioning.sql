ALTER TABLE hr.EMPLOYEES MODIFY
PARTITION BY RANGE (HIRE_DATE)          
INTERVAL (NUMTOYMINTERVAL(1, 'YEAR'))       -- per year it will create an partition for that year data
STORE IN (USERS)                            -- tablespace name
(
    PARTITION P_BEFORE_2001
        VALUES LESS THAN (DATE '2001-01-01'),

    PARTITION P_2002
        VALUES LESS THAN (DATE '2002-01-01'),

    PARTITION P_2003
        VALUES LESS THAN (DATE '2003-01-01'),

    PARTITION P_2004
        VALUES LESS THAN (DATE '2004-01-01')
)
ONLINE
UPDATE INDEXES;



/* 

    WHAT IS PARTITIONING ? 
        When we run the query, Oracle first checks if it is in the result cache. If it is not there, then its the time to get it from the
        memory. Now it needs the proper execution plan. First, it checks the shared SQL area for a similar execution plan.
        If not it creates a new execution plan.

        Since, we have the execution plan now, it first checks the buffer cache if there is ant data related with this query or not.

        NOTE : DATABLOCKS are stored in the database data files (DISK). Copies of these datablocks are stored in the database buffer cache (RAM).
        
        If not, it go to the disk. The parition nbow comes to play its part.alter

        BEFORE PARTITIONING, HOW DATA IS READ FROM THE DISK :
            As we know, our table data is stored in the blocks, when the server goes to the disk it has many different methods of reading from
            the disk.

            Most of the times, it reads all the blocks of a table to find some data. If the table is large this operation becomes very costly
            to perform. Even if you create an index. Sometimes, this will not work. Because, as you might know, indexes go to the rows by
            their ROWID.

            But when you search a range of data, indexes will not work so efficient. Because data will be in many different blocks and for 
            each block and row, the server will search the index for each row and go to the differenet block for them.

            So, this is a very costly operation and the database server will not do that. Instead it try to read all the blocks of the table
            and this will be very costly too.

            FOR EXAMPLE : 
                If you had an index in the hire_date column of the employees table and if you search for a single hire_date, it will work
                with the indexes well. But if your query the employees who hire_date between the range of dates , it will not work.
                Instead, it will read all the table and then filter by dates.

                If your query is pretty big, you may get this result in minutes or hours.

                                    ****************************THIS IS NOT GOOD*********************************
                
                So, to reduce the performance of the range searches, Oracle published a feture called as "TABLE PARTITIONING". PArttition means
                dividing a table into smaller table.

            FOR EXAMPLE : 
                We can divide our table into smaller partitions based on the hire_date columns.

        BENEFITS OF PARTITIONING is , If your query searches for a significant data which stored in one partition, the server will not search all
        the data of that table. Instead, it will read only one partition. Imagine you have 100 partitions, you data present in one partition, 
        so it will search the particular partition, this is 100 times faster than searching the entire table.

        There are different benefits of partitioning other than performance. Backup or recover a single paritition, or you can use parallel 
        execution.

 */