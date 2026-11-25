/* 

    Execution plan is the way that the DBserver executes our queries. Based on some statistics, the optimizer creates an execution plan and that
    plan is executed step by step by the server and the result is retrieved to us in this way.

    The optimizer decides every step one by one. We know that, every step is ordered and the result of a step will be the source of the next
    step. We know that, the execution plan is the way of execution 


    WHAT IS EXPLAIN PLAN ? 
        We will see explain plan term in tuning area. Explain plan is the explanation of the execution plan. This plan explains us how will the 
        database server executes our query. Bot explain plan and execution plan means the way of execution. However, explain plan is the plan
        of execution before the execution. I mean, output of the optimizer is explain plan. It can also be called as execution plan.

        Explain plan and actual execution plan may vary.

        EXPLAIN PLAN : 
            Without executing the select query. Oracle does not execute the select statement to retrive the employee records.
            Oracle uses the statistics to estimates the number of rows that will be returned and chooses an execution plan.

        EXECUTION PLAN : When you executes the select query
            Oracle executes the query using a chosen execution plan and retrives the actual employee records. If you collect runtime statistics,
            you can see how many rows Oracle actually processed and compares them with the estimated rows. Oracle generates an execution plan
            before executing the query. The same plan can be viewed before execution using EXPLAIN_PLAN. or after execution using 
            DBMS_XPLAN.DISPLAY_CURSOR

            THE ONLY DIFFERENCE IS THE EXPLAIN PLAN SHOWS AN ESTIMATED PLAN BASED ON STATISTICS.

            WHILE DISPLAY_CURSOR CAN SHOW THE ACTUAL PLAN USED BY THE EXECUTED SQL STATEMENT.

*/