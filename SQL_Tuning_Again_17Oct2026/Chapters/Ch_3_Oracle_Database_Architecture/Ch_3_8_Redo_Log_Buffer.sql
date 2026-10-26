/* 

    Oracle handles the data loss. So, it took some actions on it. One of those actions is creating redo log files.

    WHAT IS REDO LOG AND WHY WE USE IT ?
        When we make a change on the table data by an insert, update, create, alter, drop funtions, the oracle server create redolog entries 
        about that changes. Redo log entries contains the information about the changes to the database. We can simple say that, it has the 
        changes made to the database with many details. Oracle stores redo records temporarily in the Redo Log Buffer and writes them to the
        online Redo Log Files on disk.

        If a database crash occurs, Oracle uses redo information to recover changes, including committed transactions whose modified
        data blocks may not yet have been written to the data files. 

        BUFFER CACHE -> contains the actual modified database blocks.

        Redo Log Buffer -> contains redo entries that record database changes and help Oracle reapply those changes during recovery.

*/