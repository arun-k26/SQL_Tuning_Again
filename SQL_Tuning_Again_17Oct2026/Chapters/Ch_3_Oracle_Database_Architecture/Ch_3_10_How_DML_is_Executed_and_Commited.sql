/* 

    In this course we not only tuning the select query, we tune the DML also which includes INSERT, UPDATE, DELETE.

    When we run a DML code, the server checks the shared SQL area in the library cache to find if there are any similar SQL statements are 
    there. If yes, there is no need to parse the same query.

    And then checks the data dictionary cache if the related table infor is there, then there is no need to get the previlages or definition
    of the related tables. If there are not in the library cache and dictionary cache, these are returned from the disc and written into these
    areas.

    So, when these data is ready, it first check if the query is valid or true. Then it cjecks the buffer cache of the related data and undo
    segments.

    As we know already even if we do DML operation, it first write to the buffer cache first. This is valid for the both querying and running a 
    DML operation. If the data that needs to be modified is not in the buffer cache, the server fetches these data from the disk and write them
    to the buffer cache.

    After being sure, that the related data in the buffer cache, it locks the related block for the other user. So, no one cannot change these
    blocks until you commit / rollback.

    All of your changes are written into the related blocks in the buffer cache. These changed blocks are called as DIRTY BLOCKS. Besides all 
    the related redo log data is written into related redolog buffer before the changes are done in the buffer cache. They are called as 
    WRITE-AHEAD LOGGING. Redologs are created before the modification for the data consistency.

    When the redologs are created and the changes are applied to the data buffer, the server returns the number of affected rows to the user.

    But the user can continue modifying the data in its transaction, if the new modifications are in the same block, they are done in the 
    buffer cache. If new data needed, they are fetched from the disk and the same process is done for the new one.



    WHEN THE USER COMMITS : 

        The redolog buffer assigs a system chain number (SCN) to the changes while writing them to the redolog files. 
        A system chain number (SCN) is a unique number including the timestamp of the data. So, server creates a commit record in the current
        system change number in the redolog buffer. Then, the log writter process starts writing all the redo buffer entries created upto
        now about the related operations including the just createed commit record to the redolog files, then deletes from the redolog buffer.

        Then, the database writter process writes the dirty blocks to the disk and teh server unlocks the related blocks for the other users.

        After completing all these, the server returns the feedback to the user about the completion of the transaction. This entire process
        is happening to the every DML Operations

*/