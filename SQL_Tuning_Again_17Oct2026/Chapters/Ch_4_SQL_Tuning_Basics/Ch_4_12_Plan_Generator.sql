/* 

    The plan generator plans various plans and makes the estimator calculates the estimated cost of them. THen, based on the cost of the 
    generated execution plans, it picks the best performing plans and passes that plan to the row-source generator.

    It generates the plans based on trying differenet access plaths, join methods and join orders.


    EXAMPLE :
        select e.f_name, e.l_name, e.dept_name from employees e, departments d where e.dept_id = d.dept_id;

        JOIN ORDER[1] :: Departments[D]#0   Employees[E]#1
        NL COST    = 42.25
        SM COST    = 8.45
        HA COST    = 5.2
        BEST JOIN METHOD    = HASH

        JOIN ORDER[1] :: Employees[E]#0     Departments[D]#1
        NL COST    = 88.28
        SM COST    = 7.75
        HA COST    = 5.5

        Depratment table    = DRIVING TABLE

        Driving table means while joining two table, the server first picks rows from the driving table and joins that rows with the other table
        related rows. MOst of the time, if it select the driving table as smaller table, it finds a better cost. But it is not true for all the
        times. So, it needs to try other plans too.

        But the important thing is, the join order is important for performance for most cases. 
            NL  = NESTED LOOP JOIN
            SM  = SORT MERGE JOIN
            HA  = HASH JOIN

        After finding the cost of these join methods it picks the best one which has the best low cost. That is best execution plans.

*/