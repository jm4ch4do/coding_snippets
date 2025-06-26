# ------------------------------------------- EC2 BASICS --------------------------------------------

# --- AWS services
EC2                           # Elastic Compute Cloud, provides infrastructure as a service
EBS (Elastic Block Store)     # Storage volumes for EC2 (like hard drive)
ELB (Elastic Load Balancer)   # Distributes traffic to EC2s for high availability
ASG (Auto Scaling Group)      # Automatically scales EC2 instances based on demand

EC2 user data  # root user custom script that runs on creation to make updates, install software or apps


# ---------------------------------------- INSTANCE SELECTION ---------------------------------------
m5.2xlarge
m  # instance class           - m is general purpose instance, good for web servers or code repos
   #                           (good balance between compute, memory, networking, consistent performance)
   #                          - t is also general purpose but burstable (peaks of requests like websites)
   #                          - c compute optimized (machine learning, gaming servers, batch processing workloads)
   #                          - r ram performance for large datasets in memory (dbs, web caches, business inteligence)
   #                          - i,d storage optimized (dbs, cache, warehousing, distributed file systems)
5  # generation of instance   - 5th generation
2xlarge  # size within instance class


# ------------------------------------------ SECURITY GROUPS ----------------------------------------
# --- Security Groups
# are firewalls placed on EC2 instances. Rules apply per ip or per another security group.
# You can enable EC2 that are part of a given sec group to access your EC2.
# they live outside of the EC2 so if it blocks access, EC2 will not see it. 
# One EC2 can be associated to multiple security groups (most permissive rule is applied). 
# Is good to maintain one sec group for ssh access. By default all inbound traffic is blocked and outbound traffic is authorised.
# When security groups blocks, you'll see a time out. When application blocks you'll see a connection refused.
# Commonly used ports in Security Groups
22 - SSH                       # log into instance
21 - FTP                       # upload files into large share
22 - SFTP                      # uploads files using SSH
80 - HTTP                      # access unsecured websites
443 - HTTPS                    # access secured websites
3389 - RDP                     # remote desktop to windows instance


# ----------------------------------------- RESERVED INSTANCES --------------------------------------
On-Demand Instances            # this are the regular ones, you pay by second
Reserved (1 & 3 years)         # long workloads, specific instance type, region, and OS. 72% discount.
Savings Plans (1 & 3 years)    # long workloads, free to change specifics. 66% discount
Spot Instances                 # short workload, instance may be terminated by AWS. 90% discount
Dedicated Hosts (on demand or reserved)  # book an entire physical server, control instance placement (most expensive)
Dedicated Instances            # no other customer will share your hardware but may share hardware with other instances in same account.
Capacity Reservations          # reserve capacity in a specific AZ for any duration. Pay same on-demand fees but you guarantee you'll always have availavility.


# ------------------------------------------------ AMI -----------------------------------------------
AMI                            # Amazon Machine Image. Customization of an EC2 instance. 
                               # You can create an AMI from any EC2 instance.
EC2 Image Builder              # automates image build (to a schedule or to when packages are updated)
                               # it includes creation and instanciation


# --------------------------------------- EC2 STORAGE ---------------------------------------
EBS                            # Elastic Block Store. Default storage choice in UI. (kind of a "network USB stick") 
                               # Is a network drive that can be attached/dettached and persisted independently. 
                               # So, information can stay in the drive even after vm is terminated. (Detele on Termination=False) 
                               # can only be mounted at one instance at a time and is bound to specific availability zone.
     
Snapshot                       # Is an incremental point-in-time copy of an EBS used for backup.
                               # Snapshoot Archive is a 75% cheaper alternative that takes 24-72 hours to restore (for long time storage).

Recycle Bin                    # is a way to protect resource for accidental deletion. A retention rule can be set.

EC2 Instance Store             # high performance hardware disk (faster than EBS)
                               # when instance is terminated data is lost (ephemeral)

EFS                            # Elastic File System. Network file system that can be mounted to 100s of EC2s
                               # Only for Linux-EC2 and multi-AZ

EFS Infrequent Access          # cost-optimized for files that are not accessed every day (92% cheaper)
                               # moving files can be done with a lifecycle policy

FSs                            # 3rd party file systems on AWS
                               # FSx for Windows File Server
                               # FSx for Lustre (Linux + cluster). High performance computing like machine learning