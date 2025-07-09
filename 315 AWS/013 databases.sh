# ------------------------------------------------- SQL ----------------------------------------------
# RDS is a general purpose relational database focused on PLTP (Online Transaction Processing).
# Use Case: web apps, CRMs or mobile apps.
Relational_Database_Service(RDS)        # SQL databases managed by AWS (Postgres, MySQL, MariaDB, Oracle
                                         # Microsoft SQL Server, IBM DB2)
                                         # Storage managed by EBS, you can't ssh into your instances
                                         # Performance is optimized for fast write/read and small transactions.
- Deployment-Options
  * Read Replicas                        # Scale the read workload to up to 15 separate DBs that 
                                         # will constantly replicate the main one. Writing is only done to main DB.
  * Multi-AZ                             # Replica in a different AZ to be used as failover in case main DB crashes.
                                         # You can only have one failover DB that will remain unactive until needed.
  * Multi-Region                         # Replicated DBs are now on a different region.
                                         # Provides better disaster recovery and improves local performance.

Aurora                                   # AWS propietary solution, storage grows automatically, cloud optimized.
                                         # Cost 20% more but speed is 5x for MySQL and 3x for Postgres
Aurora_Serveless                         # Good for efficient but intermittent or unpredictable workloads
                                         # Paid per second, no need to provision service and no management.

Elastic-Cache                            # Managed Redis or Memcached DBs to be used as cache services on the side of your RDS. 
                                         # Caches are in-memory databases with high performance and low latency.                                 


# ----------------------------------------------- NON-SQL --------------------------------------------
DynamoDB                                 # Fully managed and serverless NoSQL database that can scale to massive workloads.
                                         # Single-digit milisecond latency - low latency retrieval. Low cost and auto scaling capabilities
                                         # Stores data in a key/pair format similar to JSON but with typed attributes.

DynamoDB Global Tables                   # Make a DB accessible with low latency in multiple regions.
                                         # It supports 2-way replication. You can read/write in all DBs.

DynamoDB Accelerator - DAX               # Fully managed in-memory cache for DynamoDB
                                         # 10x performance improvement so it's microseconds latency.

DocumentDB                               # AWS propietary No-SQL solution, not fully compatible with mongoDB 
                                         # but close and fully integrates with Amazon.


# ----------------------------------------------- REDSHIFT -------------------------------------------
# DB based on Postgres focused on OLAP (Online Analytical Processing) optimized for analytics, warehousing and reporting over large datasets.
# Performance is optimized for fast reads and aggregations accross huge amounts of data.
# Columnar storage of data (instead of row based). It integrates with BI tools such as AWS Quicksight or Tableau.
# Use case: running complex queries on large datasets: business intelligence, dashboards, big data reporting.
RedShift                                 # Pay as you go based on the instances you provision

RedShift_Serverless                      # Auto provisions and scales. Pay only for what you use.      


# ------------------------------------------------- EMR ----------------------------------------------
# EMR takes care of provisioning, configuration and auto-scaling of Hadoop clusters to analyze vast amount of data.
# Clusters are composed of 100s of EC2s. Also supports Apache Spark, HBase, Presto, Flink
# Data is expected to be semi-structured or unstructured (logs, JSON, CSV)
# Use cases: data processing, machine learning, web indexing, big data
Elastic MapReduce (EMR)


# ----------------------------------------------- OTHERS ---------------------------------------------
Athena                    # Serverless query service to perform analytics against S3 objects. Uses SQL to query.
Quicksight                # Creates interactive dashboards. Serverless machine learning-powered BI. Integrates with RDS, Aurora, Athena, Redshift, S3
Neptune                   # Fully managed graph database for highly connected datasets with billions of relations (for example a social network)
Timestream                # Time Series Database (data evolving in time). Fully managed, fast, scalable, serveless.
Amazon Managed Blockchain # Multiple parties can execute transactions without a need for a trusted central authority. Compatible with frameworks Ethereum and hyperledger Fabric.
Glue                      # Managed ETL Service (Extract, Transform, Load)
DMS Migration Service     # Database Migration Service