# --------------------------------------------- ORGANIZATIONS ----------------------------------------
Organizations                          # the main account is the master account and you can create many other accounts under the same organization.
                                       # main benefit is that you get consolidated billing through a single payment method.
                                       # Also, you get price reductions for aggregated usage (lots of usage of a single resource)
                                       # API is available to automate AWS account creation
                                       # You can restrict account privileges using Service Control Policies (SCP)
Control Tower                          # Easy way to govern a multi-account based on best practice. It maintains organizations for you.
                                       # You have to provide Organizational Units (OU) and general principles and it does the config for you.

AWS RAM                                # Resource Access Manager (RAM). You can share resources with other accounts.
Service Catalog                        # Creates a collection of products for certain accounts to use. It uses CloudFormation Templates.
                                       # Products are ready to use, properly configured and properly tagged.


# -------------------------------------------- COSTS SAVINGS -----------------------------------------
Pricing_Models
 - pay_as_you_go                       # Pay for what you use
 - save_when_you_reserve               # save, have predictable budgets.
 - pay_less_by_using_more              # volume based discounts
 - pay_less_as_aws_grows               # as AWS grows, they reduce prices (every year)
 - free_services                       # IAM, VPC, Consolidated Billing, Elastic Beanstalk, CloudFormation, AutoScalingGroups
 - free_tier                           # EC2 t2.micro instance for a year and others

Savings_Plans                          # You commit to a dollar amount for 1 or 3 years. It gives you flexibility to choose the instances
                                       # and to turn then off/on. It can be used for ec2s, lambdas and ai.
                                       # Reserved instances are similar but you focus on specific instances instead of dollar amounts. So, they are less flexible.
Compute_Optimizer                      # It analyzes the workload overtime of instances and services and gives you recommendations to scale up or down.


# ------------------------------------------ COST VISUALIZATION --------------------------------------
Pricing_calculator                     # To make estimates in advance for the cost of your resources.
Billing Dashboard                      # Visual interface with graphs to view costs. 
                                       # You can create resource groups pointing to tags to separate visualization for certain resources.
Cost_Explorer                          # Visual Tool to explore details. Show graphs per hour and month. Used to make forecast for next 12 upcoming months.
Cost_and_Usage_Report                  # Deeper detailed review of costs. The report is a sheet that can be imported to Athena or others.
Data_Exports                           # Allows to export cost by selecting specific fields.


# ----------------------------------------------- BILLING --------------------------------------------
Billing_alarms                         # notifies when the cost surpases a value. Billing is only available in a us-east-1
Budgets                                # send alarm when cost exceeds the budget.
 - Types                               # Usage, Cost, Reservation, Savings Plans
Cost Anomaly Detection                 # Uses ML to detect unusual spends
Service Quotas                         # AWS sets limits for services. For example, 20 EC2s is the limit per region. You can change this soft limit.
                                       # Others, are hard limits which you cannot change. For example, 100 buckets is the max per account.
Trusted Advisor                        # Provides basic recommendations on cost optimization, performance, security, service limits, fault tolerance.
                                       # For example, it notifies you if you're using the root account for config or if you don't have snapshots.
                                       # If you pay for the Business & Enterprise Support Plan you get the full set of checks.
Support_Plans
 - Basic                               # Customer Service 24/7, documentation and support forums. 7 Core checks of trusted advisors and personal health dashboard.
 - Developer                           # Business hours email access to support associates for unlimited cases.
 - Business                            # Full set of checks for Trusted Advisor. 24x7 phone, email and chat access to support engineers. Response times are better.
 - Enterprise On-Ramp                  # Access to a pool of Technical Account Managers. Concierge Support Team for billing and account best practices.
                                       # Infrastructure Event Management, Well-Architected & Operations Reviews. Plus better response times. 4h/1h/30min
 - Enterprise Support                  # Designated Technical Account Manager. Access to Incident Detection and Response. 4h/1h/15min






