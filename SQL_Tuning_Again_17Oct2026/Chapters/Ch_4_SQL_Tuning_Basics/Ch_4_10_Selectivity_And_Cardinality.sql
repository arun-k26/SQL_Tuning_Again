/* 

    Selectivity is important in most cases. It is really important in cost calculation, plan management, etc. Selectivity is the estimated proportion of the rows will return from our query based on the total rows of the table.

    FOR EXAMPLE : select * from sales where promo_id = 999;
        SALES TABLE         -> 817743 rows
        RESULTS HAS         -> 887837 rows
    
    Our entire table record has 9lakhs and the returning row count is about 8lakhs. SO, our query returns the very large scale of the records. So, this query is not selective since we get a very large scale of records.

        select * From sales where promo_id = 33;
    
    If we search promo_id = 33, it would be much more selective. Because, it has about 2000 ROWS returning from our query. So, the optimizer will most probably pick different execution plan for these two queries.

    AS we can see, even if we write the same statement, the selectivity of our query changes the execution plan. 

            FORMULA : 
                                        NUMBER OF ROWS RETURNING FROM THE QUERY
                    SELECTIVITITY   = -------------------------------------------
                                                TOTAL NUMEBR OF ROWS

    If it is close to 0 means it is selective. and it means it is a small portion of the table is called HIGH SELECTIVITY.
    If it is close to 1 means it is not selective. and it means it returns a big portion of the total rows, it is called as LOW SELECTIVITY.


            FORMULA : Cardinality   =   TOTAL NUMBER OF ROWS * SELECTIVITY

    Cardinality means, the expected number of rows returned from our query.


    WHY SELECTIVITY AND CARDINALITY IS MORE IMPORTANT :
        Selectivity affects the estimates in I/O cost. Based on the selectivity of our query, the estimator estimates the I/O cost of our execution. Selectivity affects the sort cost. If the returning row will be so many sort cost will be high. SO, it will be considered while creating on estimation plan.



    CARDINALITY is used to determine join, sort and filter cost. With using cardinality, the optimizer decides which join method to use, will filtering reduce the data while using an index.

                INCORRECT SELECTIVIT & CARDINALITY === INCORRECT PLAN COST ESTIMATION

    If the selectivity and cardinality incorrectly may be because of wrong or old statistics, the optimizer will be estimate the execution plan cost incorrectly. There is something important here. We learned selectivity and cardinality. BUt the databse cannot know how many rows will return from our query before reading it. SO it needs estimate ???


    HOW CAN IT ESTIMATE IT ???
        It has different technique to calculate it. Since, it cannot know the exact number of rows returned, it uses the number of distinct rows of the column in the where clause.

        FOR EXAMPLE : select * from sales where promo_id = 999;

        In this query to calculate the selectivity, the optimizer checks the distinct values of our columns. We know that, our sales tables has about 1crore records and the distinct values of promo_id are 4.

                SO, YOU CAN SEE THE DISTINCT VALUES BY SELECTING THE NUM_DISTINCT COLUMN FROM THE DBA_TAB_COLUMNS VIEW.
                select num_distinct from dba_tab_columns where table_name = 'SALES';

        So, since there are only 4 different values, that means we will have about a quater million records in the result set. SO, this query is not selective since we get a very large scale of records.

        Earlier time of this lecture, the number of rows returning based on these four distinct values are completely different. While 1 returns < 1% of the rows, the other returns almost all of the rows.

        SO this estimation is not so efficient. Because, since the optmizer cannot know the returning rows and it calculates based on distinct rows, there is a high possibility to selecta bad execution plan.

        So, we can guide optimizer to select a better one.

        select * from sales where cust_id = 100001;

        If we use the cust_id column in the where clause, it will be much more selective. Because, this column cust_id contains 7000 distinct rows

        SO selectivity =       1
                            -------
                              7059


        IMPORTANT NOTE : 
            The optimizer can notk now th exact number of rows thatwill return from the query before executing it. Because it may changes for 
            each value. Instead it knows the number of distinct values of te column used in the where clause. SO, it uses the 
                        1
                -------------------
                 num_distinct_rows

            approach to perform a selectivity estimation.


        Example 1:
            Refer query explain plan in personal laptop by executing it.

            explain plan for select * from hr.employees where to_char(hire_date,'RRRR') = '2008';

            OUTPUT : EXPLAINED


            select * from table(dbms_xplan.display());

            OUTPUT : Exepected rows showing as 1
            
            To calculate selectivity and cardinality by 

                select num_distinct_rows from dba_tab_columns where column_name = 'HIRE_DATE';
                OUTPUT : 99

                SELECT table_name, num_rows FROM all_tables WHERE owner = 'HR' and table_name = 'EMPLOYEES';
                OUTPUT : EMPLOYEES	108

                selectivity     =           1
                                    -------------------
                                    num_distinct_rows         
                
                Cardinality     = Selectivity * Total number of rows.

                

                selectivity     = 1 / 99                                        => 0.01010101010101010101010101010101   (HIGH SELECTIVITY)
                Cardinality     = 0.01010101010101010101010101010101 * 108      => 1.0909090909090909090909090909091    (Expected row = 1)

        

        THIS IS HOW CARDINALITY AND SELECTIVITY HAS BEEN CALCULATED.

*/