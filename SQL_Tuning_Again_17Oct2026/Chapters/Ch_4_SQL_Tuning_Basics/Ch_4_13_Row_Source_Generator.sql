/* 

    You can think the row source generator are the next steo of the plan generator. Once the plan generator generates the optimum plan, it 
    handles that to the row source generator. As we know, the plan generator simply decides how to join two tables, how to acces the table or
    the index and what join methods to be applied.

    The row source generator is a component of Oracle's execution engine preparation process. It's job is to takes the execution plan selected
    by the optimizer and convert it into n executable from that Oracle can use to retrive or modify data. 

    A row source is an optimization that produces rows for another operation. Each operation in the execution plan acts as a row source. The
    output of one operation becomes the input for another operation.

    PLAN GENERATOR  ->  Explores possible execution plans.

    ROW SOURCE GENERATOR    ->  Converts the chosen plan into an executable represention.

        I
        |
        -----> O    => I
            |
            -----> O    => I
                |
                -----> O

                I = Input
                O = Output
*/              