# ---------- DATA SOURCES ----------
Data documents

    Data Sets: Logical Groupings of Data
    Data Bases: Normally structure data that can be quickly accessed and queried
    Data Stores: Store unstructured or semi-structured data
    Data Warehouses: store structured or semi-structured data for creating reports or analytics
    
Data Structures
    Structured - can be easilly browsed or searched
                 uses rows and columns
                 The classic example is a relational database, also excel files
            
    Semi-structured - same but with limitations
                      The classic example are JSON files, also log files
        
    Unstructured - unorganize data
                 - audio and video files
        
        
Data Processing Solutions
    Transactional processing: Transactions are a series of consecutive action
                              that must be executed in order and if one fails they
                              are all reverted.
    
    Analytical processing: Designed to capture raw data and generate useful insights
                           to help make business decisions. For example, find trends.

    Data Ingestion
    Data Transformation
    Data Querying
    Data Visualization

Data Storage
    Relational Databases: concurrent users, concurrent tasks, uses locks
        - transactional workloads always use relational databases
        - ACID: Atomicity. Every transaction is a single unit.
                Consistency. All data will be consistent and valid.
                Isolation. All transactions are independent.
                Durability. Every transactions commited will remain committed no matter what.
    
    Non Relational Databases (use documents instead of records)
        - Analytical workloads
        - typically for read only systems
        - Used for data analysis and decision-making
        - Analytics are obtained by aggregating the raw data into summaries ans trends
        - Information is usually transactional when is being created and analytical
          when it becomes historical data
            
            
Data Processing
    Batch Data: For example, counting cellphone monthly usage to compute cost to client
        - Is the process of buffering the data
        - And then Process Data in groups
        - Ideal for large workloads
        - Schedule for processing collections of data
        - USE IT WHEN you have large amounts of data or tasks are schedule-dependent
        
        Advantages:
            - Run during low system usage
            - Faster execution of repetitive tasks (no interaction needed)
            - Triggered conditionally
            
        Disadvantages:
            - Results only shown on completion
            - Data errors can end processing of entire batch
            - Process takes hours to complete

    Stream Data Processing: 
        - Real-time data processing
        - Data is constantly generated at high rate in small packets
        - Example is Netflix where to consume data and Netflix produces to send to you
        
        Usages:
            - Track website usage stats live
            - Detect fraudulent activities on credit cards
            - Display live stock trade information
            - Report to log files
            - Download Netflix while you watch so there is no pause in video playing
            - Basically is used for streaming data or real time analytics on data
            
        Example use: Taxi fare data -> event hub -> stream analytics -> Cosmos DB (No-SQL) -> Power BI
            
        Advantages:
            - Real-time data processing
            - Time critical operations
            - Real Time Analytics

        Disadvantages:
            - More expensive than batch processing
            - Issue may emerge when archiving and securing huge amounts of data
            - Maintaining order may be difficult




























