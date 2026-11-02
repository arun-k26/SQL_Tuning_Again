/* 

    The first step of performance tuning for the developer is, designing the schema effectively. If we create our table, index, constraints, 
    etc in a badway you will have a somuch problems and there will be hundred of queries that you will need to tune in-time. So, if you 
    design your schema well, you will have tuned maybe hundred of queries without tuning them.


    1. Select the datatypes very carefully while creating or modifying the tables.
        If your column length us 100 means Oracle won't use the entire 100 size. Oracle handles this very clearly. If the variable length is 
        100 but the actual length is 3 means it will consume only 3 bytes.

        This is valid for many other datatypes like number, long, clob, etc. But ofcourse, some of them are fixed size datatypes like CHAR.
        So while using these you need to be carefull. If you specified size is more than your needed size you will face a data-consistency
        problem.
    

    2. Select exactl the same datatype between the parent and child key.
        FOR Example : employees.dept_id     : NUMBER
                      department.dept_id    : NUMBER
            In both the table use the same datatyp. The main reason of this is , if you join these two tables. Oracle will try to convert one
            datatype to annother for all the rows. It use the somuch CPU usage and decrease the performance.

            We should use the realated datatype for all the columns. We should use the VARCHAR2 for all column like chare, Number, dates etc.
            This decreases the primary and child key value of this.

    
    ENFORCE AND INTEGRITY :
        When you run your query, Oracle reads ab execution plan to execute your query. This execution plan is created considering the connection
        pf each table datatypes, etc. SO, If we don't create the primary key and foreign key properly on the queries on these table will have some 
        performace issues.

        And if you won't create some check constraints for the columns, you will most probably have the same data many times in the same table.
        This is not good for businees and harware usage, & will also decrease the reduncy problem and have a  better  performance.



    3. NORMALIZATION :
        If we create the tables fowllowed by the NORMALIZATION RUSES, you will most probably handle the data reduncy problem and have a 
        better performance.

        Because, if you divide the tables with theie resposibilities, you will have a smaller table. SO, the maintenance of these tables will
        be easier and the join operations will be faster because of joining with the smaller table instead of the huge table.

    
    4. SELECT RIGHT TABLE :
        We are using the basic and most commonly used HEAP-ORGANIXED TABLE.
        There are different types of table in Oracle database : 
            1. Index clustered table
            2. Heap clustered table
            3. Hash clustered table
            4. Index Oraganized table
            5. External tables.

        So, if we ise the right table type, we will have much faster better performance on your queries.


    5. CREATING CLUSTERS : 
        If you joining the same table again and again, tou can cluster them. In further lectures  we will see about clustere. But 
        clustering the commonly joined tables will increasE THE PERFORMANCE.

    
    6. UES INDEXES OFTEN ANDSELECT THE INDEX TYPE CAREFULLY :
        The most useful way of performance increase is using indexes. IN further lession but also creating the index has also same cost.

        
    7. CREATE INDEX ORIGRATION TABLE : 
        We will see details in further lectures. Now, index-organized table is a table stored in an index.  

*/ 