# ------------------------------------------------- DNS ----------------------------------------------
Route53                          # serverless, managed DNS. You pay for hosted zones and queries made.
  - Types of Records
    A_record                     # Maps url to IPv4
    AAAA                         # Maps url to IPv6
    CNAME                        # Maps url to url
    Alias                        # Maps url to AWS resource
  - Routing Policies
    Simple                       # No health checks, converts url to ip
    Weighted                     # Distributes traffic to different ips based on pre-defined percentages
    Latency                      # IP returned guarantees the user connects to server closest to them
    Failover                     # Health check on the primary, and redirects to failover if it fails


# ------------------------------------------------- EDGE ---------------------------------------------
CloudFront                       # Content Delivery Network (CDN). Content is cached at the edge. 
                                 # AWS has over 200 Points of Presence Globally where CDNs are used.
S3_Transfer_Acceleration         # Loads file from US to Edge location first and then internally to S3 bucket in Australia.
                                 # This is much faster than uploading directly to Australia.       
Global_Accelerator               # Use the internal private AWS network for faster access to application. User connects only to Edge.                         

Outposts                         # Managed server racks that offer the same AWS services but on-premises.

WaveLenght_Zones                 # Deploys services at the end of 5G Telecom networks to provide Ultra-low latency.      
                                 # A WaveLenght zone is created that can connect to a region. (zones disabled by default)
Local_Zones                      # Besides Availability Zones, you can create Local zones that come even closer to users in their own cities.
                                 # You can deploy most of the services in this local zones. (zones disabled by default)











