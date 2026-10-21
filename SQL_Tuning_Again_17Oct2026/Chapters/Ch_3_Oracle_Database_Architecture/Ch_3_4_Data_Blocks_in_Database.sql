/* 

    ***     
        
        REFER ARCHITECTURE DIAGRAM location : 
        
        D:\VS Code 03-05-2025\VS CODE\SQL_Tuning_Course_Again\SQL_Tuning_Again_17Oct2026\Documents\Ch_3_Oracle_Database_Architecture\
        Ch_3_4_Databse_Data_Blocks.png
        
    ***

    All the Oracle data is stored in blocks for both disk and memory. Oracle does not store whole table in one block and return it from there 
    directly. A block is the smallesst unit of the database for storing the data. It is a logicalunit that consists of multiple opreating 
    system blocks.      A block can have a whole table or a couple rows of a table. Sometimes, block can have rows of different table when 
    multiple tables are clustered. A block has a specific size and cannot be extended directly. A block size 2KB to 32KB (DEFAULT 8KB). A
    block can store row data or index data.

    BLOCK HEADER INCLUDES : 
        1. Block type information contains whether it is a row blocks or index blocks
        2. Table information (Contains rows in it).
        3. Row Directory :
            Means addresses of an each row in this block. Because this is a logical block or memory and these blocks have specific addresses.
            We will call these addresses by ROWID. With this address we can directly go to this address of that row and read it easily.

            If the one row space does not have enough space, so now it will deleted from here and then written into the another big space area.
            When you creating the table, you can use PCTFREE and PCTUSE parameters to specify how much free space will be left in a block.

            You can change these free space size or you can say that do not leave any space, just use all the space. But if you don't leave ant 
            free space in a block, each update will most probably change the place of the row and this will decrease the performance.

                            
                                                    I/O means COST IN TUNING

        If there might be more than one table's rows in a block, it is not preferred. This can only occur if these tables are clustered.
        If the tables are not clustered, a block will probably have one table rows. REading a table row from one block will be faster than 
        reading multiple blocks.
        '

        When Oracle tries to find your row, it first find the block that your row is int, and then goes to the address of that row with using the 
        ROWID.
                            

 */