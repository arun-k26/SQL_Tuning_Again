/* 

    We know that Optimizer decides the best execution plan based on the cost of different plans. So, the cost is
    important.

    Cost is the optimizer's best estimate of the number of I/O to execute a statement. A cost unit means reading a single block.

    FOr example :
        If a plan cost 1000 means our query need to read 1000 single unit of block to execute our query. But this is an estimation. 
        Cost is calculated with a better formula. While the query estimator estimates the cost it uses the DISK I/O, CPU Usage and memory 
        usage together.

        Cost  =     (Single block I/O Cost) + (Multiblock I/O COst) + (CPU Cost)
                    ------------------------------------------------------------
                                    Single block read time  

        
        Single block I/O Cost       = Number of single block read * Single block read time

        Multi block I/O Cost        = Number of multiblock read time * Multiblock read time

        CPU Cost                    = Number of CPU Cycle   / CPU Speed


        You should not think that, cost meand only reading the data from the disk. Ofcourse, reading from disk is really much more costly than 
        the others. Reading from the memory and CPU Usage is also considered in cost calculation.

        Cost is calculated based on the statistics. So FOR A BETTER COST CALCULATION and BETTER EXECUTION PLAN, UP-TO-DATE STATISTICS ARE
        IMPORTANT.

*/