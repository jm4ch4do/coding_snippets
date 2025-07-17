# ----------------------------------------------- SECURITY -------------------------------------------
DDoS Attack                      # To protect against denial-of-service attack.
  - Shield Standard              # AWS provides this shield which is enabled by default to all customers at no cost.
  - Shield Advanced              # you can pay for advance protection and extra features.
  - Web App Firewall (WAF)       # Layer 7 Firewall to protect againts web exploits like SQL Injection and Cross-Site Scripting (XSS).
                                 # Has size constrains and can block countries.
  - Route53                      # Combined with Shield it provides attack mitigation at the edge using global edge network.
  - AutoScaling Group            # Automatically scales to handles additional demand

AWS Network Firewall             # Protects your VPC from Layer 3 to Layer 7
AWS Firewall Manager             # Allows managing all of your firewalls in one place. Includes Security Groups, Load Balancers, etc
                                 # Also includes Shield and WAF.
Penetration_Testing              # AWS customers are welcome to carry out penetration tests without prior approval for 8 services:
                                 # EC2 and Load Balancers, RDS, CloudFront, Aurora, API Gateways, Lambda, Lightsail and Beanstalk.
                                 # Denial of Service is prohibited and many others.

Amazon_Inspector                 # Automated Security Assessments for EC2s, container images, lambda. Uses database of vulnerabilities to assess.
GuardDuty                        # Machine learning threat discovery. Analyzer CloudTrail Logs, VPC Flow Logs, DNS logs...
                                 # Specially useful againts crypto currency attack.

AWS Config                       # Paid service to record curernt config and changes. Can set rules to check compliancy. Can be analyzed by Athena.
Macie                            # Machine learning service to identify and alert on sensitive data.
Security Hub                     # Central security tool to manage security across several AWS accounts. Uses dashboards to show security and compliance status.
Detective                        # Deeper analysis on how security threads happen. Focused on finding the causes on the threads using ML and graphs. 
Abuse                            # You can report to AWS if you suspect any service is being abused or used for ilegal purposes. Ex. Spam, Malwares, DoS attacks
IAM Access Analyzer              # Finds out which resources are shared externally. You define a Zone ofTrust within you account or organization.


# ---------------------------------------------- ENCRYPTION ------------------------------------------
KMS (Key Management Service)     # Encryption service were AWS manages the keys.
CloudHSM                         # AWS provides the encryption hardaware Hardware Security Module and the user handles encryption keys.
 - Customer Managed Keys         # User creates and manages the key. Can set the rotation policy and can bring it's own key.
 - AWS Managed Key               # AWS creates and manages the key on the customer's behalf. Used by AWS services (aws/s3, aws/ebs ...)
 - AWS Owned Key                 # Collection of keys that AWS owns and manages to use in multiple accounts.
 - CloudHSMKeys(custom_key_store) # Keys are generated from your own CloudHSM hardware device and operations are performed within the CloudHSM cluster.

AWS Certificate Manager (ACM)    # Let's you create, manage and deploy SSL/TLS certificates. Certificates provide in-flight encryption for websites (HTTPS).
                                 # Works together with the Load Balancer to encrypt before traffic leaves the AWS network providing HTTPS.
                                 # Has automatic certificate renewal and integrates with multiple services.
Secret Manager                   # Stores secrets and you can force rotation of secrets. Paid service.
AWS Artifact                     # Provides access to AWS compliance documentation and AWS agreements. Use for internal audit or compliance.














