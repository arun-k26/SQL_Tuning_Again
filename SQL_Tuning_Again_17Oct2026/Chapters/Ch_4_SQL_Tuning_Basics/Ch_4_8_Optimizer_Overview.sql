/* 

    REFER : D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_4_SQL_Tuning_Basics\Ch_4_8_Optimizer_Overview.png

    Optimizer creates the best execution plan for our query. After the query is parsedf it is hadnled to the optimizer. In optimizer, there 
    are 3 main components to operate our query :
        1. QUERY TRANSFORMER : It tranforms our query structure internally into a better one. There are many and standard ways to transform our query and oracle tries to find the best query that returns the same result but in a better performing way. SO, the qery to be executed may be completely different than yours. But, it returns the same result.

        2. ESTIMATOR : The optimizer optimizes our query by their cost. We will see cost in future lesson. A cost is the combination of CPU usage and the memory usage and the disk usage and memory usage of our query. It simply calculates the cost of reading the single block and multiplies  the result with the blocks to be read. But notice that, this is an estimated based on the statistics. Because, the real cost cannot be known without executing the statement. The estimator estimates the cost off the query that entered as an input and returns the estimated cost.

        3. PLAN GENERATOR : The plan generatore calculates various plans for our query by checking different access path, join methods and join orders. It generates a plan, handles it to the estimator to estimates its cost and creates another plan, and makes the estimator find its cost, and find another and makes the estimator estimates the cost and this goes on untill the correct possible execution plans are created.

    But we should remember, it must finds the best plan under a second. SO, since all the available execution plans and their cost are ready, the plan generator decides the one which has the lowest cost and passes that execution plan to the row source generator. ROW SOURCE GENERATOR is the last part for a query to have an execution plan. After this, it is stored in shared SQL AREA.

*/