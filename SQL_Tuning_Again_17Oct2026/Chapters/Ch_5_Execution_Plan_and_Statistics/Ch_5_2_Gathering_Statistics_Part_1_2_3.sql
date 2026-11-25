/* 

    For a better execution plan creation, the optimizer need to have up-to-date statistics. SOmetimes statistics may have realistics. Actually,
    the database server generates the statistics continuously. It is an costly operation to do. So, it does not generate completely all the 
    time.

    If statistics are not generate due to CPU load, changed table structure, sudden volume of data, etc. The statistics can be unrealistics.

                UNREALISTIC STATISTICS      === OLD OR AGED STATISTICS
    
    2 TYPES OF STATISTICS : 
        1. SYSTEM STATISTICS : 
            System statistics are used by the query optimizer to estimate I/O and CPU cost of our query. By checking the system statistics, the
            optimizer can generate a better execution plan. System statistics may not generate repeated and automatically. It will generate
            system statistics manually due to hardware change or CPU add on this kind of tyhings changes affect the performance of I/O and 
            CPU. Also workload of the database also affects the system statistics. Refresh the system statistics during the normal workload
            and should be generate normally.

            SYNTAX : exec dbms_stats.gather_System_stats('START');

            TO ANALYZE SYSTEM STATISTICS :
                select * from sys.aux_stats$;


        2. Optimizer Statistics : 
            Once the system statistics are uptodate then only generating optimizer statistics will work good and effectively. The optimizer 
            statistics are the collection of the statistics for the database objects like tables, columns, indexes, etc. We can gather 
            statistics automatically and manually. It is very costly operations because it will need to gather all the tables, columns,
            indexes, etc. If our gather stats are running in LIVE DB on that time, if user comes and do some interaction means this will stop
            the gather_stats work immediately. We can run this gather stats in a scheduled time and if you schedule a time at 2.00 am to 
            5.00 am between this time you scheduled your statistics means it will update on that time after that only u go and change the 
            structure of the table means next morning itself it will run the on the old_statistics.

            2 ways to do statistics : 
                1. ANALYZE TABLE <TABLE_NAME> COMPUTE STATISTICS.
                    This is an old method and now no one is recommending this method.
                
                2. DBMS_STATS PACKAGE : 
                    1. GATHER_DATABASE_STATS
                        This consumes a lot of time to finish becuase this will gather statistics for entire database.
                
                        SYNTAX : exec dbms_stats.gather_database_stats;

                    2. gather_dictionary_stats 
                        This and previous one will not recommended in the work hours. 
                        SYNTAX : exec dbms_stats.gather_dictionary_stats;

                    3. gather_schema_stats :
                        SYNTAX : exec dbms_stats.gather_schema_stats(own_name => 'SH');

                    4. gather_table_stats 
                        SYNTAX : exec dbms_stats.gather_table_stats(own_name => 'SH', tab_name => 'SALES', cascade => true);
                        CASCADE => true means if you set cascade to true it generate statistics for all the indexes of the table.
                    5. gather_indexes_stats :
                        This is for particular index only. 

            
            HOW CAN WE SEE THE OPTIMIZER STATISTICS : 
                1. dba_tables                       2. dba_tab_statistics
                3. dba_tab_col_statistics           4. dba_indexes
                5. dba_clusters                     6. dba_tab_partitions
                7. dba_ind_partitions               8. dba_part_col_statistics

                1. all_tables                       2. all_tab_statistics
                3. all_tab_col_statistics           4. all_indexes
                5. all_clusters                     6. all_tab_partitions
                7. all_ind_partitions               8. all_part_col_statistics

                1. user_tables                       2. user_tab_statistics
                3. user_tab_col_statistics           4. user_indexes
                5. user_clusters                     6. user_tab_partitions
                7. user_ind_partitions               8. user_part_col_statistics

*/