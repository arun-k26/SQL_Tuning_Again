/* 

    LIBRARY CACHE : 
        Shared SQL Area in the library cache including the SQL Statement process information in them. Library cache as the container of the 
        shared SQL area. It manages the size of these shared SQL areas, if somehow the memory is not enough for the shared areas may be because 
        of a small shared pool size or small SGA size, etc.

        SO, the library cache arranges the memory of the shared SQL area by deleting the mose unused one and creating a new one or maybe 
        increasing the size of them. In the shared pool area, there are other memory areas, they area not need to focus on that.


    DATABASE BUFFER CACHE : 
        Buffer cache is the memory area that stores the data blocks in it for a short period of time. The reason to store the same data in the 
        buffer cache is to increase the performance. Because, we know memory is more faster than the disk and most of the time we query or 
        manipulate the same data over and over again. SO, inorder not to read the me data from the disk all the time, the database stores
        these data blocks in the buffer cache and read any time it needs from here faster. When you run a query, for example or perform an 
        update, etc the related data block is checked if it is in the buffer cache or not.


        IF NOT, IT READ FROM THE DISK AND WRITTEN IN BUFFER CACHE. AND AFTER THE RELATED OPERATION IS DONE ON THAT BLOCK, THAT BLOCK IS WRITTEN 
        INTO THE DISK AGAIN.

        So, the oracle uses the buffer cache for performance data concurrency and consistency.


    REDO LOG BUFFER : 
        Redo log buffer keep the initial status of the changed values with some specific into about these values. With this way, the value can
        turn back to its initial status easily with the redo log data. This is extremely useful when something unexpected occurs like system 
        failure. You can easily turn back with using the redo log files.


    JAVA POOL :
        This is not important for our course. It contains the java classes that the database need to use and stream pool handles the stream.


    DATA FILES : 
        Actual data is stored here. All table, function, triggers, objects stored in here. The connection between the disk and memory areas are
        simply established by the database buffer cache and PGA.

        When you read data from the disk, this data is stored in the buffer cache for any kind of operations. And if you make any changes on the
        table or something, it is written into the database buffer cache first and then stored into the database disk when you commit them.

        PGA do not write anything to the disk directly.

    
    REDO LOG FILES :
        Redo log files is for the instant redo log operations. The redo log data in the redo log buffer is constantly stored in the redo log
        disk and deleted from the redo log buffer.

 */