/* 

    UNDO :

        When a transaction modifies any data, the database server copies the original data from the disk and store them into the memory before
        modifying it. THe original copy of the related data is called as UNDO DATA.

        The another copy of trhe related data is also written into the buffer cache and all the changes are done in these blocks. SO, undo data
        kept as unchanged. IF you want to rollback your changes, or if your changes needed to be rollbacked because of system failure, the 
        undo blocks are used to rollbacks.

        When we make changes to the table only we can see them untill commit. IF the other user sees the same table what you have been modified
        without commit, the user user can not see the modified data because still you did not commit those changes. so, those modified data 
        can be visible to you session only because it was done in your session only. SO if the other user also see means you should commit
        those changes. and you can visible those uncommited changes for only some time, after that it goes to normal orginal data.


        Ig you update a row that another user is still reading, it is better to send the old value to the user. SO, the undo data is stored 
        for a while to provide that. WE can see the undo in undo segments.

                BLOCK > EXTENTS > SEGMENT > TABLESPACE

        Block       -> It is the smallest logical group of data in memory or disk.
        Extent      -> Extent is greater than block
        Segment     -> Segment is the larger memory area with group of extents.
        Tablespace  -> Tablespace is the largest memory area including group of segments.

*/