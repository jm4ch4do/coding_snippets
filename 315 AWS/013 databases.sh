# ------------------------------------------------- RDS ----------------------------------------------
Relational Database Service (RDS)        # SQL databases managed by AWS (Postgres, MySQL, MariaDB, Oracle
                                         # Microsoft SQL Server, IBM DB2)
                                         # Storage managed by EBS, you can't ssh into your instances
Deployment-Options
- Read Replicas                          # Scale the read workload to up to 15 separate DBs that 
                                         # will constantly replicate the main one. Writing is only done to main DB.
- Multi-AZ                               # Replica in a different AZ to be used as failover in case main DB crashes.
                                         # You can only have one failover DB that will remain unactive until needed.
- Multi-Region                           # Replicated DBs are now on a different region.
                                         # Provides better disaster recovery and improves local performance.

# ----------------------------------------------- AURORA ---------------------------------------------
Aurora                                   # AWS propietary solution, storage grows automatically, cloud optimized.
                                         # Cost 20% more but speed is 5x for MySQL and 3x for Postgres
Aurora Serveless                         # Good for efficient but intermittent or unpredictable workloads
                                         # Paid per second, no need to provision service and no management.

# ------------------------------------------- ELASTIC-CACHE ------------------------------------------
# Provides managed Redis or Memcached DBs to be used as cache services on the side of your RDS. 
# Caches are in-memory databases with high performance and low latency.                                 
Elastic-Cache

# ---------------------------------------------- DYNAMO DB -------------------------------------------
# Fully managed and serverless NoSQL database that can scale to massive workloads.
# Single-digit milisecond latency - low latency retrieval. Low cost and auto scaling capabilities
# Stores data in a key/pair format similar to JSON but with typed attributes.
DynamoDB

DynamoDB Accelerator - DAX               # Fully managed in-memory cache for DynamoDB
                                         # 10x performance improvement so it's microseconds latency.

DynamoDB Global Tables                   # Make a DB accessible with low latency in multiple regions.
                                         # It supports 2-way replication. You can read/write in all DBs.








