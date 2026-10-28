/* 

    Control files           : It stores the physical strcucture information of the database without them, you cannot access to the database.

    Data files              : It stores the actual data of our database. (Table, Procedure, Aplication data, ....) stored in the files.

    Online Redolog files    : The redolog entries are stored from the buffer cache to the online redolog files. These files are for the 
                              recovery of the database if any system crash occurs. This guarantees to prevent any data loss in the database.

    Archived Redolog files  : The online redolog files should be fast, so it must be ligthweight and mostly empty for the new entries. To do that
                              data in the online redolog files to provide more space in the online redolog files.

    Backup files            : It is used for database recovery. USed for disaster recovery. MOst time companies create one or more backup disc
                              for the actual data. The exact copy of our data files are stored in these disks. This is used for disaster 
                              recovery.

    Parameter file          : It has database parameters.

    Password file           : It contains the password of the admin users like sysdba, sysopr, sysasm

    Alert log and Trace log : It stores the log of messages and errors occurs in the database. Trace files stores the error trace information 
                              of the process. 

*/