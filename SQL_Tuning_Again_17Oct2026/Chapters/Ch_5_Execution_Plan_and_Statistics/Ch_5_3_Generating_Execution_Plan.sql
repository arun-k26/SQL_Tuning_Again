/* 

    TO ANALYZE AN EXPLAIN PLAN : 
        1. Explain Plan 
            You need to create a new explain plan for the specific query.

        2. AUTOTRACE : 
            You can run that code and save the actual execution plan.

        3.V$SQL_PLAN : 
            You can query from the library cache, if there are any similar queries executed before.
        
        As we all know, the optimizer creates an execution plan based on the statistics. It has not yet executed the query, but it tries to 
        find the best way of executing query. We call this as explain plan.

        SYNTAX : 
            explain plan for <SELECT>;
            select * from table(dbms_xplan.display());

        This generates the explain_plan and saves the result into a table called plan_table. The plan_table is the global temperory table to 
        store the output of the explain plan created by the explain plan command.

        In explain plan, I said that when you run the query, a hasg value is created for it and stored that hash value and the execution plan
        as a key value pair in the library cache. So, even if we have not run the query yet, the optimizer creates a hash value for that and
        match it with our execution plan. If we execute the hash value instead of our query in full text, this hash value will be stored as the
        key in the sjhared SQL Area.



        explain plan set statement_id = 'MyID' for select * from employees where employee_id = '100';   -- FIND YOU EXPLAIN PLAN IN PLAN TABLE USING STATEMENT_ID

        explain plan set statement_id = 'MyID' for select * from employees where employee_id = '100';   -- WE CAN CREATE A CUSTOMIZED PLAN FOR US

*/