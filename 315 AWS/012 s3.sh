# --------------------------------------------- S3 STORAGE -------------------------------------------
S3  # Simple Storage Service
    # Object storage (files, images, backups) but not applications or OS
    # Data remains even if EC2 is deleted, not instant access but optimized for large-scale


Usages
- Backup and Storage, Disaster Recovery, Archive
- Hybrid Cloud Storage, Media Hosting, Data lakes & big data analytics 
- Application Hosting, Software Delivery, Static Websites


Bucket               # is a directory in an S3, have an unique name globablly, is defined at region level
Object               # are the files we store
Key                  # full path to a file. Ex. s3://my-bucket/some-folder/another-folder/my-file.txt
                     #                                        |          prefix         | object_name |    
Value                # content of the file (Max size is 5TBs)


# -------------------------------------------- S3 SECURITY -------------------------------------------
User-Based 
- IAM Policies       # which api calls are allowed for an specific user from IAM

Resource-Based     
  * Bucket Policies  # bucket wide rules from the S3 console - allows cross account
  * ACL              # Object Access Control List (finer grain) and Bucket ACL (less common) 


S3 Bucket Policies (Mostly-used)
- JSON based
  * Resources: buckets and objects
  * Actions: Allow or Deny
  * Principal: account or user to apply policity to


# --------------------------------------------- VERSIONING -------------------------------------------
# When versioning is enabled for files, file updates create a new version instead of deleting old one
# so you can always restore files.



# ------------------------------------------- S3 REPLICATION -----------------------------------------
# maintains replication of files across regions (only works if versioning is enabled)
# you have to define one bucket as the source and one bucket as the target of the replication
CRR (Cross Region Replication) or SRR (Same Region Replication)

Use-Cases:
- CRR: Compliance, lower latency access, replication across accounts
- SRR: log aggregation, live replication between productions and test accounts


# ---------------------------------------- S3 STORAGE CLASSES ----------------------------------------
S3 Standard                                # 99.99% Availability, low latency, high throughput, sustain 2 concurrent facility features
                                           # Used for frequently accessed data, big data analytics, mobile and gaming, content distribution   
S3 Standard Infrequent-Access(IA)          # 99.9% Availability, lower Cost but cost per retrieval. Used for Disaster Recovery, backups.
S3 One Zone-Infrequent Access              # 99.5% Availability, Same usage as above but data is lost if AZ is destroyed. Use for secondary backup or storing data you can recreate.

GLACIER TYPES                              # Low cost meant for archiving/backup (price per storage and per retrieval)
S3 Glacier Instant Retrieval               # milisecond retrieval, great for data accessed once a quarter. Minimun storage duration of 90 days.
S3 Glacier Flexible Retrieval              # The delay to get the data can be: Expedite(1 to 5 minutes), Standard(3 to 5 hours), Bulk which is free(5 to 12 hours). Minimun storage duration is also 90 days.
S3 Glacier Deep Archive                    # Same but Standard (12 hours) and Bulk (48 hours) and minimun storage duration of 180 days.   

S3 Intelligent Tiering                     # Moves between classes based on usage. No retrieval charges.    



# ------------------------------------------------ NOTES ---------------------------------------------
# By default S3 uses server-side encryption but can be configured to use client side.

# IAM Access Analyzer for S3 reviews all of the policies configured for buckets and 
# provides a summary highlight possible security risks. It covers all policies and ACLs


# --------------------------------------------- SNOWBALL ---------------------------------------------
# If you need to migrate huge files in the order of Petabytes, then amazon can send you a portable device
# where you can copy your data locally, then ship it back to amazon for they to upload into the cloud.
Snowball Edge Storage Optimized 

# The other use case is that you need to collect data on the edge, meaning on a distant location like a
# mining site, underground, ship at sea or similar. You can run EC2s or lambda function on this devices
# pre-process data and then send it to AWS.
Snowball Edge Compute Optimized


# ------------------------------------------ STORAGE GATEWAY -----------------------------------------
# Is a bridge between on-premise data and cloud data in S3 (They use different storage protocols)
# Use cases: disaster recovery, backup & restore, tiered storage.

