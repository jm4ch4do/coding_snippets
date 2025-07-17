# ------------------------------------------------- VPC ----------------------------------------------
IPv4, IPv6                            # In IPv6 all IPs are public. IPv6s are free on AWS. IPv4 is only free for a limited time.
Elastic IP                            # IP will not change when you start/stop EC2
Default Network                       # Is the VPC where new instances are created by default.

VPC (Virtual Private Cloud)           # Private Network link to a region. You can have multiple subnets inside the VPC.
 - public subnet                      # The default network usually has multiple plublic subnets by default depending on what you have created before.
 - private subnet

Internet Gateway                      # Point of contact between your public network and Internet
NAT Gateway                           # Translates address for the private network to access Internet

NACL (Network_Access_control_List)    # Firewall at the subnet level. Rules can be ALLOW or DENY and reference IP addresses. Stateless
Security_Groups                       # Firewall at EC2 level. They only have ALLOW rules and reference IPs and other groups. Stateful
                                      # They operatate at EC2 level.
Flow Logs                             # Helps monitoring and troubleshooting connectivity issues.

# ----------------------------------------------- PEERING --------------------------------------------
VPC Peering                           # Allows connecting two VPCs and make them behave as if they were the same network.
                                      # Peering connections don't work as bridges, meaning that to connect to VPC A and B
                                      # You need to peer with both, even if they are already connected as peers.

VPC Endpoints                         # By creating an endpoint you are allowed to connect to services with enhanced security
                                      # and lower latency through an AWS private network.
 - Types                            
   * Gateway                          # For connecting to S3 & DynamoDB
   * Interface                        # To connect to any other service.

 - PrivateLink                        # Used for connecting 100s of VPCs to a service because peering is difficult to scale.


# ------------------------------------------------- VPN ----------------------------------------------
Site-to-Site VPN                      # VPN over Internet to connect your on-premises datacenter to AWS
                                      # You use a Customer Gateway (CGW) on your side and a Virtual Private Gateway (VGW)
Direct Connect (DX)                   # Stablish a dedicated physical connection with AWS.

Client VPN                            # Connect from your computer using OpenVPN to your private networkin AWS and on-premises
                                      # You connect to EC2s as if you were on the private network.


# ----------------------------------------------- OTHERS ---------------------------------------------
Transit Gateway                       # Is a simplified way to interconnect using a star model.
                                      # Everything connected to the Transit Gateway have visibility over the rest.
                                      # It can connect multiple VPNs and also your on-premise site.






