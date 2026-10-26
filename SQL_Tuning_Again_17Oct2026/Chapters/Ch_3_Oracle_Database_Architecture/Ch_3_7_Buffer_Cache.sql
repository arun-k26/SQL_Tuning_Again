/* 

    DATABASE BUFFER CACHE : 
        Buffer cache is the memory area that stores the data blocks in it for a short period of time. The reason to store the same data in the 
        buffer cache is to increase the performance. Because, we know memory is more faster than the disk and most of the time we query or 
        manipulate the same data over and over again. SO, inorder not to read the me data from the disk all the time, the database stores
        these data blocks in the buffer cache and read any time it needs from here faster. When you run a query, for example or perform an 
        update, etc the related data block is checked if it is in the buffer cache or not.


        IF NOT, IT READ FROM THE DISK AND WRITTEN IN BUFFER CACHE. AND AFTER THE RELATED OPERATION IS DONE ON THAT BLOCK, THAT BLOCK IS WRITTEN 
        INTO THE DISK AGAIN.

        So, the oracle uses the buffer cache for performance data concurrency and consistency.


        DAtabase buffer cache is the most largest area in the SGA. This memory area store the copies of the data blocks that are read from the 
        database disc. When the first user runs a query, the related data is read from the disc and stored into the buffer cache. So, when
        any other user or same user, wants to reach the same data, before checking the disc, the server checks the buffer cache first.

        If is already available in the buffer cache, it can read the data directly from the buffer cache itself. If some of the data is not there
        but some of the data is already in the buffer cache, it goes to the disc only for the absent blocks. If there is no related data with
        our query in the buffer cache, the server reads all the data from the disk into the buffer cache.


        WHY TO READ IN THE BUFFER CACHE ?

            It is much faster than the database disks. If you update a value in the table it will not directly goes to the database, first store 
            it in the buffer cache, when you commit then it writes the updated value to the database with the help of DATABASE WRITE PROCESS.
            

*/